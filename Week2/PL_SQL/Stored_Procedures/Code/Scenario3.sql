CREATE OR REPLACE PROCEDURE TransferFunds (
  p_from_account   NUMBER,
  p_to_account     NUMBER,
  p_amount         NUMBER
) IS
  v_balance NUMBER;
BEGIN
  /* 1. Get balance of the source account */
  SELECT Balance
    INTO v_balance
    FROM Accounts
   WHERE AccountID = p_from_account;   -- ← corrected column name

  /* 2. Check balance sufficiency */
  IF v_balance < p_amount THEN
    RAISE_APPLICATION_ERROR(-20001,
      '❌ Insufficient funds in source account.');
  END IF;

  /* 3. Deduct from source */
  UPDATE Accounts
     SET Balance = Balance - p_amount
   WHERE AccountID = p_from_account;   -- ← corrected

  /* 4. Credit destination */
  UPDATE Accounts
     SET Balance = Balance + p_amount
   WHERE AccountID = p_to_account;     -- ← corrected

  /* 5. Commit */
  COMMIT;

  /* 6. Success message */
  DBMS_OUTPUT.PUT_LINE(
    '✔ Transferred ' || p_amount ||
    ' from account ' || p_from_account ||
    ' to account '   || p_to_account );
END;
/
SET SERVEROUTPUT ON;

-- --Check balances
-- SELECT AccountID, Balance
-- FROM   Accounts
-- WHERE  AccountID IN (201, 202);

-- Example: move 500 from account 201 to 202
EXEC TransferFunds(201, 202, 500);

--Check balances
SELECT AccountID, Balance
FROM   Accounts
WHERE  AccountID IN (201, 202);

select * from Accounts;