
use MY_PRACTISE1

select * from superstor_cleaned -- After analysinbg given data below is the key insights 

 -- 1.  CATEGORY WISE SALES

SELECT DISTINCT Category,  
       SUM(Sales) AS Total_Sales  
FROM superstor_cleaned  
GROUP BY Category  
ORDER BY Total_Sales DESC;

-- 2. CATEGORY WISE PROFIT

Select DISTINCT Category,
SUM(Profit)AS Total_Profit
FROM superstor_cleaned
GROUP BY Category
Order by Total_Profit DESC;


-- 3. SUB - CATEGORY WISE SALES

Select DISTINCT Sub_Category,
sum(Sales)AS Total_Sales
from superstor_cleaned
group by Sub_Category
Order by Total_Sales desc;


-- 4. SUB - CATEGORY WISE PROFIT

Select DISTINCT Sub_Category,
SUM(Profit) AS Total_Profit
FROM superstor_cleaned
GROUP BY Sub_Category
Order by Total_Profit DESC;


-- 6.MONTHLY SALES 

SELECT FORMAT(Order_Date, 'yyyy-MM') AS Month_Year,  
       ROUND(SUM(Sales),2) AS Total_Sales  
FROM superstor_cleaned  
GROUP BY FORMAT(Order_Date, 'yyyy-MM')  
ORDER BY Month_Year asc;

-- 7.MONTHLY PROFIT

SELECT FORMAT(Order_Date,'yyyy-MM') AS Month_year,
ROUND(sum(Profit),2) AS Total_profit
FROM superstor_cleaned
group by Format(Order_Date,'yyyy-MM')
ORDER BY Month_year asc;

-- 8.CATEGORY WISE TOP 10 SALES & PROFIT

SELECT TOP 10 Category,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit
FROM superstor_cleaned
GROUP BY Category
ORDER BY Total_Sales desc;

-- 9.SUB-CATEGORY WISE TOP 10 SALES & PROFIT

SELECT TOP 10 Sub_Category,  
       ROUND(SUM(Sales),2) AS Total_Sales,  
       ROUND(SUM(Profit),2) AS Total_Profit  
FROM superstor_cleaned 
GROUP BY Sub_Category  
ORDER BY Total_Sales DESC;


-- 10.SALES TO PROFIT RATIO by SEGMENT

SELECT Segment,  
       ROUND(SUM(Sales),2) AS Total_Sales,  
       ROUND (SUM(Profit),2) AS Total_Profit,  
       ROUND(
           CASE 
               WHEN SUM(Profit) = 0 THEN NULL  -- Prevent division by zero
               ELSE SUM(Sales) / SUM(Profit) 
           END, 2
       ) AS Sales_to_Profit_Ratio  
FROM superstor_cleaned  
GROUP BY Segment  
ORDER BY Sales_to_Profit_Ratio DESC;


-- 11. SEGMENT WISE PROFIT & SALES

SELECT DISTINCT Segment,
SUM(Profit) AS Total_profit,
SUM(Sales) AS Total_Sales
from superstor_cleaned
group by Segment
order by Total_profit desc;


-- 12. SALES BY SEGMENT & YEAR

SELECT Segment,  
       DATEPART(YEAR, Order_Date) AS Year,  
       SUM(Sales) AS Total_Sales  
FROM superstor_cleaned  
GROUP BY Segment, DATEPART(YEAR, Order_Date)  
ORDER BY Year DESC, Total_Sales DESC;



-- 13. PROFIT BY SEGMENT & YEAR

SELECT Segment,  
       DATEPART(YEAR, Order_Date) AS Year,  
       SUM(Profit) AS Total_Profit  
FROM superstor_cleaned  
GROUP BY Segment, DATEPART(YEAR, Order_Date)  
ORDER BY Year DESC, Total_Profit DESC;

