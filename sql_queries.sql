-- =========================================
-- CUSTOMER ANALYTICS PROJECT (BIGQUERY)
-- =========================================


-- =========================================
-- 1. DATA CLEANING
-- =========================================
-- Clean raw data, fix date format, remove invalid rows,
-- and create Revenue column

CREATE OR REPLACE TABLE 
`project-86fece0c-5aeb-4cdd-b43.customer_dataset.cleaned_retail` AS

SELECT
  InvoiceNo,
  StockCode,
  Description,
  Quantity,
  UnitPrice,
  CustomerID,
  Country,

  -- Convert string to datetime
  PARSE_DATETIME('%d-%m-%Y %H:%M', InvoiceDate) AS InvoiceDate,

  -- Create revenue column
  Quantity * UnitPrice AS Revenue

FROM
  `project-86fece0c-5aeb-4cdd-b43.customer_dataset.online_retail`

WHERE
  CustomerID IS NOT NULL
  AND Quantity > 0
  AND UnitPrice > 0;



-- =========================================
-- 2. CUSTOMER SEGMENTATION
-- =========================================
-- Segment customers based on total spending

CREATE OR REPLACE TABLE 
`project-86fece0c-5aeb-4cdd-b43.customer_dataset.customer_segments` AS

SELECT
  CustomerID,
  SUM(Revenue) AS total_spent,

  CASE
    WHEN SUM(Revenue) > 10000 THEN 'High Value'
    WHEN SUM(Revenue) BETWEEN 5000 AND 10000 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS customer_segment

FROM
  `project-86fece0c-5aeb-4cdd-b43.customer_dataset.cleaned_retail`

GROUP BY
  CustomerID;



-- =========================================
-- 3. CUSTOMER TYPE (NEW vs REPEAT)
-- =========================================
-- Classify customers based on order frequency

CREATE OR REPLACE TABLE 
`project-86fece0c-5aeb-4cdd-b43.customer_dataset.customer_type` AS

SELECT
  CustomerID,
  COUNT(DISTINCT InvoiceNo) AS total_orders,

  CASE
    WHEN COUNT(DISTINCT InvoiceNo) > 1 THEN 'Repeat Customer'
    ELSE 'New Customer'
  END AS customer_type

FROM
  `project-86fece0c-5aeb-4cdd-b43.customer_dataset.cleaned_retail`

GROUP BY
  CustomerID;



-- =========================================
-- 4. MONTHLY REVENUE ANALYSIS
-- =========================================
-- Used for trend visualization

SELECT
  EXTRACT(YEAR FROM InvoiceDate) AS year,
  EXTRACT(MONTH FROM InvoiceDate) AS month,
  SUM(Revenue) AS total_revenue

FROM
  `project-86fece0c-5aeb-4cdd-b43.customer_dataset.cleaned_retail`

GROUP BY
  year, month

ORDER BY
  year, month;



-- =========================================
-- 5. TOP COUNTRIES BY REVENUE
-- =========================================

SELECT
  Country,
  SUM(Revenue) AS total_revenue

FROM
  `project-86fece0c-5aeb-4cdd-b43.customer_dataset.cleaned_retail`

GROUP BY
  Country

ORDER BY
  total_revenue DESC

LIMIT 10;



-- =========================================
-- 6. TOP PRODUCTS BY REVENUE
-- =========================================

SELECT
  Description,
  SUM(Revenue) AS total_revenue

FROM
  `project-86fece0c-5aeb-4cdd-b43.customer_dataset.cleaned_retail`

WHERE
  Description IS NOT NULL

GROUP BY
  Description

ORDER BY
  total_revenue DESC

LIMIT 10;
