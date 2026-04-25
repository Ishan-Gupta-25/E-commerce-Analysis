USE major;
SELECT * FROM customer LIMIT 50;

-- 1.Counting Records
-- Question: How many total customers are recorded in the dataset?-- 
SELECT COUNT(customer_id) AS total_costumers
FROM customer;

-- 2.Simple Filtering
-- Question: Write a query to find all Male customers who are older than 50 years.
SELECT * FROM customer
WHERE gender ='Male' AND age>50;

-- 3.Aggregate Functions (Average)
-- Question: What is the average Annual_Income of all customers in the database?
SELECT AVG(Annual_income) AS Average_Income
FROM customer;

-- 5.Analyzing Churn
-- Question: How many customers have churned? (Note: Churn = 1 means the customer left). 
SELECT COUNT(*) AS Churned_customer
FROM customer
WHERE Churn = 1;

-- 6.Finding Extremes
-- Question: Find the Customer_ID and the Spending_Score of the customer(s) with the highest spending score.
SELECT customer_id , spending_score
FROM customer
ORDER BY spending_score DESC
LIMIT 1;
SELECT * FROM customer;

-- 7.Grouping Data
-- Question: Calculate the average Spending_Score and total Online_Purchases for each Gender
SELECT Gender,
AVG(Spending_Score),
SUM(Online_Purchases)
FROM customer
GROUP BY Gender;

-- 8.Range and Logic
-- Question: Retrieve the IDs of customers who have a Membership_Years between 5 and 10 and an Annual_Income greater than 70,000. 
SELECT customer_id , age , gender
from customer
WHERE membership_years BETWEEN 5 AND 10 
AND annual_income > 70000;

-- 9.Top Performers
-- Question: List the Top 5 customers who have the highest number of Online_Purchases. 
SELECT customer_id, online_purchases
FROM customer
ORDER BY online_purchases DESC
LIMIt 5;

-- 10.Complex Filtering
-- Question: Find customers who use discounts more than 70% of the time (Discount_Usage > 0.7) but have a Spending_Score lower than 30.
SELECT * FROM customer
WHERE discount_usage > 0.7
AND spending_score < 30;

-- Question7. Segment customers into New, Returning, and Loyal based on their total number of online purchases, and show the count of each segment.
-- Based on the data distribution (where purchases range from 1 to 199), we can define the thresholds as:
-- New: smaller then 150 purchases
-- Loyal: More than 150 purchases

SELECT 
	CASE
		WHEN online_purchases <= 150 THEN 'NEW'
        ELSE 'LOYAL'
	END AS customer_segment,
    COUNT(*) AS segment_count
FROM customer
GROUP BY customer_segment
ORDER BY segment_count DESC;
































