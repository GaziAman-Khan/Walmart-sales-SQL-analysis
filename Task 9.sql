# Task 9: Finding Top 5 Customers by Sales Volume 
use walmart;

SELECT 
    `Customer ID`,
    SUM(Total) AS Total_Sales
FROM walmart_sales
GROUP BY `Customer ID`
ORDER BY Total_Sales DESC
LIMIT 5;
