#Task 5: Most Popular Payment Method by City 
use walmart;

SELECT City, Payment, Num_Transactions
FROM (
    SELECT 
        City,
        Payment,
        COUNT(*) AS Num_Transactions,
        ROW_NUMBER() OVER (PARTITION BY City ORDER BY COUNT(*) DESC) AS rn
    FROM walmart_sales
    GROUP BY City, Payment
) t
WHERE rn = 1;

