-- 1-2 console
BEGIN ISOLATION LEVEL READ COMMITTED;

-- 1-2 console
SELECT * FROM accounts;

-- 1 console
UPDATE accounts SET balance = balance - 500 WHERE name = 'Alice';

-- 2 console
UPDATE accounts SET balance = balance + 500 WHERE name = 'Bob';
SELECT * FROM accounts; -- Here we will see the modified row even before committing
COMMIT;

-- 1-2 console
SELECT * FROM accounts;  -- Here we will see committed rows from other transactions.

-- 1 console
COMMIT;
