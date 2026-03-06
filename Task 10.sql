#Task 10: Analyzing Sales Trends by Day of the Week
use walmart;

SELECT 
    DAYNAME(STR_TO_DATE(Date, '%d-%m-%Y')) AS DayOfWeek,
    SUM(Total) AS Total_Sales
FROM walmart_sales
GROUP BY DayOfWeek
ORDER BY Total_Sales DESC;
