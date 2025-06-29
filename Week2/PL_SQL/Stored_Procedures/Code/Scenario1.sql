-- CREATE TABLE Employees (
--     EmployeeID NUMBER PRIMARY KEY,
--     Name VARCHAR2(100),
--     Position VARCHAR2(50),
--     Salary NUMBER,
--     Department VARCHAR2(50)
-- );

-- CREATE TABLE Savings_Account (
--     AccountID NUMBER PRIMARY KEY,
--     CustomerID NUMBER,
--     AccountType VARCHAR2(20),  -- e.g., 'Savings'
--     Balance NUMBER
-- );

-- CREATE TABLE Accounts (
--     AccountID NUMBER PRIMARY KEY,
--     CustomerID NUMBER,
--     AccountType VARCHAR2(20),
--     Balance NUMBER
-- );


-- For Savings_Accounts
-- INSERT INTO Savings_Account (AccountID, CustomerID, AccountType, Balance)
-- VALUES (101, 1001, 'Savings', 5000);

-- INSERT INTO Savings_Account (AccountID, CustomerID, AccountType, Balance)
-- VALUES (102, 1002, 'Savings', 10000);

-- select * from Savings_Account;


-- For Transfer
-- Sample Accounts (used for transfer)

-- INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance)
-- VALUES (201, 1001, 'Current', 3000);  -- Source account for transfer

-- INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance)
-- VALUES (202, 1002, 'Savings', 2000);  -- Destination account

-- INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance)
-- VALUES (203, 1003, 'Savings', 4500);

-- COMMIT;



-- Scenario 1
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  UPDATE Savings_Account
  SET Balance = Balance + (Balance * 0.01);

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('✔ Monthly interest applied to all savings accounts.');
END;
/
SET SERVEROUTPUT ON;
EXEC ProcessMonthlyInterest;