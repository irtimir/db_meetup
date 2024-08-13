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


-- SELECT FOR UPDATE

-- 1-2 console
BEGIN ISOLATION LEVEL READ COMMITTED;

-- 1 console
SELECT * FROM accounts WHERE name = 'Alice' FOR UPDATE;

-- 2 console
SELECT * FROM accounts WHERE name = 'Alice' FOR UPDATE;  -- Here we will wait until the first transaction completes (COMMIT/ROLLBACK).

-- 1 console
UPDATE accounts SET balance = balance + 500 WHERE name = 'Alice';
COMMIT; -- 2'nd transaction will acquire the lock and be ready to modify the row.

-- 2 console
UPDATE accounts SET balance = balance - 500 WHERE name = 'Alice';
COMMIT;
