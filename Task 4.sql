#Task 4: Detecting Anomalies in Sales Transactions

use walmart;
Select 
       'Product Line',
       Avg(Total) AS Avg_sales
From walmart_sales
GROUP BY 'Product line';         # avg = 322.966



SELECT 
    P.ProductLine,
    COUNT(*) AS Num_Anomalies
FROM (
    SELECT 
        `Product line` AS ProductLine,
        Total
    FROM walmart_sales
) W
JOIN (
    SELECT 
        `Product line` AS ProductLine,
        AVG(Total) AS AvgSales
    FROM walmart_sales
    GROUP BY `Product line`
) P
ON W.ProductLine = P.ProductLine
WHERE W.Total > P.AvgSales * 2
   OR W.Total < P.AvgSales * 0.5
GROUP BY P.ProductLine
ORDER BY Num_Anomalies DESC;
