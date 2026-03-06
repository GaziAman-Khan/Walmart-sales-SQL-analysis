#Task 7: Best Product Line by Customer Type
use walmart;

SELECT 
    `Customer type`,
    `Product line`,
    SUM(Total) AS Total_Sales
FROM walmart_sales
GROUP BY `Customer type`, `Product line`
ORDER BY `Customer type`, Total_Sales DESC;

SELECT `Customer type`, `Product line`, Total_Sales
FROM (
    SELECT 
        `Customer type`,
        `Product line`,
        SUM(Total) AS Total_Sales,
        ROW_NUMBER() OVER (PARTITION BY `Customer type` ORDER BY SUM(Total) DESC) AS rn
    FROM walmart_sales
    GROUP BY `Customer type`, `Product line`
) ranked
WHERE rn = 1;
