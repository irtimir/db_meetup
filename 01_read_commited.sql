-- 1-2 console
BEGIN;

-- 1-2 console
SELECT * FROM accounts;

-- 1 console
UPDATE accounts SET balance = balance - 500 WHERE id = 1;

-- 2 console
UPDATE accounts SET balance = balance + 500 WHERE id = 2;
COMMIT;

-- 1-2 console
SELECT * FROM accounts;  -- Here we will see committed rows from other transactions.

-- 1 console
COMMIT;