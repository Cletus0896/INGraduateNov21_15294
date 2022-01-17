CREATE TABLE subscribers(
	firstname varchar(200),
	lastname varchar(200),
	email varchar(250),
	signupdate timestamp,
	frequency integer,
	iscustomer boolean
)

-- DoYourself --
Create TABLE returns(
    recordid SERIAL,
	customerid char(10),
	datereturned timestamp,
	productid INTEGER,
	quantity INTEGER,
	orderid INteger
)

------------Alter Table -----------------
ALTER TABLE subscribers
RENAME firstname to first_name;

---Do yourself ---
ALTER TABLE returns
RENAME datereturned TO return_date;

---Alter the table name-----
ALTER TABLE subscribers
RENAME TO email_subscribers;

--DO YORSELF ---
ALTER TABLE returns
RENAME to bad_orders;

-----ALTER ADD COULMN ------
ALTER TABLE email_subscribers
ADD COLUMN last_visit_date timestamp;

---DoYouself ----
ALTER TABLE bad_orders
ADD COLUMN reason text;

----ALter DELETE COLUMN ---
ALTER TABLE email_subscribers
DROP COLUMN last_visit_date;

---Do yourself --

ALTER TABLE bad_orders
DROP COLUMN reason;

-----ALTER CHANGE DATA TYPE -----
ALTER TABLE email_subscribers
ALTER COLUMN email SET DATA TYPE varchar(255);

-----DROP TABLES -----
DROP TABLE email_subscribers;

--DO YOURSELF ---
DROP TABLE bad_orders;
