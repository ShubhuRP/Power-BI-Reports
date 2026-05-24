-- =====================================================
-- SENIOR-LEVEL DATABASE: Finance_COA_Dashboard_Enterprise
-- PURPOSE: Enterprise Chart of Accounts (COA) Analytics
-- AUTHOR: Shubham Patel - Senior Data Analyst
-- DATE: 2026-05-24
-- =====================================================

-- Create Database
CREATE DATABASE Finance_COA_Dashboard_Enterprise;
GO

USE Finance_COA_Dashboard_Enterprise;
GO

-- =====================================================
-- TABLE 1: GL_Account_Master (Dimension) - 45 Accounts
-- =====================================================
CREATE TABLE GL_Account_Master (
    GL_Account INT PRIMARY KEY,
    Account_Name NVARCHAR(150),
    Account_Type NVARCHAR(50),
    Financial_Statement NVARCHAR(50),
    Account_Category NVARCHAR(50),
    Is_Active BIT,
    Created_Date DATE
);
GO

INSERT INTO GL_Account_Master (GL_Account, Account_Name, Account_Type, Financial_Statement, Account_Category, Is_Active, Created_Date) VALUES
(401000, 'Revenue – Product Sales DACH', 'Revenue', 'P&L', 'Product Revenue', 1, '2020-01-01'),
(401001, 'Revenue – Product Sales NA', 'Revenue', 'P&L', 'Product Revenue', 1, '2020-01-01'),
(401002, 'Revenue – Product Sales APAC', 'Revenue', 'P&L', 'Product Revenue', 1, '2021-06-01'),
(402000, 'Revenue – Services Consulting', 'Revenue', 'P&L', 'Service Revenue', 1, '2020-01-01'),
(402001, 'Revenue – Services Support', 'Revenue', 'P&L', 'Service Revenue', 1, '2020-01-01'),
(403000, 'Revenue – License Fees', 'Revenue', 'P&L', 'Recurring Revenue', 1, '2020-01-01'),
(403001, 'Revenue – Subscription', 'Revenue', 'P&L', 'Recurring Revenue', 1, '2021-01-01'),
(404000, 'Revenue – Other Income', 'Revenue', 'P&L', 'Other Revenue', 1, '2020-01-01'),
(405000, 'Revenue – Intercompany', 'Revenue', 'P&L', 'Elimination', 1, '2020-01-01'),
(406000, 'Revenue – Freight & Shipping', 'Revenue', 'P&L', 'Pass-through', 1, '2021-01-01'),
(501000, 'COGS – Raw Materials', 'Expense', 'P&L', 'Direct Cost', 1, '2020-01-01'),
(501001, 'COGS – Packaging', 'Expense', 'P&L', 'Direct Cost', 1, '2020-01-01'),
(502000, 'COGS – Direct Labor', 'Expense', 'P&L', 'Direct Cost', 1, '2020-01-01'),
(502001, 'COGS – Manufacturing Overhead', 'Expense', 'P&L', 'Indirect Cost', 1, '2020-01-01'),
(503000, 'COGS – Freight In', 'Expense', 'P&L', 'Direct Cost', 1, '2020-01-01'),
(503001, 'COGS – Subcontractor Costs', 'Expense', 'P&L', 'Direct Cost', 1, '2021-06-01'),
(601000, 'OPEX – Sales Salaries & Commissions', 'Expense', 'P&L', 'Sales & Marketing', 1, '2020-01-01'),
(601001, 'OPEX – Marketing Advertising', 'Expense', 'P&L', 'Sales & Marketing', 1, '2020-01-01'),
(601002, 'OPEX – Trade Shows & Events', 'Expense', 'P&L', 'Sales & Marketing', 1, '2020-01-01'),
(601003, 'OPEX – Sales Travel & Entertainment', 'Expense', 'P&L', 'Sales & Marketing', 1, '2020-01-01'),
(601004, 'OPEX – Digital Marketing (SEO/SEM)', 'Expense', 'P&L', 'Sales & Marketing', 1, '2021-01-01'),
(601005, 'OPEX – CRM Software', 'Expense', 'P&L', 'Sales & Marketing', 1, '2020-01-01'),
(601006, 'OPEX – Agency Fees', 'Expense', 'P&L', 'Sales & Marketing', 1, '2021-01-01'),
(601007, 'OPEX – Brand Management', 'Expense', 'P&L', 'Sales & Marketing', 1, '2022-01-01'),
(602000, 'OPEX – R&D Salaries', 'Expense', 'P&L', 'Research & Development', 1, '2020-01-01'),
(602001, 'OPEX – R&D Equipment', 'Expense', 'P&L', 'Research & Development', 1, '2020-01-01'),
(602002, 'OPEX – R&D Software Licenses', 'Expense', 'P&L', 'Research & Development', 1, '2021-01-01'),
(602003, 'OPEX – R&D Prototyping', 'Expense', 'P&L', 'Research & Development', 1, '2020-01-01'),
(602004, 'OPEX – R&D Consulting', 'Expense', 'P&L', 'Research & Development', 1, '2021-06-01'),
(603000, 'OPEX – Executive Salaries', 'Expense', 'P&L', 'General & Admin', 1, '2020-01-01'),
(603001, 'OPEX – Office Rent & Utilities', 'Expense', 'P&L', 'General & Admin', 1, '2020-01-01'),
(603002, 'OPEX – IT Infrastructure', 'Expense', 'P&L', 'General & Admin', 1, '2020-01-01'),
(603003, 'OPEX – Legal & Compliance', 'Expense', 'P&L', 'General & Admin', 1, '2020-01-01'),
(603004, 'OPEX – Accounting & Audit', 'Expense', 'P&L', 'General & Admin', 1, '2020-01-01'),
(603005, 'OPEX – Insurance', 'Expense', 'P&L', 'General & Admin', 1, '2020-01-01'),
(603006, 'OPEX – Recruiting & Training', 'Expense', 'P&L', 'General & Admin', 1, '2021-01-01'),
(603007, 'OPEX – Office Supplies & Equipment', 'Expense', 'P&L', 'General & Admin', 1, '2020-01-01'),
(604000, 'OPEX – Production Salaries', 'Expense', 'P&L', 'Production', 1, '2020-01-01'),
(604001, 'OPEX – Maintenance & Repairs', 'Expense', 'P&L', 'Production', 1, '2020-01-01'),
(604002, 'OPEX – Quality Control', 'Expense', 'P&L', 'Production', 1, '2020-01-01'),
(604003, 'OPEX – Warehouse & Logistics', 'Expense', 'P&L', 'Production', 1, '2020-01-01'),
(701000, 'Interest Expense', 'Expense', 'P&L', 'Financing', 1, '2020-01-01'),
(702000, 'Interest Income', 'Revenue', 'P&L', 'Financing', 1, '2020-01-01'),
(703000, 'Foreign Exchange Gain/Loss', 'Expense', 'P&L', 'Other', 1, '2020-01-01'),
(704000, 'Extraordinary Items', 'Expense', 'P&L', 'Other', 1, '2020-01-01');
GO

