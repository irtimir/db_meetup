-- 1-2 console
SELECT * FROM class_values;

-- 1-2 console
BEGIN ISOLATION LEVEL REPEATABLE READ;

-- 1 console
SELECT SUM(value) FROM class_values WHERE class = 1;

-- 2 console
SELECT SUM(value) FROM class_values WHERE class = 2;

-- 1 console
INSERT INTO class_values (class, value) VALUES (2, 30);

-- 2 console
INSERT INTO class_values (class, value) VALUES (1, 300);

-- 1-2 console
COMMIT;


-- Same with SERIALIZABLE

-- 1-2 console
BEGIN ISOLATION LEVEL SERIALIZABLE ;

-- 1 console
SELECT SUM(value) FROM class_values WHERE class = 1;

-- 2 console
SELECT SUM(value) FROM class_values WHERE class = 2;

-- 1 console
INSERT INTO class_values (class, value) VALUES (2, 30);

-- 2 console
INSERT INTO class_values (class, value) VALUES (1, 300);

-- 1 console
COMMIT;

-- 2 console
COMMIT;  -- Here we will get transaction error, lets try this example without SELECT's
