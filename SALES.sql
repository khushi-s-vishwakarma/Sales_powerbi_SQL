use sales;
select count(*) from transactions;

-- 1. Retrieve all customer details
SELECT *  
FROM customers;

-- 2. Count the total number of customers
SELECT COUNT(*) AS total_customers  
FROM customers;

-- 3. Fetch all transactions from the Chennai market (Market Code: Mark001)
SELECT *  
FROM transactions  
WHERE market_code = 'Mark001';

-- 4. List unique product codes sold in the Chennai market
SELECT DISTINCT product_code  
FROM transactions  
WHERE market_code = 'Mark001';

-- 5. Get all transactions where the currency used is USD
SELECT *  
FROM transactions  
WHERE currency = 'USD';

-- 6. Display transactions from the year 2020 using a join with the date table
SELECT t.*, d.*  
FROM transactions t  
INNER JOIN date d ON t.order_date = d.date  
WHERE d.year = 2020;

-- 7. Calculate total revenue in the year 2020 (for INR or USD currencies)
SELECT SUM(t.sales_amount) AS total_revenue_2020  
FROM transactions t  
INNER JOIN date d ON t.order_date = d.date  
WHERE d.year = 2020  
  AND (t.currency = 'INR' OR t.currency = 'USD');

-- 8. Calculate total revenue for January 2020
SELECT SUM(t.sales_amount) AS total_revenue_jan_2020  
FROM transactions t  
INNER JOIN date d ON t.order_date = d.date  
WHERE d.year = 2020  
  AND d.month_name = 'January'  
  AND (t.currency = 'INR' OR t.currency = 'USD');

-- 9. Calculate total revenue in Chennai for the year 2020
SELECT SUM(t.sales_amount) AS total_revenue_chennai_2020  
FROM transactions t  
INNER JOIN date d ON t.order_date = d.date  
WHERE d.year = 2020  
  AND t.market_code = 'Mark001';
