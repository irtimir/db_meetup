-- 1-2 console
BEGIN ISOLATION LEVEL SERIALIZABLE;
SELECT * FROM accounts WHERE name IN ('Alice', 'Bob');

-- 1 console
UPDATE accounts SET balance = balance - 100 WHERE name = 'Alice';
UPDATE accounts SET balance = balance + 100 WHERE name = 'Bob';

-- 2 console
UPDATE accounts SET balance = balance - 200 WHERE name = 'Bob';

-- 1 console
COMMIT;

-- 2 console
COMMIT;  -- Here we will get a transaction error, let's try this example without SELECT's
