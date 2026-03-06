# Task 2: Finding the Most Profitable Product Line for Each Branch 

desc walmart_sales;
use walmart;

SELECT Branch, `Product line`, Total_Profit
FROM (
    SELECT 
        Branch,
        `Product line`,
        SUM(`gross income` - cogs) AS Total_Profit,
        ROW_NUMBER() OVER (PARTITION BY Branch ORDER BY SUM(`gross income` - cogs) DESC) AS rn
    FROM walmart_sales
    GROUP BY Branch, `Product line`
    
) 
WHERE rn = 1;


