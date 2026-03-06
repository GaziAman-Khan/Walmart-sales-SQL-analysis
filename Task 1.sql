#TASK 1 : Identifying the Top Branch by Sales Growth Rate
Use walmart;


SELECT Branch, Month, Growth_Rate_Percent
FROM (
    SELECT 
        Branch,
        Month,
        Monthly_Sales,
        LAG(Monthly_Sales) OVER (PARTITION BY Branch ORDER BY Month) AS Prev_Month_Sales,
        FLOOR(
            ((Monthly_Sales - LAG(Monthly_Sales) OVER (PARTITION BY Branch ORDER BY Month))
             / LAG(Monthly_Sales) OVER (PARTITION BY Branch ORDER BY Month)) * 100
        ) AS Growth_Rate_Percent
    FROM (
        SELECT 
            Branch,
            DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS Month,
            SUM(Total) AS Monthly_Sales
        FROM walmart_sales
        GROUP BY Branch, DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m')
    ) 
) 
WHERE Growth_Rate_Percent IS NOT NULL
ORDER BY Growth_Rate_Percent DESC
LIMIT 1;
