CREATE DATABASE supply_chain_project;
USE supply_chain_project;
CREATE TABLE supply_chain (
Product_type VARCHAR(50),
SKU VARCHAR(50),
Price FLOAT,
Number_of_products_sold INT,
Revenue_generated FLOAT,
Stock_levels INT,
Lead_times INT,
Shipping_times INT,
Shipping_costs FLOAT,
Supplier_name VARCHAR(100),
Manufacturing_costs FLOAT,
Defect_rates FLOAT,
Transportation_modes VARCHAR(50),
Routes VARCHAR(50),
Costs FLOAT
);
SELECT COUNT(*) FROM supply_chain;
TRUNCATE TABLE supply_chain;
SELECT COUNT(*) FROM clean_supply_chain_data;
TRUNCATE TABLE clean_supply_chain_data;


SELECT *
FROM clean_supply_chain_data
LIMIT 10;

-- Calculate total revenue

SELECT SUM(Revenue_generated) AS total_revenue
FROM clean_supply_chain_data;

-- Revenue by type
SELECT Product_type,
SUM(Revenue_generated) AS total_revenue
FROM clean_supply_chain_data
GROUP BY Product_type
ORDER BY total_revenue DESC;

-- Total Products Sold
SELECT SUM(Number_of_products_sold) AS total_products_sold
FROM clean_supply_chain_data;

-- Best Performing Supplier
SELECT Supplier_name,
SUM(Revenue_generated) AS total_revenue
FROM clean_supply_chain_data
GROUP BY Supplier_name
ORDER BY total_revenue DESC;

-- Suppilier With highest defect Rate
SELECT Supplier_name,
AVG(Defect_rates) AS avg_defect_rate
FROM clean_supply_chain_data
GROUP BY Supplier_name
ORDER BY avg_defect_rate DESC;

-- Transportation Cost analysis
SELECT Transportation_modes,
AVG(Shipping_costs) AS avg_shipping_cost
FROM clean_supply_chain_data
GROUP BY Transportation_modes
ORDER BY avg_shipping_cost DESC;

-- Route Cost Analysis
SELECT Routes,
AVG(Costs) AS avg_route_cost
FROM clean_supply_chain_data
GROUP BY Routes
ORDER BY avg_route_cost DESC;

-- Profit Analysis
SELECT Product_type,
SUM(Revenue_generated - Manufacturing_costs) AS total_profit
FROM clean_supply_chain_data
GROUP BY Product_type
ORDER BY total_profit DESC;

-- lead Time analysis
SELECT Supplier_name,
AVG(Lead_times) AS avg_lead_time
FROM clean_supply_chain_data
GROUP BY Supplier_name
ORDER BY avg_lead_time DESC;