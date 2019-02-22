-- Table - People 

CREATE TABLE person ( person_id SERIAL, name VARCHAR(200), age INTEGER, height INTEGER, city VARCHAR(200), favorite_color VARCHAR(200) );
INSERT INTO person ( name, age, height, city, favorite_color ) VALUES ( 'First Last', 21, 182, 'City', 'Color' );
SELECT * FROM person ORDER BY height DESC;
SELECT * FROM person ORDER BY height ASC;
SELECT * FROM person ORDER BY age DESC;
SELECT * FROM person WHERE age > 20;
SELECT * FROM person WHERE age = 18;
SELECT * FROM person WHERE age < 20 OR age > 30;
SELECT * FROM person WHERE age != 27;
SELECT * FROM person WHERE favorite_color != 'red';
SELECT * FROM person WHERE favorite_color != 'red' AND favorite_color != 'blue';
SELECT * FROM person WHERE favorite_color = 'orange' OR favorite_color = 'green';
SELECT * FROM person WHERE favorite_color IN ( 'orange', 'green', 'blue' );
SELECT * FROM person WHERE favorite_color IN ( 'yellow', 'purple' );

-- Table - orders

CREATE TABLE orders ( person_id SERIAL, product_name VARCHAR(200), product_price NUMERIC, quantity INTEGER );
INSERT INTO orders ( person_id, product_name, product_price, quantity ) VALUES ( 0, 'Product', 4.25, 4 );
SELECT * FROM orders;
SELECT SUM(quantity) FROM orders;
SELECT SUM(product_price * quantity) FROM orders;
SELECT SUM(product_price * quantity) FROM orders WHERE person_id = 1;

-- Table - artist


-- 1. Add 3 new artists to the artist table. ( It's already created )
INSERT INTO artist ( name ) VALUES ( 'Joe' );
INSERT INTO artist ( name ) VALUES ( 'Sally' );
INSERT INTO artist ( name ) VALUES ( 'Fred' );

-- 2. Select 10 artists in reverse alphabetical order.
SELECT * FROM artist ORDER BY name DESC LIMIT 10;

-- 3. Select 5 artists in alphabetical order.
SELECT * FROM artist ORDER BY name ASC LIMIT 5;

-- 4. Select all artists that start with the word 'Black'. LIKE is weird and has & and _ to read about.
SELECT * FROM artist WHERE name LIKE 'Black%';

-- 5. Select all artists that contain the word 'Black'.
SELECT * FROM artist WHERE name LIKE '%Black%';

-- Table - employee


-- 1. List all employee first and last names only that live in Calgary.
SELECT first_name, last_name FROM employee WHERE city = 'Calgary';
-- 2. Find the birthdate for the youngest employee.
SELECT MAX(birth_date) FROM employee;
-- 3. Find the birthdate for the oldest employee.
SELECT MIN(birth_date) FROM employee;
-- 4. Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
--    * You will need to query the employee table to find the Id for Nancy Edwards (Query by: SELECT * FROM employee, you see Nancy has an ID of "2")
SELECT * FROM employee WHERE reports_to = 2;
-- 5. Count how many people live in Lethbridge.
SELECT COUNT(*) FROM employee WHERE city = 'Lethbridge';

-- Table - invoice

-- 1. Count how many orders were made from the USA.
SELECT COUNT(*) FROM invoice WHERE billing_county = 'USA';
-- 2. Find the largest order total amount.
SELECT MAX(total) FROM invoice;
-- 3. Find the smallest order total amount.
SELECT MIN(total) FROM invoice;
-- 4. Find all orders bigger than $5.
SELECT * FROM invoice WHERE total > 5;
-- 5. Count how many orders were smaller than $5.
SELECT COUNT(*) FROM invoice WHERE total < 5;
-- 6. Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(*) FROM invoice WHERE billing_state in ('CA', 'TX', "AZ");
-- 7. Get the average total of the orders.
SELECT AVG(total) FROM invoice;
-- 8. Get the total sum of the orders.
SELECT SUM(total) FROM invoice;