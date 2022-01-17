CREATE UNIQUE INDEX idx_employee_employeeid
ON employees (employeeid);

--DO yourself ---
CREATE INDEX idx_orders_customerid_orderid
ON orders (customerid,orderid);

---DROP index ---
DROP INDEX  idx_orders_customerid_orderid;

--Do yourself --
DROP INDEX  idx_employee_employeeid;

--KILL A runaway process --
DROP TABLE IF EXISTS performance_test;

CREATE TABLE performance_test (
  id serial,
  location text
);

INSERT INTO performance_test (location)
SELECT 'Katmandu, Nepal' FROM generate_series(1,500000000);

-- to see which is active ---
SELECT * FROM pg_stat_activity WHERE state = 'active';

--to stop what running with particular id ---
SELECT pg_cancel_backend(21388);

//stop at all costs - can lead to full database restart
SELECT pg_terminate_backend(PID);

-- -- Query plan ---------
DROP TABLE IF EXISTS performance_test;

CREATE TABLE performance_test (
  id serial,
  location text
);

INSERT INTO performance_test (location)
SELECT md5(random()::text) FROM generate_series(1,10000000);

SELECT COUNT(*) FROM performance_test;

SELECT * FROM performance_test
WHERE id = 2000000;

Explain SELECT COUNT(*) FROM performance_test;

Explain SELECT * FROM performance_test
WHERE id = 2000000;

------Create with index -----------
CREATE INDEX idx_performance_test_id ON performance_test (id);

Explain SELECT * FROM performance_test
WHERE id = 2000000;

SELECT * FROM performance_test
WHERE id = 2000000;


-- -- -- Analyze update performance ------
DROP TABLE IF EXISTS performance_test;

CREATE TABLE performance_test (
  id serial,
  location text
);

INSERT INTO performance_test (location)
SELECT md5(random()::text) FROM generate_series(1,10000000);

EXPLAIN ANALYZE SELECT * FROM performance_test
WHERE id = 2000000;

SET max_parallel_workers_per_gather = 0;

EXPLAIN SELECT * FROM performance_test
WHERE location like 'ab%';

--SEE  table size --
SELECT pg_relation_size('performance_test'),
  pg_size_pretty(pg_relation_size('performance_test'));
  
--RELATION PAGES --
SELECT relpages
FROM pg_class
WHERE relname='performance_test';

-- I/O cost per relationship page read
SHOW seq_page_cost;

-- total I/O cost
SELECT relpages * current_setting('seq_page_cost')::numeric
FROM pg_class
WHERE relname='performance_test';

-- number of row --
SELECT reltuples
FROM pg_class
WHERE relname='performance_test';

--CPU cost per row processed --
SHOW cpu_tuple_cost;
SHOW cpu_operator_cost;

-- total CPU costs ---
SELECT reltuples * current_setting('cpu_tuple_cost')::numeric +
reltuples * current_setting('cpu_operator_cost')::numeric
FROM pg_class
WHERE relname='performance_test';


