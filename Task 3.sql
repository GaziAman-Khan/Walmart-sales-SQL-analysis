#Task 3: Analyzing Customer Segmentation Based on Spending 
use walmart;

SELECT Spending_Tier, COUNT(*) AS Num_Customers
FROM (
    SELECT 
        `Invoice ID`,
        SUM(Total) AS Total_Spending,
        CASE 
            WHEN SUM(Total) < 300 THEN 'Low'
            WHEN SUM(Total) BETWEEN 300 AND 700 THEN 'Medium'
            ELSE 'High'
        END AS Spending_Tier
    FROM walmart_sales
    GROUP BY `Invoice ID`
) 
GROUP BY Spending_Tier
ORDER BY Num_Customers DESC;



