# Customer Analytics Dashboard (BigQuery + Power BI)

## 📊 Project Overview

This project analyzes customer purchasing behavior and sales performance using transactional retail data. The goal was to generate actionable insights on revenue trends, customer segmentation, and product performance.

## 🛠️ Tools & Technologies

* SQL (Google BigQuery)
* Power BI
* Data Cleaning & Transformation
* Data Visualization

## 🔧 Data Processing (BigQuery)

* Cleaned raw transactional data (removed nulls, invalid values)
* Converted InvoiceDate into proper datetime format
* Created calculated fields:

  * Revenue (Quantity * UnitPrice)
* Built derived tables:

  * Customer Segmentation (High, Medium, Low value)
  * Customer Type (New vs Repeat customers)

## 📈 Dashboard Features

### Page 1: Sales Overview

* Total Revenue, Customers, Orders, Avg Order Value (KPIs)
* Top Countries by Revenue
* Customer Segmentation
* Revenue by Customer Type

### Page 2: Customer & Product Insights

* Monthly Revenue Trend
* Top Customers by Revenue
* Top 10 Products
* Orders by Customer Type

## 💡 Key Insights

* Majority of revenue comes from repeat customers
* A small segment of high-value customers drives most revenue
* Certain products significantly outperform others
* Revenue shows strong growth in later months

## 📷 Dashboard Preview

<img width="1335" height="740" alt="dashboard_page1" src="https://github.com/user-attachments/assets/c364563f-0322-48d5-b3ea-c61b1db7d6da" />

<img width="1347" height="748" alt="dashboard_page2" src="https://github.com/user-attachments/assets/c62f15ce-48a0-4cb0-8de6-23749ecff919" />



## 📌 Project Outcome

This project demonstrates end-to-end data analysis:

* Data cleaning and transformation using SQL
* Feature engineering for business insights
* Interactive dashboard creation in Power BI

## 🚀 Future Improvements

* Add cohort analysis for retention
* Include product category-level insights
* Implement forecasting models

---
