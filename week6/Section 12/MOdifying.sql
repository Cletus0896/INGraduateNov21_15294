CREATE SEQUENCE test_sequence;

--next value----
select nextval('test_sequence');

--current value---
select currval('test_sequence');

--lastvalue---
select lastval();

---set value but next will increment ---
SELECT setval('test_sequence',14);
select nextval('test_sequence');

---set value and next vale will be what u set ---
SELECT setval('test_sequence',16,false);
select nextval('test_sequence');

---to increment by 5----
CREATE SEQUENCE IF NOT EXISTS test_sequence2 INCREMENT 5;

select nextval('test_sequence2');

---INCREMNT/MIN /MAX/START With--
CREATE SEQUENCE IF NOT EXISTS test_sequence_3
INCREMENT 50 MINVALUE 350 MAXVALUE 5000 START WITH 550;

select nextval('test_sequence_3');

--DO YOUSELF ---
CREATE SEQUENCE test_sequence5 increment 7;

---SEQUENCE TO FIELD -----
SELECT MAX(employeeid) FROM employees;

CREATE SEQUENCE IF NOT EXISTS employees_employeeid_seq
START WITH 10 OWNED BY employees.employeeid;

-- -- null value in column "employeeid" of relation "employees" violates not-null constrain -----
INSERT INTO employees
(lastname,firstname,title,reportsto)
VALUES ('Smith','Bob', 'Assistant', 2); 

ALTER TABLE employees
ALTER COLUMN employeeid SET DEFAULT nextval('employees_employeeid_seq');


-------ALTER & DELETE SEQ ---
ALTER SEQUENCE employees_employeeid_seq RESTART WITH 1000
SELECT nextval('employees_employeeid_seq')

ALTER SEQUENCE test_sequence RENAME TO test_sequence_1

DROP SEQUENCE test_sequence_1

-----CREATE TABLE USING SERIAL ----
CREATE TABLE exes (
exid SERIAL,
name varchar(255)
);

INSERT INTO exes (name) VALUES ('Carrie') RETURNING exid
