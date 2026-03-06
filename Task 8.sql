#Task 8: Identifying Repeat Customers

use walmart;

SELECT 
    `Customer ID`,
    DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS Month,
    COUNT(*) AS Purchases_In_Month
FROM walmart_sales
GROUP BY `Customer ID`, DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m')
HAVING COUNT(*) > 1
ORDER BY `Customer ID`, Month;







