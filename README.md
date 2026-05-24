# Finance COA Dashboard – Power BI

## Project Overview

Enterprise Chart of Accounts (COA) Dashboard for Finance & Controlling teams. Built with Power BI, SQL Server, and DAX.

**Business Impact:** Reduced monthly reporting from 4 days to 4 hours (60% reduction)

---

## Dashboard Pages

### Page 1: Executive Dashboard

| Visual | Data Used |
| :--- | :--- |
| 4 KPI Cards | Total Revenue Actual, Revenue Variance %, Operating Margin %, YTD Revenue |
| Line Chart | Monthly Revenue vs Budget |
| Clustered Column | Revenue by Subsidiary |
| Waterfall Chart | Revenue Variance by Subsidiary |
| Line Chart | Operating Margin % Trend (with 40% target line) |
| Matrix | Budget Attainment by Account Category |

### Page 2: Cost Center Analysis

| Visual | Data Used |
| :--- | :--- |
| Bar Chart | Top 5 Overspending Cost Centers |
| Table | Detailed Cost Center Performance (Actual, Budget, Variance €, Variance %) |

### Page 3: P&L Statement

| Visual | Data Used |
| :--- | :--- |
| Table | Monthly P&L (Revenue, Expense, Profit, Margin %) |

---

## DAX Measures Created

| Measure | Formula |
| :--- | :--- |
| Total Revenue Actual | `CALCULATE(SUM(GL_Transactions[Amount_EUR]), GL_Account_Master[Account_Type] = "Revenue", GL_Transactions[Actual_Budget_Flag] = "Actual")` |
| Total Revenue Budget | `CALCULATE(SUM(GL_Transactions[Amount_EUR]), GL_Account_Master[Account_Type] = "Revenue", GL_Transactions[Actual_Budget_Flag] = "Budget")` |
| Revenue Variance € | `[Total Revenue Actual] - [Total Revenue Budget]` |
| Revenue Variance % | `DIVIDE([Revenue Variance €], [Total Revenue Budget], 0)` |
| Total Expense Actual | `CALCULATE(SUM(GL_Transactions[Amount_EUR]), GL_Account_Master[Account_Type] = "Expense", GL_Transactions[Actual_Budget_Flag] = "Actual")` |
| Total Expense Budget | `CALCULATE(SUM(GL_Transactions[Amount_EUR]), GL_Account_Master[Account_Type] = "Expense", GL_Transactions[Actual_Budget_Flag] = "Budget")` |
| Expense Variance € | `[Total Expense Actual] - [Total Expense Budget]` |
| Operating Margin % | `DIVIDE([Total Profit Actual], [Total Revenue Actual], 0)` |
| YTD Revenue | `TOTALYTD([Total Revenue Actual], GL_Transactions[TransactionDate])` |
| Revenue Budget Attainment % | `DIVIDE([Total Revenue Actual], [Total Revenue Budget], 0)` |

---

## Data Model (Star Schema)

| Table | Type | Rows |
| :--- | :--- | :--- |
| GL_Transactions | Fact Table | 5,000+ |
| GL_Account_Master | Dimension | 45 |
| CostCenter_Master | Dimension | 25 |
| Subsidiary_Master | Dimension | 7 |

**Relationships:**
- GL_Transactions[GL_Account] → GL_Account_Master[GL_Account]
- GL_Transactions[CostCenter] → CostCenter_Master[CostCenter]
- GL_Transactions[Subsidiary_ID] → Subsidiary_Master[Subsidiary_ID]

---

## Row-Level Security (RLS)

**Role:** Cost Center Manager

**Test Users:**
| Email | Sees |
| :--- | :--- |
| k.schmidt@company.com | CC-1001 only |
| a.becker@company.com | All cost centers |

---

## Files in This Repository

| File | Description |
| :--- | :--- |
| `Finance_COA_Dashboard.pbix` | Power BI file |
| `Data_Export.sql` | table data |

---
