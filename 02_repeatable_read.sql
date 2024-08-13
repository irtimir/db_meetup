-- 1-2 console
BEGIN ISOLATION LEVEL REPEATABLE READ;

-- 1-2 console
SELECT * FROM accounts;

-- 2 console
UPDATE accounts SET balance = balance + 500 WHERE name = 'Bob';
COMMIT;

-- 1 console
UPDATE accounts SET balance = balance + 500 WHERE name = 'Bob';  -- Here we should get a transaction error! But in READ COMMITED transaction will be successful
ROLLBACK;


-- Phantom reads

-- 1-2 console
BEGIN ISOLATION LEVEL REPEATABLE READ;

-- 1 console
SELECT * FROM accounts;

-- 2 console
INSERT INTO "public"."accounts" (name, balance) VALUES ('Charlie', 1500);
COMMIT;

-- 1 console
SELECT * FROM accounts;  -- Here we will not see the line recorded from another transaction, but in MySQL it will be visible, try it with READ COMMITED
ROLLBACK;