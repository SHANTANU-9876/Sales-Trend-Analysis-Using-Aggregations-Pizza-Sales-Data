# Sales-Trend-Analysis-Using-Aggregations-Pizza-Sales-Data
Overview:
This project focuses on analyzing historical pizza sales data to extract valuable business insights. It involves data preprocessing, sampling, and exploratory data analysis using SQL and Python. The goal is to help stakeholders understand revenue trends, customer preferences, and product performance over time.

Key Objectives:
- Data Cleaning & Preparation:
- Load and inspect raw CSV data.
- Handle missing or inconsistent values.
- Convert order_date and order_time from strings to appropriate formats.
- Sample 500 random rows for testing and rapid analysis.

Database Integration:
- Create a MySQL-compatible table schema based on the dataset.
- Upload and structure the data using CREATE TABLE and LOAD DATA SQL commands.

SQL-Based Analysis:
- Analyze monthly revenue using SUM(total_price) grouped by formatted order_date.
- Evaluate sales volume using COUNT(DISTINCT order_id) to determine customer activity.
- Identify top-selling pizza types, categories, and sizes based on quantity and revenue.
- Analyze sales trends by day of the week and across different months.

Business Insights:
- Highlight top 5 revenue-generating months.
- Determine customer preferences in pizza size and category.
- Suggest strategies for menu optimization and targeted promotions based on peak sales periods.

Tools & Technologies Used:
- Python (Pandas, NumPy) for data processing.
- MySQL for querying and structured data storage.
- SQL for analysis (GROUP BY, EXTRACT, DATE_FORMAT, etc.).
- CSV as the raw data input format.
