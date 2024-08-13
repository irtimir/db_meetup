-- Schema

CREATE TABLE IF NOT EXISTS "public"."accounts"
(
    id      SERIAL PRIMARY KEY,
    name    character varying(100) NOT NULL,
    balance numeric(10, 2)         NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_btree
    ON "public"."accounts" USING btree (balance);

CREATE INDEX IF NOT EXISTS idx_hash_unique_name
    ON "public"."accounts" USING hash (name);


CREATE TABLE IF NOT EXISTS "public"."class_values"
(
    class integer,
    value integer
);

--

-- Test data

INSERT INTO "public"."accounts" (name, balance)
VALUES ('Alice', 1000.00),
       ('Bob', 2000.00)
ON CONFLICT DO NOTHING;

INSERT INTO "public"."class_values" (class, value)
VALUES (1, 10),
       (1, 20),
       (2, 100),
       (2, 200)
ON CONFLICT DO NOTHING;

--
