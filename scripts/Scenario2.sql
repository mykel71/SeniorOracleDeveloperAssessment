/********************************/
/*  SCENARIO 2: SQL & PL/SQL    */
/********************************/

-- Question 1: Creating an Employees Table

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE
);

-- Question 2: PL/SQL Block for Salary Calculation

DECLARE
    v_salary1 NUMBER := 5000;
    v_salary2 NUMBER := 7000;
    v_total_salary NUMBER;
BEGIN
    v_total_salary := v_salary1 + v_salary2;
    DBMS_OUTPUT.PUT_LINE('Total Salary: ' || v_total_salary);
END;
/

-- Question 3: Creating an Index on OrderAmount

CREATE INDEX idx_order_amount ON Orders(OrderAmount);
