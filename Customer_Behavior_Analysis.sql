USE customer_behavior_db;
GO

-- 1. Preview the data
SELECT TOP (1) *
FROM Customer_Orders;

-- 2. Total revenue
SELECT
    SUM([Total_Amount]) AS [Total_Revenue]
FROM [dbo].[Customer_Orders]; 

-- 3. Revenue by product category
SELECT
    [Product_Category],
    SUM([Total_Amount]) AS [Revenue]
FROM [dbo].[Customer_Orders]
GROUP BY [Product_Category]
ORDER BY [Revenue] DESC; 

-- 4. Returning vs new customers behavior
SELECT
    [Is_Returning_Customer] AS [Returning_Flag],
    COUNT(DISTINCT [Customer_ID]) AS [Customers],
    COUNT(DISTINCT [Order_ID])    AS [Orders],
    SUM([Total_Amount])           AS [Revenue]
FROM [dbo].[Customer_Orders]
GROUP BY [Is_Returning_Customer]
ORDER BY [Returning_Flag];

-- 5. Top cities by revenue
SELECT TOP (10)
    [City],
    SUM([Total_Amount]) AS [Revenue]
FROM [dbo].[Customer_Orders]
GROUP BY [City]
ORDER BY [Revenue] DESC; 

-- 6. Overall customers and ratings summary
SELECT
    COUNT(DISTINCT [Customer_ID]) AS [Total_Customers],
    COUNT(DISTINCT [Order_ID])    AS [Total_Orders],
    AVG([Customer_Rating] * 1.0)  AS [Average_Rating]
FROM [dbo].[Customer_Orders];

-- 7. Monthly revenue trend
SELECT
    YEAR([Date])  AS [Year],
    MONTH([Date]) AS [Month],
    SUM([Total_Amount]) AS [Revenue]
FROM [dbo].[Customer_Orders]
GROUP BY YEAR([Date]), MONTH([Date])
ORDER BY [Year], [Month];