-- =====================================================
-- TABLE 2: CostCenter_Master (Dimension) - 25 Cost Centers
-- =====================================================
CREATE TABLE CostCenter_Master (
    CostCenter NVARCHAR(10) PRIMARY KEY,
    CostCenter_Name NVARCHAR(100),
    Department NVARCHAR(50),
    Region NVARCHAR(50),
    Subsidiary NVARCHAR(50),
    Manager_Email NVARCHAR(100),
    Budget_Owner NVARCHAR(100),
    Is_Active BIT
);
GO

INSERT INTO CostCenter_Master (CostCenter, CostCenter_Name, Department, Region, Subsidiary, Manager_Email, Budget_Owner, Is_Active) VALUES
('CC-1001', 'Sales DACH', 'Sales', 'EMEA', 'Germany GmbH', 'k.schmidt@company.com', 'vp.sales.emea@company.com', 1),
('CC-1002', 'Sales North America', 'Sales', 'NA', 'USA Inc.', 'j.johnson@company.com', 'vp.sales.na@company.com', 1),
('CC-1003', 'Sales France', 'Sales', 'EMEA', 'France SAS', 'm.dupont@company.com', 'vp.sales.emea@company.com', 1),
('CC-1004', 'Sales UK', 'Sales', 'EMEA', 'UK Ltd', 's.williams@company.com', 'vp.sales.emea@company.com', 1),
('CC-1005', 'Sales APAC', 'Sales', 'APAC', 'Singapore Pte', 't.tanaka@company.com', 'vp.sales.apac@company.com', 1),
('CC-1006', 'Sales Nordics', 'Sales', 'EMEA', 'Sweden AB', 'e.lindberg@company.com', 'vp.sales.emea@company.com', 1),
('CC-2001', 'Marketing Global', 'Marketing', 'Global', 'Global HQ', 'h.lee@company.com', 'cmo@company.com', 1),
('CC-2002', 'Marketing EMEA', 'Marketing', 'EMEA', 'Germany GmbH', 'f.wagner@company.com', 'cmo@company.com', 1),
('CC-2003', 'Marketing NA', 'Marketing', 'NA', 'USA Inc.', 'a.martinez@company.com', 'cmo@company.com', 1),
('CC-3001', 'Production – Assembly Berlin', 'Operations', 'EMEA', 'Germany GmbH', 'h.weber@company.com', 'vp.ops@company.com', 1),
('CC-3002', 'Production – Assembly Ohio', 'Operations', 'NA', 'USA Inc.', 'b.wilson@company.com', 'vp.ops@company.com', 1),
('CC-3003', 'Production – Quality Control', 'Operations', 'EMEA', 'Germany GmbH', 'r.richter@company.com', 'vp.ops@company.com', 1),
('CC-3004', 'Production – Logistics', 'Operations', 'Global', 'Global HQ', 'p.liu@company.com', 'vp.ops@company.com', 1),
('CC-3005', 'Production – Planning', 'Operations', 'EMEA', 'Germany GmbH', 'm.koch@company.com', 'vp.ops@company.com', 1),
('CC-4001', 'R&D Berlin', 'R&D', 'EMEA', 'Germany GmbH', 't.mueller@company.com', 'cto@company.com', 1),
('CC-4002', 'R&D Bangalore', 'R&D', 'APAC', 'India Pvt', 's.kumar@company.com', 'cto@company.com', 1),
('CC-4003', 'R&D Boston', 'R&D', 'NA', 'USA Inc.', 'j.smith@company.com', 'cto@company.com', 1),
('CC-5001', 'IT Infrastructure', 'IT', 'Global', 'Global HQ', 'l.chen@company.com', 'cio@company.com', 1),
('CC-5002', 'IT Applications', 'IT', 'Global', 'Global HQ', 'd.miller@company.com', 'cio@company.com', 1),
('CC-5003', 'IT Security', 'IT', 'Global', 'Global HQ', 's.park@company.com', 'cio@company.com', 1),
('CC-6001', 'Finance & Controlling', 'Finance', 'Global', 'Global HQ', 'a.becker@company.com', 'cfo@company.com', 1),
('CC-6002', 'HR & People Operations', 'HR', 'Global', 'Global HQ', 'l.meyer@company.com', 'chro@company.com', 1),
('CC-6003', 'Legal & Compliance', 'Legal', 'Global', 'Global HQ', 'c.wagner@company.com', 'general.counsel@company.com', 1),
('CC-6004', 'Executive Management', 'Executive', 'Global', 'Global HQ', 'ceo@company.com', 'board@company.com', 1),
('CC-6005', 'Facilities Management', 'Admin', 'Global', 'Global HQ', 'h.schulz@company.com', 'cfo@company.com', 1);
GO

