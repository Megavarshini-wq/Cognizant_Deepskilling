SET SERVEROUTPUT ON;

BEGIN
  FOR cust IN (SELECT CustomerID, Balance FROM Customers) LOOP
    IF cust.Balance < 500 THEN
      UPDATE Customers
      SET Balance = Balance + 200,
          LastModified = SYSDATE
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE('Bonus added for Customer ID: ' || cust.CustomerID);
    ELSE
      DBMS_OUTPUT.PUT_LINE('No bonus for Customer ID: ' || cust.CustomerID || ', balance is ' || cust.Balance);
    END IF;
  END LOOP;
  COMMIT;
END;
/