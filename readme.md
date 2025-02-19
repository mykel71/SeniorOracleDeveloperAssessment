# Senior Oracle Developer Assessment

## Scenario 1: SQL Queries

### 1. Retrieve Total Order Amount per Customer
```sql
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    SUM(o.OrderAmount) AS TotalOrderAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;
```

### 2. List Customers Who Placed Orders Greater Than 200
```sql
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderAmount > 200;
```

---

## Scenario 2: SQL & PL/SQL

### 1. Create Employees Table
```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE
);
```

### 2. PL/SQL Block for Salary Calculation
```plsql
DECLARE
    v_salary1 NUMBER := 5000;
    v_salary2 NUMBER := 7000;
    v_total_salary NUMBER;
BEGIN
    v_total_salary := v_salary1 + v_salary2;
    DBMS_OUTPUT.PUT_LINE('Total Salary: ' || v_total_salary);
END;
/
```

### 3. Create an Index on `OrderAmount`
```sql
CREATE INDEX idx_order_amount ON Orders(OrderAmount);
```

---

## Scenario 3: ETL & Reporting

### 1. Database Table Structures

#### **Advisers Table**
```sql
CREATE TABLE Advisers (
    AdvisorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Telephone VARCHAR(20)
);
```

#### **Clients Table**
```sql
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    AdvisorID INT,
    Name VARCHAR(100),
    Telephone VARCHAR(20),
    FOREIGN KEY (AdvisorID) REFERENCES Advisers(AdvisorID)
);
```

#### **Transactions Table**
```sql
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    Type VARCHAR(50),
    Amount NUMBER(10,2),
    ClientID INT,
    TransactionDate DATE,
    Currency VARCHAR(10),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);
```

### 2. Generating Reports in CSV using Python

#### **Financial Adviser Report**
```python
import cx_Oracle
import csv

connection = cx_Oracle.connect("user/password@hostname:port/service_name")
cursor = connection.cursor()

query = """
SELECT a.Name AS AdvisorName, c.Name AS ClientName, c.Telephone 
FROM Advisers a
JOIN Clients c ON a.AdvisorID = c.AdvisorID
ORDER BY a.Name;
"""

cursor.execute(query)
rows = cursor.fetchall()

with open("financial_adviser_report.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["Advisor Name", "Client Name", "Telephone"])
    writer.writerows(rows)

cursor.close()
connection.close()
```

#### **Client Transaction Report**
```python
query = """
SELECT c.Name AS ClientName, t.Type, t.Amount, t.TransactionDate, t.Currency
FROM Clients c
JOIN Transactions t ON c.ClientID = t.ClientID
ORDER BY c.Name, t.TransactionDate;
"""

cursor.execute(query)
rows = cursor.fetchall()

with open("client_transaction_report.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["Client Name", "Transaction Type", "Amount", "Date", "Currency"])
    writer.writerows(rows)
```

