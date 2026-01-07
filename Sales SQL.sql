create database sales_project;
use sales_project;
#   Total sales ith profit
SELECT 
    s.SalesID,
    c.CustomerName,
    p.ProductName,
    s.OrderDate,
    s.Quantity,
    (s.Quantity * p.SellingPrice) AS Revenue,
    (s.Quantity * (p.SellingPrice - p.CostPrice)) AS Profit
FROM sales s
JOIN customers c ON s.CustomerID = c.CustomerID
JOIN products p ON s.ProductID = p.ProductID;
# monthly sales Summary;
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    SUM(Quantity * sellingprice) AS TotalRevenue,
    SUM(Quantity * (SellingPrice - CostPrice)) AS TotalProfit
FROM sales
JOIN products USING(ProductID)
GROUP BY Month;
CREATE VIEW sales_with_profit AS
SELECT
    s.SalesID,
    s.ProductID,
    s.Quantity,
    p.SellingPrice,
    p.CostPrice,
    (s.Quantity * p.SellingPrice) AS Revenue,
    (s.Quantity * (p.SellingPrice - p.CostPrice)) AS Profit
FROM
    Sales s
JOIN
    Products p ON s.ProductID = p.ProductID;

