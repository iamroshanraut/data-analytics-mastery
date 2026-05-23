/*
SQL Practice File
Topics Covered:
- SELECT
- LIMIT
- WHERE
- AND / OR
- LIKE
- ORDER BY
- ALIAS
- GROUP BY
- AVG()
- SUM()
- HAVING
*/

-- =====================================================
-- 1. View all customer records
-- =====================================================

SELECT
    *
FROM
    dim_customer;


-- =====================================================
-- 2. LIMIT
-- Get first 20 customers with selected columns
-- =====================================================

SELECT
    customer_id,
    email,
    first_name
FROM
    dim_customer
LIMIT 20;


-- =====================================================
-- 3. WHERE
-- Find all female customers
-- =====================================================

SELECT
    *
FROM
    dim_customer
WHERE
    gender = 'F';


-- =====================================================
-- 4. AND / OR
-- Find female customers from France OR customers who joined after 2022-01-01
-- =====================================================

SELECT
    *
FROM
    dim_customer
WHERE
    gender = 'F'
    AND (
        country = 'France'
        OR join_date > '2022-01-01'
    );


-- =====================================================
-- 5. LIKE
-- Find customers whose first name starts with T
-- =====================================================

SELECT
    *
FROM
    dim_customer
WHERE
    first_name LIKE 'T%';


-- Find customers whose first name starts with T and ends with y

SELECT
    *
FROM
    dim_customer
WHERE
    first_name LIKE 'T%y';


-- Find customers whose first name starts with T,
-- has any two characters, then f, and ends with y

SELECT
    *
FROM
    dim_customer
WHERE
    first_name LIKE 'T__f%y';


-- =====================================================
-- 6. ORDER BY
-- Sort products by unit price from highest to lowest
-- =====================================================

SELECT
    *
FROM
    dim_product
ORDER BY
    unit_price DESC;


-- =====================================================
-- 7. Top 3 expensive products
-- =====================================================

SELECT
    *
FROM
    dim_product
ORDER BY
    unit_price DESC
LIMIT 3;


-- =====================================================
-- 8. ALIAS
-- Rename columns in output
-- =====================================================

SELECT
    product_key,
    product_id,
    product_name AS "Product Name",
    category
FROM
    dim_product;


-- =====================================================
-- 9. GROUP BY
-- Find average price and total price category-wise
-- =====================================================

SELECT
    category,
    AVG(unit_price) AS avg_price,
    SUM(unit_price) AS total_price
FROM
    dim_product
GROUP BY
    category;


-- =====================================================
-- 10. HAVING
-- Find categories where average unit price is greater than 500
-- =====================================================

SELECT
    category,
    AVG(unit_price) AS avg_price,
    SUM(unit_price) AS total_price
FROM
    dim_product
GROUP BY
    category
HAVING
    AVG(unit_price) > 500;


-- =====================================================
-- Practice Questions
-- =====================================================

-- Q1. Find all male customers from Germany.

SELECT
    *
FROM
    dim_customer
WHERE
    gender = 'M'
    AND country = 'Germany';


-- Q2. Find customers whose first name starts with A.

SELECT
    *
FROM
    dim_customer
WHERE
    first_name LIKE 'A%';


-- Q3. Find top 5 cheapest products.

SELECT
    *
FROM
    dim_product
ORDER BY
    unit_price ASC
LIMIT 5;


-- Q4. Find total unit price category-wise.

SELECT
    category,
    SUM(unit_price) AS total_price
FROM
    dim_product
GROUP BY
    category;


-- Q5. Find categories where total unit price is greater than 2000.

SELECT
    category,
    SUM(unit_price) AS total_price
FROM
    dim_product
GROUP BY
    category
HAVING
    SUM(unit_price) > 2000;
