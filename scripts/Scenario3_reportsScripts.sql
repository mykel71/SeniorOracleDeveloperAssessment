

-- Now, let's extract the required reports from the database.

-- Report 1: Financial Adviser Report

SELECT 
    a.Name AS AdvisorName, 
    c.Name AS ClientName, 
    c.Telephone 
FROM Advisers a
JOIN Clients c ON a.AdvisorID = c.AdvisorID
ORDER BY a.Name;


-- Report 2: Client Transaction Report

SELECT 
    c.Name AS ClientName, 
    t.Type AS TransactionType, 
    t.Amount, 
    t.TransactionDate, 
    t.Currency
FROM Clients c
JOIN Transactions t ON c.ClientID = t.ClientID
ORDER BY c.Name, t.TransactionDate;


-- 