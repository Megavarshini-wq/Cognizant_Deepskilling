SET SERVEROUTPUT ON;

BEGIN
  FOR cust IN (
    SELECT CustomerID, Balance FROM Customers
  ) LOOP
    IF cust.Balance > 2000 THEN
      UPDATE Customers
      SET Balance = Balance - 100,
          LastModified = SYSDATE
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE('Penalty applied for Customer ID: ' || cust.CustomerID);
    ELSE
      DBMS_OUTPUT.PUT_LINE('No penalty for Customer ID: ' || cust.CustomerID || ', balance is ' || cust.Balance);
    END IF;
  END LOOP;
  COMMIT;
END;
/