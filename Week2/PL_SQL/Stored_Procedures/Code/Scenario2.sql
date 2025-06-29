-- Scenario2
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  p_department     VARCHAR2,
  p_bonus_percent  NUMBER  -- Pass 10 for 10%
) IS
BEGIN
  UPDATE employees
  SET salary = salary + (salary * (p_bonus_percent / 100))
  WHERE department = p_department;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('✔ Bonus applied to employees in department: ' || p_department);
END;
/
SET SERVEROUTPUT ON;
EXEC UpdateEmployeeBonus('IT', 10);