# Zero-dependency PowerShell HTTP Server for ExpenseFlow Web App
param([int]$Port = 8080)

$Root = Split-Path -Parent $MyInvocation.MyCommand.Definition
$Prefix = "http://localhost:$Port/"

$Listener = New-Object System.Net.HttpListener
$Listener.Prefixes.Add($Prefix)

try {
    $Listener.Start()
    Write-Host "==========================================================" -ForegroundColor Cyan
    Write-Host "  ExpenseFlow Web App is running!" -ForegroundColor Green
    Write-Host "  URL: $Prefix" -ForegroundColor Yellow
    Write-Host "  Serving from: $Root" -ForegroundColor Gray
    Write-Host "  Press Ctrl+C in this terminal to stop the server." -ForegroundColor DarkGray
    Write-Host "==========================================================" -ForegroundColor Cyan

    Start-Process $Prefix

    while ($Listener.IsListening) {
        $Context = $Listener.GetContext()
        $Request = $Context.Request
        $Response = $Context.Response

        $LocalPath = $Request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($LocalPath)) {
            $LocalPath = 'index.html'
        }

        $FilePath = Join-Path $Root ($LocalPath -replace '/', '\')

        if (Test-Path $FilePath -PathType Leaf) {
            $Ext = [System.IO.Path]::GetExtension($FilePath).ToLower()
            $ContentType = switch ($Ext) {
                '.html' { 'text/html; charset=utf-8' }
                '.css'  { 'text/css; charset=utf-8' }
                '.js'   { 'application/javascript; charset=utf-8' }
                '.json' { 'application/json; charset=utf-8' }
                '.png'  { 'image/png' }
                '.jpg'  { 'image/jpeg' }
                '.svg'  { 'image/svg+xml' }
                default { 'application/octet-stream' }
            }

            $Bytes = [System.IO.File]::ReadAllBytes($FilePath)
            $Response.ContentType = $ContentType
            $Response.ContentLength64 = $Bytes.Length
            $Response.OutputStream.Write($Bytes, 0, $Bytes.Length)
        } else {
            $Response.StatusCode = 404
            $NotFoundMsg = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $Response.OutputStream.Write($NotFoundMsg, 0, $NotFoundMsg.Length)
        }

        $Response.OutputStream.Close()
    }
}
catch {
    Write-Host "Server encountered an error: $_" -ForegroundColor Red
}
finally {
    if ($Listener.IsListening) {
        $Listener.Stop()
    }
    $Listener.Close()
}