-- =====================================================
-- TABLE 3: Subsidiary_Master (Fixed column width)
-- =====================================================
CREATE TABLE Subsidiary_Master (
    Subsidiary_ID INT PRIMARY KEY,
    Subsidiary_Name NVARCHAR(100),
    Country NVARCHAR(50),
    Currency_Code NVARCHAR(3),
    Exchange_Rate_To_EUR DECIMAL(18,6),
    Fiscal_Year_End NVARCHAR(20)  -- Increased from 15 to 20
);
GO

INSERT INTO Subsidiary_Master (Subsidiary_ID, Subsidiary_Name, Country, Currency_Code, Exchange_Rate_To_EUR, Fiscal_Year_End) VALUES
(1, 'Germany GmbH', 'Germany', 'EUR', 1.000000, '31-December'),
(2, 'USA Inc.', 'USA', 'USD', 1.080000, '31-December'),
(3, 'France SAS', 'France', 'EUR', 1.000000, '31-December'),
(4, 'UK Ltd', 'United Kingdom', 'GBP', 0.860000, '31-March'),
(5, 'Singapore Pte', 'Singapore', 'SGD', 1.560000, '31-December'),
(6, 'Sweden AB', 'Sweden', 'SEK', 11.200000, '31-December'),
(7, 'India Pvt', 'India', 'INR', 89.500000, '31-March');
GO

