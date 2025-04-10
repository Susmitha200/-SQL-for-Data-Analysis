SELECT *
FROM ecommerce1;

-- created a table named ecommerce_new and inserted all values from ecommerce1 table
CREATE TABLE ecommerce_new
LIKE ecommerce1;

SELECT *
FROM ecommerce_new;

INSERT ecommerce_new
SELECT *
FROM ecommerce1;

-- Changing column names

ALTER TABLE ecommerce1
CHANGE `Discount Availed` Discount_Availed TEXT;


-- Query 1

SELECT 
      ï»¿CID, 
        Gender,
        `Product Category`
FROM ecommerce1
WHERE Location = "Bangalore"
ORDER BY ï»¿CID;

-- Query 2

SELECT `Product Category`, 
        ROUND(AVG(`Gross Amount`),2) AS Avg_amount, 
        ROUND(AVg(`Discount Amount (INR)`),2) AS Avg_discount
FROM ecommerce1
GROUP BY `Product Category`
ORDER BY Avg_amount;

-- Query 3

SELECT Gender, 
       `Purchase Method`,
       `Net Amount`
FROM ecommerce1
WHERE Gender = 'Male'
  AND `Purchase Method` = 'Credit Card'
ORDER BY `Net Amount` DESC;

-- Query 4

SELECT `Product Category`,
       COUNT(*) AS Orders,
       ROUND(SUM(`Net Amount`),2) AS Total_Revenue,
       ROUND(AVG(`Net Amount`),2) AS Average_Spend
FROM ecommerce1
GROUP BY `Product Category`;

-- Query 5

SELECT ï»¿CID, Gender,
	   `Product Category`,
       `Discount Name`,
       `Discount Amount (INR)`
FROM ecommerce1
WHERE `Discount Amount (INR)` >
      (
      SELECT AVG(`Discount Amount (INR)`) 
      FROM ecommerce1
      );
      
-- let's create a sample customers table to do JOINS
CREATE TABLE customer_details (
    CID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);
INSERT INTO customer_details (CID, Customer_Name, Email, Phone)
VALUES
(933551, 'Anjali Mehra', 'anjali.mehra@example.com', '9876543210'),
(414167, 'Rohit Kumar', 'rohit.kumar@example.com', '8765432109'),
(110195, 'Maya Nair', 'maya.nair@example.com', '9123456780'),
(787512, 'Imran Sheikh', 'imran.sheikh@example.com', '9911223344'),
(538174, 'Aarav Sharma', 'aarav.sharma@example.com', '9988776655'),
(336109, 'Priya Das', 'priya.das@example.com', '9001234567');

-- Query 6

SELECT 
    e.ï»¿CID,
    c.Customer_Name,
    c.Email,
    e.`Product Category`,
    e.`Net Amount`
FROM ecommerce1 e
INNER JOIN customer_details c
  ON e.ï»¿CID = c.CID
ORDER BY e.`Net Amount` DESC;

-- Query 7

SELECT Location,
       SUM(`Gross Amount`) AS Total_Gross
FROM ecommerce1
GROUP BY Location
ORDER BY Total_Gross DESC
LIMIT 3;





