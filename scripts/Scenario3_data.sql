USE SQLAssessmentDB;

-- Insert data into Advisers table
INSERT INTO Advisers (AdvisorID, Name, Telephone)
VALUES 
(1, 'Chuck Norris', '123456789'),
(2, 'Jean Claude Van Damme', '825496799'),
(3, 'Sylvester Stallone', '654678800');

-- Insert data into Clients table
INSERT INTO Clients (ClientID, AdvisorID, Name, Telephone)
VALUES 
(1, 2, 'Elon Musk', '11456789'),
(2, 2, 'Dali Mpofu', '613458900'),
(3, 1, 'Lionel Messi', '825689123'),
(4, 3, 'John Wick', '815549999'),
(5, 1, 'Bruce Lee', '761238765');

-- Insert data into Transactions table
INSERT INTO Transactions (TransactionID, Type, Amount, ClientID, TransactionDate, Currency)
VALUES 
(1, 'New Business', 1000000, 1, '2025-05-01', 'ZAR'),
(2, 'New Business', 500000, 2, '2025-05-01', 'ZAR'),
(3, 'Additional investment', 10000, 1, '2025-09-01', 'ZAR'),
(4, 'New Business', 3000000, 3, '2025-10-01', 'ZAR'),
(5, 'New Business', 3000, 4, '2025-01-15', 'USD'),
(6, 'New Business', 22500, 5, '2025-01-23', 'ZAR'),
(7, 'Withdrawal', 5000, 1, '2025-01-31', 'ZAR'),
(8, 'Withdrawal', 10000, 2, '2025-01-31', 'ZAR'),
(9, 'Additional investment', 300000, 3, '2025-03-02', 'ZAR'),
(10, 'Switch', 500, 4, '2025-08-02', 'USD');