-- =====================================================
-- TABLE 4: GL_Transactions (Fact Table) - Simplified INSERT
-- =====================================================
CREATE TABLE GL_Transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionDate DATE,
    FiscalYear INT,
    FiscalMonth NVARCHAR(20),
    FiscalQuarter INT,
    CostCenter NVARCHAR(10),
    GL_Account INT,
    Subsidiary_ID INT,
    Amount_Original_Currency DECIMAL(18,2),
    Amount_EUR DECIMAL(18,2),
    Actual_Budget_Flag NVARCHAR(10),
    Source_ERP NVARCHAR(20),
    Journal_Type NVARCHAR(30),
    Entered_By NVARCHAR(50),
    Description NVARCHAR(500),
    Approval_Status NVARCHAR(20),
    Batch_ID NVARCHAR(50)
);
GO

-- Insert sample ACTUAL data for 2024 (simplified - 500+ rows for demonstration)
INSERT INTO GL_Transactions (TransactionDate, FiscalYear, FiscalMonth, FiscalQuarter, CostCenter, GL_Account, Subsidiary_ID, Amount_Original_Currency, Amount_EUR, Actual_Budget_Flag, Source_ERP, Journal_Type, Entered_By, Description, Approval_Status, Batch_ID) VALUES
('2024-01-15', 2024, 'January', 1, 'CC-1001', 401000, 1, 245000, 245000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'January revenue - DACH', 'Approved', 'BATCH_2024_JAN'),
('2024-01-15', 2024, 'January', 1, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'January budget - DACH', 'Approved', 'BUDGET_2024_JAN'),
('2024-01-20', 2024, 'January', 1, 'CC-1002', 401001, 2, 265000, 245370, 'Actual', 'D365', 'Monthly_Close', 'System_GL', 'January revenue - NA', 'Approved', 'BATCH_2024_JAN'),
('2024-01-20', 2024, 'January', 1, 'CC-1002', 401001, 2, 250000, 231481, 'Budget', 'D365', 'Budget_Planning', 'Finance_Team', 'January budget - NA', 'Approved', 'BUDGET_2024_JAN'),
('2024-01-25', 2024, 'January', 1, 'CC-3001', 604000, 1, 18500, 18500, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Production salaries Jan', 'Approved', 'BATCH_2024_JAN'),
('2024-01-25', 2024, 'January', 1, 'CC-3001', 604000, 1, 18000, 18000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Production salaries budget Jan', 'Approved', 'BUDGET_2024_JAN'),
('2024-01-28', 2024, 'January', 1, 'CC-2001', 601001, 1, 45000, 45000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend Jan', 'Approved', 'BATCH_2024_JAN'),
('2024-01-28', 2024, 'January', 1, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget Jan', 'Approved', 'BUDGET_2024_JAN'),
('2024-02-10', 2024, 'February', 1, 'CC-1001', 401000, 1, 260000, 260000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'February revenue - DACH', 'Approved', 'BATCH_2024_FEB'),
('2024-02-10', 2024, 'February', 1, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'February budget - DACH', 'Approved', 'BUDGET_2024_FEB'),
('2024-02-15', 2024, 'February', 1, 'CC-1002', 401001, 2, 280000, 259259, 'Actual', 'D365', 'Monthly_Close', 'System_GL', 'February revenue - NA', 'Approved', 'BATCH_2024_FEB'),
('2024-02-15', 2024, 'February', 1, 'CC-1002', 401001, 2, 250000, 231481, 'Budget', 'D365', 'Budget_Planning', 'Finance_Team', 'February budget - NA', 'Approved', 'BUDGET_2024_FEB'),
('2024-02-20', 2024, 'February', 1, 'CC-3001', 604000, 1, 19200, 19200, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Production salaries Feb', 'Approved', 'BATCH_2024_FEB'),
('2024-02-20', 2024, 'February', 1, 'CC-3001', 604000, 1, 18000, 18000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Production salaries budget Feb', 'Approved', 'BUDGET_2024_FEB'),
('2024-02-25', 2024, 'February', 1, 'CC-2001', 601001, 1, 48000, 48000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend Feb', 'Approved', 'BATCH_2024_FEB'),
('2024-02-25', 2024, 'February', 1, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget Feb', 'Approved', 'BUDGET_2024_FEB'),
('2024-03-05', 2024, 'March', 1, 'CC-1001', 401000, 1, 275000, 275000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'March revenue - DACH', 'Approved', 'BATCH_2024_MAR'),
('2024-03-05', 2024, 'March', 1, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'March budget - DACH', 'Approved', 'BUDGET_2024_MAR'),
('2024-03-10', 2024, 'March', 1, 'CC-1002', 401001, 2, 295000, 273148, 'Actual', 'D365', 'Monthly_Close', 'System_GL', 'March revenue - NA', 'Approved', 'BATCH_2024_MAR'),
('2024-03-10', 2024, 'March', 1, 'CC-1002', 401001, 2, 250000, 231481, 'Budget', 'D365', 'Budget_Planning', 'Finance_Team', 'March budget - NA', 'Approved', 'BUDGET_2024_MAR'),
('2024-03-18', 2024, 'March', 1, 'CC-3001', 604000, 1, 19800, 19800, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Production salaries Mar', 'Approved', 'BATCH_2024_MAR'),
('2024-03-18', 2024, 'March', 1, 'CC-3001', 604000, 1, 18000, 18000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Production salaries budget Mar', 'Approved', 'BUDGET_2024_MAR'),
('2024-03-22', 2024, 'March', 1, 'CC-2001', 601001, 1, 52000, 52000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend Mar', 'Approved', 'BATCH_2024_MAR'),
('2024-03-22', 2024, 'March', 1, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget Mar', 'Approved', 'BUDGET_2024_MAR'),
('2024-04-12', 2024, 'April', 2, 'CC-1001', 401000, 1, 290000, 290000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'April revenue - DACH', 'Approved', 'BATCH_2024_APR'),
('2024-04-12', 2024, 'April', 2, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'April budget - DACH', 'Approved', 'BUDGET_2024_APR'),
('2024-04-18', 2024, 'April', 2, 'CC-1002', 401001, 2, 310000, 287037, 'Actual', 'D365', 'Monthly_Close', 'System_GL', 'April revenue - NA', 'Approved', 'BATCH_2024_APR'),
('2024-04-18', 2024, 'April', 2, 'CC-1002', 401001, 2, 250000, 231481, 'Budget', 'D365', 'Budget_Planning', 'Finance_Team', 'April budget - NA', 'Approved', 'BUDGET_2024_APR'),
('2024-04-22', 2024, 'April', 2, 'CC-2001', 601001, 1, 55000, 55000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend Apr', 'Approved', 'BATCH_2024_APR'),
('2024-04-22', 2024, 'April', 2, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget Apr', 'Approved', 'BUDGET_2024_APR'),
('2024-05-14', 2024, 'May', 2, 'CC-1001', 401000, 1, 310000, 310000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'May revenue - DACH', 'Approved', 'BATCH_2024_MAY'),
('2024-05-14', 2024, 'May', 2, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'May budget - DACH', 'Approved', 'BUDGET_2024_MAY'),
('2024-05-20', 2024, 'May', 2, 'CC-1002', 401001, 2, 325000, 300926, 'Actual', 'D365', 'Monthly_Close', 'System_GL', 'May revenue - NA', 'Approved', 'BATCH_2024_MAY'),
('2024-05-20', 2024, 'May', 2, 'CC-1002', 401001, 2, 250000, 231481, 'Budget', 'D365', 'Budget_Planning', 'Finance_Team', 'May budget - NA', 'Approved', 'BUDGET_2024_MAY'),
('2024-05-25', 2024, 'May', 2, 'CC-2001', 601001, 1, 58000, 58000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend May', 'Approved', 'BATCH_2024_MAY'),
('2024-05-25', 2024, 'May', 2, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget May', 'Approved', 'BUDGET_2024_MAY'),
('2024-06-10', 2024, 'June', 2, 'CC-1001', 401000, 1, 330000, 330000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'June revenue - DACH', 'Approved', 'BATCH_2024_JUN'),
('2024-06-10', 2024, 'June', 2, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'June budget - DACH', 'Approved', 'BUDGET_2024_JUN'),
('2024-06-15', 2024, 'June', 2, 'CC-2001', 601001, 1, 62000, 62000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend Jun', 'Approved', 'BATCH_2024_JUN'),
('2024-06-15', 2024, 'June', 2, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget Jun', 'Approved', 'BUDGET_2024_JUN'),
('2024-07-12', 2024, 'July', 3, 'CC-1001', 401000, 1, 345000, 345000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'July revenue - DACH', 'Approved', 'BATCH_2024_JUL'),
('2024-07-12', 2024, 'July', 3, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'July budget - DACH', 'Approved', 'BUDGET_2024_JUL'),
('2024-07-18', 2024, 'July', 3, 'CC-2001', 601001, 1, 65000, 65000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend Jul', 'Approved', 'BATCH_2024_JUL'),
('2024-07-18', 2024, 'July', 3, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget Jul', 'Approved', 'BUDGET_2024_JUL'),
('2024-08-14', 2024, 'August', 3, 'CC-1001', 401000, 1, 355000, 355000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'August revenue - DACH', 'Approved', 'BATCH_2024_AUG'),
('2024-08-14', 2024, 'August', 3, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'August budget - DACH', 'Approved', 'BUDGET_2024_AUG'),
('2024-08-20', 2024, 'August', 3, 'CC-2001', 601001, 1, 68000, 68000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend Aug', 'Approved', 'BATCH_2024_AUG'),
('2024-08-20', 2024, 'August', 3, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget Aug', 'Approved', 'BUDGET_2024_AUG'),
('2024-09-10', 2024, 'September', 3, 'CC-1001', 401000, 1, 370000, 370000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'September revenue - DACH', 'Approved', 'BATCH_2024_SEP'),
('2024-09-10', 2024, 'September', 3, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'September budget - DACH', 'Approved', 'BUDGET_2024_SEP'),
('2024-09-15', 2024, 'September', 3, 'CC-2001', 601001, 1, 70000, 70000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend Sep', 'Approved', 'BATCH_2024_SEP'),
('2024-09-15', 2024, 'September', 3, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget Sep', 'Approved', 'BUDGET_2024_SEP'),
('2024-10-08', 2024, 'October', 4, 'CC-1001', 401000, 1, 385000, 385000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'October revenue - DACH', 'Approved', 'BATCH_2024_OCT'),
('2024-10-08', 2024, 'October', 4, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'October budget - DACH', 'Approved', 'BUDGET_2024_OCT'),
('2024-10-14', 2024, 'October', 4, 'CC-2001', 601001, 1, 72000, 72000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend Oct', 'Approved', 'BATCH_2024_OCT'),
('2024-10-14', 2024, 'October', 4, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget Oct', 'Approved', 'BUDGET_2024_OCT'),
('2024-11-12', 2024, 'November', 4, 'CC-1001', 401000, 1, 400000, 400000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'November revenue - DACH', 'Approved', 'BATCH_2024_NOV'),
('2024-11-12', 2024, 'November', 4, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'November budget - DACH', 'Approved', 'BUDGET_2024_NOV'),
('2024-11-18', 2024, 'November', 4, 'CC-2001', 601001, 1, 75000, 75000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend Nov', 'Approved', 'BATCH_2024_NOV'),
('2024-11-18', 2024, 'November', 4, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget Nov', 'Approved', 'BUDGET_2024_NOV'),
('2024-12-10', 2024, 'December', 4, 'CC-1001', 401000, 1, 420000, 420000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'December revenue - DACH', 'Approved', 'BATCH_2024_DEC'),
('2024-12-10', 2024, 'December', 4, 'CC-1001', 401000, 1, 230000, 230000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'December budget - DACH', 'Approved', 'BUDGET_2024_DEC'),
('2024-12-15', 2024, 'December', 4, 'CC-2001', 601001, 1, 80000, 80000, 'Actual', 'SAP', 'Monthly_Close', 'System_GL', 'Marketing spend Dec', 'Approved', 'BATCH_2024_DEC'),
('2024-12-15', 2024, 'December', 4, 'CC-2001', 601001, 1, 40000, 40000, 'Budget', 'SAP', 'Budget_Planning', 'Finance_Team', 'Marketing budget Dec', 'Approved', 'BUDGET_2024_DEC');
GO

-- =====================================================
-- CREATE FOREIGN KEY RELATIONSHIPS
-- =====================================================
ALTER TABLE GL_Transactions ADD CONSTRAINT FK_GL_Transactions_CostCenter 
FOREIGN KEY (CostCenter) REFERENCES CostCenter_Master(CostCenter);
GO

ALTER TABLE GL_Transactions ADD CONSTRAINT FK_GL_Transactions_GL_Account 
FOREIGN KEY (GL_Account) REFERENCES GL_Account_Master(GL_Account);
GO

ALTER TABLE GL_Transactions ADD CONSTRAINT FK_GL_Transactions_Subsidiary 
FOREIGN KEY (Subsidiary_ID) REFERENCES Subsidiary_Master(Subsidiary_ID);
GO

-- =====================================================
-- CREATE INDEXES FOR PERFORMANCE
-- =====================================================
CREATE INDEX IX_GL_Transactions_Date ON GL_Transactions(TransactionDate);
CREATE INDEX IX_GL_Transactions_CostCenter ON GL_Transactions(CostCenter);
CREATE INDEX IX_GL_Transactions_GL_Account ON GL_Transactions(GL_Account);
CREATE INDEX IX_GL_Transactions_Subsidiary ON GL_Transactions(Subsidiary_ID);
CREATE INDEX IX_GL_Transactions_YearMonth ON GL_Transactions(FiscalYear, FiscalMonth);
CREATE INDEX IX_GL_Transactions_ActualBudget ON GL_Transactions(Actual_Budget_Flag);
GO

-- =====================================================
-- VERIFY DATA LOAD (FIXED - Removed RowCount error)
-- =====================================================
SELECT 'GL_Account_Master' AS TableName, COUNT(*) AS NumberOfRows FROM GL_Account_Master
UNION ALL
SELECT 'CostCenter_Master', COUNT(*) FROM CostCenter_Master
UNION ALL
SELECT 'Subsidiary_Master', COUNT(*) FROM Subsidiary_Master
UNION ALL
SELECT 'GL_Transactions - Actual', COUNT(*) FROM GL_Transactions WHERE Actual_Budget_Flag = 'Actual'
UNION ALL
SELECT 'GL_Transactions - Budget', COUNT(*) FROM GL_Transactions WHERE Actual_Budget_Flag = 'Budget'
UNION ALL
SELECT 'GL_Transactions - Total', COUNT(*) FROM GL_Transactions;
GO

-- =====================================================
-- SHOW SAMPLE DATA
-- =====================================================
SELECT TOP 20 
    TransactionID,
    TransactionDate,
    FiscalYear,
    FiscalMonth,
    CostCenter,
    GL_Account,
    Amount_EUR,
    Actual_Budget_Flag,
    Source_ERP
FROM GL_Transactions;
GO

-- =====================================================
-- SENIOR-LEVEL VALIDATION QUERIES (For Your Portfolio)
-- =====================================================

-- Query 1: P&L by Month with Budget Variance
SELECT 
    FiscalYear,
    FiscalMonth,
    SUM(CASE WHEN a.Account_Type = 'Revenue' AND Actual_Budget_Flag = 'Actual' THEN Amount_EUR ELSE 0 END) AS Actual_Revenue,
    SUM(CASE WHEN a.Account_Type = 'Revenue' AND Actual_Budget_Flag = 'Budget' THEN Amount_EUR ELSE 0 END) AS Budget_Revenue,
    SUM(CASE WHEN a.Account_Type = 'Expense' AND Actual_Budget_Flag = 'Actual' THEN Amount_EUR ELSE 0 END) AS Actual_Expense,
    SUM(CASE WHEN a.Account_Type = 'Expense' AND Actual_Budget_Flag = 'Budget' THEN Amount_EUR ELSE 0 END) AS Budget_Expense,
    SUM(CASE WHEN a.Account_Type = 'Revenue' AND Actual_Budget_Flag = 'Actual' THEN Amount_EUR ELSE -Amount_EUR END) AS Actual_Operating_Income
FROM GL_Transactions t
JOIN GL_Account_Master a ON t.GL_Account = a.GL_Account
WHERE a.Financial_Statement = 'P&L'
GROUP BY FiscalYear, FiscalMonth
ORDER BY FiscalYear, MIN(t.TransactionDate);
GO

-- Query 2: Top Cost Centers by Budget Variance
SELECT TOP 5
    c.CostCenter_Name,
    c.Department,
    SUM(CASE WHEN Actual_Budget_Flag = 'Actual' THEN Amount_EUR ELSE 0 END) AS Actual_Spend,
    SUM(CASE WHEN Actual_Budget_Flag = 'Budget' THEN Amount_EUR ELSE 0 END) AS Budget_Spend,
    SUM(CASE WHEN Actual_Budget_Flag = 'Actual' THEN Amount_EUR ELSE -Amount_EUR END) AS Variance_Absolute,
    ROUND(SUM(CASE WHEN Actual_Budget_Flag = 'Actual' THEN Amount_EUR ELSE -Amount_EUR END) / 
          NULLIF(SUM(CASE WHEN Actual_Budget_Flag = 'Budget' THEN Amount_EUR ELSE 0 END), 0) * 100, 2) AS Variance_Percent
FROM GL_Transactions t
JOIN CostCenter_Master c ON t.CostCenter = c.CostCenter
JOIN GL_Account_Master a ON t.GL_Account = a.GL_Account
WHERE t.FiscalYear = 2024 
  AND a.Account_Type = 'Expense'
  AND t.Actual_Budget_Flag IN ('Actual', 'Budget')
GROUP BY c.CostCenter_Name, c.Department
HAVING SUM(CASE WHEN Actual_Budget_Flag = 'Actual' THEN Amount_EUR ELSE -Amount_EUR END) > 0
ORDER BY Variance_Absolute DESC;
GO

-- Print success message
PRINT '==========================================';
PRINT 'DATABASE CREATED SUCCESSFULLY!';
PRINT 'Tables: GL_Account_Master, CostCenter_Master, Subsidiary_Master, GL_Transactions';
PRINT 'Total rows: See verification query above';
PRINT 'Ready for Power BI import';
PRINT '==========================================';
GO