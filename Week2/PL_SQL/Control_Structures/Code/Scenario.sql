-- Table 1

-- CREATE TABLE Customers (
--     CustomerID NUMBER PRIMARY KEY,
--     Name VARCHAR2(100),
--     DOB DATE,
--     Balance NUMBER,
--     LastModified DATE
-- );

-- Table 2

-- CREATE TABLE Loans (
--     LoanID NUMBER PRIMARY KEY,
--     CustomerID NUMBER,
--     LoanAmount NUMBER,
--     InterestRate NUMBER,
--     StartDate DATE,
--     EndDate DATE,
--     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
-- );

-- INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
-- VALUES (1, 'John Doe', TO_DATE('1950-05-15', 'YYYY-MM-DD'), 1000, SYSDATE);

-- INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
-- VALUES (1, 1, 5000, 5, SYSDATE, ADD_MONTHS(SYSDATE, 60));

-- select* from Loans;
-- COMMIT;


SET SERVEROUTPUT ON;

BEGIN
   FOR cust IN (
      SELECT c.CustomerID, c.DOB, l.LoanID, l.InterestRate
      FROM Customers c
      JOIN Loans l ON c.CustomerID = l.CustomerID
   ) LOOP
      IF MONTHS_BETWEEN(SYSDATE, cust.DOB)/12 > 60 THEN
         UPDATE Loans
         SET InterestRate = InterestRate - 1
         WHERE LoanID = cust.LoanID;

         DBMS_OUTPUT.PUT_LINE('Discount applied for Customer ID: ' || cust.CustomerID);
      END IF;
   END LOOP;
   COMMIT;
END;
/