/********************************/
/*  SCENARIO 1: SQL Queries    */
/********************************/

-- Question 1: Total Order Amount per Customer

SELECT 
    c.CustomerID, 
    c.CustomerName, 
    SUM(o.OrderAmount) AS TotalOrderAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;

-- Question 2: Customers with Orders > 200

SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderAmount > 200;