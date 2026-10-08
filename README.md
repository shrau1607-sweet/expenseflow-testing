# 💰 ExpenseFlow — Modern Expense & Financial Management Web App

> **A fast, zero-dependency, full-featured Expense Management website** built with modern web technologies, real-time analytics, category budgeting, receipt tracking, and local storage persistence.

---

## 🌟 Key Highlights & Features

### 1. 📊 Real-Time Financial Intelligence
- **Total Expenses & Inflow**: Real-time aggregation of income, expenses, and net reserve balance.
- **Savings Rate Calculation**: Tracks the percentage of income retained over selected periods.
- **Monthly Budget Remaining**: Visual progress meter with green / amber / red threshold alerts.
- **Daily Spending Burn Rate**: Averages daily burn across active transaction days.

### 2. 📈 Interactive Visual Analytics (Chart.js)
- **Category Breakdown**: Interactive Donut chart displaying expense percentage distribution per category with total spent centered.
- **6-Month Cash Flow**: Monthly Bar chart comparing Total Income vs. Total Expenses chronologically.
- **Spending Trajectory**: Smooth bezier line chart showing recent daily spending spikes and trends.

### 3. 🎯 Category Budgets & Smart Alerts
- Set monthly budget targets for individual categories (Housing, Groceries, Dining, Transport, etc.).
- Real-time progress bars showing percentage consumed.
- **Smart Spending Alerts**: Banner automatically detects and warns when total or category spending crosses 80% or exceeds 100%.

### 4. 🧾 Transaction Management & Receipts
- **Complete CRUD**: Create, Edit, Duplicate (1-click repeat), and Delete transactions.
- **Receipt Attachment & Modal Preview**: Upload real receipts (images or PDFs), automatically converted and stored for instant full-resolution preview.
- **Multi-Currency Support**: Switch between **USD ($)**, **EUR (€)**, **GBP (£)**, **INR (₹)**, **JPY (¥)**, **CAD (CA$)**, and **AUD (AU$)** with instant recalculation.
- **Tags & Metadata**: Filter by `#reimbursable`, `#tax-deductible`, `#work`, etc.

### 5. 🔍 Multi-Dimensional Query Engine
- **Live Search**: Instant text search across descriptions, merchants, tags, and notes.
- **Filter Matrix**: Filter by Category, Time Period (This Month, Last 7 Days, Today, Last Month, Custom Date Range), Payment Method, Flow Type (Expense vs Income), and Status (Paid, Pending, Reimbursable).
- **Multi-Sorting**: Sort by Date (newest/oldest), Amount (highest/lowest), or Title (A–Z).

### 6. 📤 Data Portability & Audit Reports
- **Export to CSV**: RFC-4180 compliant CSV export for Excel and Google Sheets.
- **Printable Audit Report**: Clean print stylesheet for generating PDF statements or hardcopy audit reports.
- **Backup & Restore**: Export full JSON database and restore across browsers or devices.

---

## 🚀 How to Launch & Run

### Method 1: Instant Launch (Zero Setup)
Simply double-click `index.html` or double-click `start.bat`. It will immediately open in Google Chrome, Microsoft Edge, or your default browser with 100% functionality.

### Method 2: Local HTTP Server (PowerShell)
To serve via a local HTTP server on `http://localhost:8080`:
```powershell
powershell -ExecutionPolicy Bypass -File .\serve.ps1
```
This script uses Windows' built-in `System.Net.HttpListener` without requiring Node.js or Python!

---

## 📁 Directory Structure
```
expense-tracker-app/
├── index.html          # Main HTML5 application interface
├── css/
│   └── styles.css      # Typography, glassmorphism, animations, print stylesheet
├── js/
│   ├── app.js          # Core state engine, filters, CRUD, modal controls, toasts
│   ├── data.js         # Default categories, sample transactions, receipt generator
│   ├── charts.js       # Chart.js visualizations (Donut, Bar, Line charts)
│   └── export.js       # CSV, JSON backup/restore, and print statement generator
├── serve.ps1           # Zero-dependency PowerShell HTTP server (port 8080)
├── start.bat           # 1-click Windows launcher
└── README.md           # Documentation & guides
```

---

## 💡 Tech Stack
- **UI & Layout**: HTML5, Tailwind CSS (via CDN)
- **Icons**: Lucide Icons
- **Visualizations**: Chart.js 4.x
- **Interactions**: Canvas-Confetti, Custom Glassmorphism CSS
- **Storage**: Client-Side `localStorage` with offline support
