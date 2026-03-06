# Task 6: Monthly Sales Distribution by Gender
use walmart;

SELECT 
    Month,
    Gender,
    Total_Sales,
    FLOOR((Total_Sales / SUM(Total_Sales) OVER (PARTITION BY Month)) * 100) AS Percentage_Share
FROM (
    SELECT 
        DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS Month,
        Gender,
        SUM(Total) AS Total_Sales
    FROM walmart_sales
    GROUP BY DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m'), Gender
) sub
ORDER BY Month, Gender;

