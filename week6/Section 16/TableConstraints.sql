-------NOT NULL CONSTRAINTS -------
CREATE TABLE practices(
	productid INTEGER NOT NULL
)
DROP TABLE pratices;

CREATE TABLE practices(
	practiceid INTEGER NOT NULL,
	practice_field varchar(50) NOT NULL
)

ALTER TABLE products
ALTER unitprice SET NOT NULL;

ALTER TABLE employees
ALTER lastname SET NOT NULL;

---------UNIQUE CONSTRAINTS --------

DROP TABLE practices;

CREATE TABLE practices(
	practiceid INTEGER UNIQUE,
	practice_field varchar(50) NOT NULL
)

----DO yOURSELF ---

CREATE TABLE pets(
	petid INTEGER UNIQUE,
	petname varchar(50) NOT NULL
)
ALTER TABLE shippers
ADD CONSTRAINT companyname_shippers UNIQUE(companyname);

--------------PRIMARY KEY ------
CREATE TABLE practice(
	practiceid INTEGER PRIMARY KEY,
	practice_field varchar(50) NOT NULL
)
INSERT INTO practices(practiceid,practice_field)
VALUES (1,'something')

---DO YOURSELf ---
DROP TABLE pets;

CREATE TABLE pets(
	petid INTEGER PRIMARY KEY,
	petname varchar(50) NOT NULL
)
----Remove Constraints----
ALTER TABLE practices
DROP CONSTRAINT practices_practiceid_key;


ALTER TABLE practices
ADD PRIMARY KEY(practiceid);

-------FOREIGN KEY----------------
DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer PRIMARY KEY,
	practicefield varchar(50) NOT NULL,
	employeeid integer NOT NULL,
	FOREIGN KEY (employeeid) REFERENCES employees(employeeid)
)

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL,
	customerid char(5) NOT NULL,
	FOREIGN KEY (customerid) REFERENCES customers(customerid)
)

---------ADDing CONSTRAINTS using ALTER and CONSTRAINTS -------

ALTER TABLE practices
DROP CONSTRAINT practices_employeeid_fkey;

ALTER TABLE practices
ADD CONSTRAINT practices_employee_fkey
FOREIGN KEY (employeeid) REFERENCES employees(employeeid);

----Do Yourself ------
ALTER TABLE pets
DROP CONSTRAINT pets_customerid_fkey;

ALTER TABLE pets
ADD CONSTRAINT pets_customerid_fkey
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-------CHECK CONSTRAINTS --------
DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer PRIMARY KEY,
	practicefield varchar(50) NOT NULL,
	employeeid integer NOT NULL,
	cost integer constraint practice_cose CHECK (cost>=0 and cost<=1000),
	FOREIGN KEY (employeeid) REFERENCES employees(employeeid)
)

---DO YOURSELF -------
DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL,
	customerid char(5) NOT NULL,
	weight INTEGER DEFAULT 5 CONSTRAINT weight_pets CHECK (weight>0 and weight<50),
	FOREIGN KEY (customerid) REFERENCES customers(customerid)
)

----ALTER CHECK CONSTRAINT ----
ALTER TABLE orders
ADD CONSTRAINT orders_freight CHECK (freight > 0);

-- -- DEFAULT CONSTRAINTS ------
CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL,
	customerid char(5) NOT NULL,
	weight INTEGER DEFAULT 5 CONSTRAINT weight_pets CHECK (weight>0 and weight<50),
	FOREIGN KEY (customerid) REFERENCES customers(customerid)
)

-----ALTER DEFAULT -----
ALTER TABLE practices
ALTER COLUMN cost set DEFAULT 1;

---DO YOUSELF -----
ALTER TABLE suppliers
ALTER COLUMN homepage SET DEFAULT 'N/A';

---DROP DEFAULT -----
ALTER TABLE suppliers
ALTER COLUMN homepage DROP DEFAULT;

-----ADDING / REMOVING CONSTRAINT-----
ALTER TABLE products
ALTER COLUMN discontinued SET NOT NULL;

ALTER TABLE products
ALTER COLUMN discontinued DROP NOT NULL;