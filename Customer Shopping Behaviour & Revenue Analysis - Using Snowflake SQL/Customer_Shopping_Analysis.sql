

-- =====================================================
--                CREATE & AND USE DATABASE
-- =====================================================
create database customer_shop;
use database customer_shop;


-- =====================================================
--                    CREATE SCHEMA
-- =====================================================
create schema customer_data;


-- =====================================================
--                    CREATE STAGE
-- ====================================================

create stage customer;


-- =====================================================
--                 CREATE CSV FILE FORMAT
-- =====================================================

create FILE FORMAT CSV_FORMAT1
type=csv
FIELD_DELIMITER=','
SKIP_HEADER=1
DATE_FORMAT='DD-MM-YYYY';


-- =====================================================
--                 CREATE DATA TABLE
-- =====================================================

CREATE TABLE CUSTOMER_SHOPPING_RAW (
TRANSACTION_ID STRING,
CUSTOMER_ID STRING,
PURCHASE_DATE DATE,
AGE NUMBER,
GENDER STRING,
LOCATION STRING,
ONLINE_OFFLINE STRING,
ONLINE_STORE STRING,
CATEGORY STRING,
ITEM_PURCHASED STRING,
BRAND STRING,
QUANTITY NUMBER,
PURCHASE_AMOUNT NUMBER(10,2),
DISCOUNT NUMBER(5,2),
PAYMENT_METHOD STRING,
PURCHASE_FREQUENCY STRING

);



-- =====================================================
--                LOAD DATA INTO TABLE
-- =====================================================

copy into CUSTOMER_SHOPPING_RAW from @CUSTOMER FILE_FORMAT=CSV_FORMAT1;



-- =========================================================
--                  Business Insights
-- =========================================================


-- TOTAL REVENUE ANALYSIS  --
select sum(PURCHASE_AMOUNT) AS TOTAL_REVENUE FROM  CUSTOMER_SHOPPING_RAW; 


-- REVENUE BY PRODUCT CATEGORY --  
SELECT CATEGORY,SUM(PURCHASE_AMOUNT) AS TOTAL_REVENUE FROM CUSTOMER_SHOPPING_RAW GROUP BY CATEGORY ORDER BY 2 DESC;


-- PAYMENT METHOD ANALYSIS --
SELECT PAYMENT_METHOD, COUNT(*) AS Total_Transactions FROM CUSTOMER_SHOPPING_RAW GROUP BY PAYMENT_METHOD ORDER BY 2 DESC;


-- CUSTOMER SHOPPING BY AGE GROUP --
select case
            when AGE between 18 and 25 then '18-25'
            when AGE between 26 and 35 then '26-35'
            when AGE between 36 and 45 then '36-45'
            when AGE between 46 and 55 then '46-55'
            else '55+' END as Age_Group, count(*) as total_orders from customer_shopping_raw group by Age_Group order by total_orders desc;
            

-- ONLINE STORE PERFORMANCE ANALYSIS --
SELECT ONLINE_STORE,COUNT(*) AS TOTAL_ORDERS FROM CUSTOMER_SHOPPING_RAW GROUP BY 1 ORDER BY 2 DESC;


-- TOP 5 LOCATIONS BY REVENUE --
SELECT LOCATION,SUM(PURCHASE_AMOUNT) AS TOTAL_REVENUE FROM CUSTOMER_SHOPPING_RAW GROUP BY 1 ORDER BY 2 DESC LIMIT 5;


-- SHOPPING BEHAVIOR BY GENDER --
SELECT GENDER,COUNT(*) AS TOTAL_ORDERS FROM CUSTOMER_SHOPPING_RAW GROUP BY 1 ORDER BY 2 DESC ;

-- TOP 5 BRANDS BY ORDER VOLUME --
SELECT BRAND,COUNT(*)AS TOTAL_ORDERS FROM CUSTOMER_SHOPPING_RAW GROUP BY 1 ORDER BY 2 DESC LIMIT 5;


-- MONTHLY REVENUE ANALYSIS --
select MONTHNAME(PURCHASE_DATE) AS MONTH ,SUM(PURCHASE_AMOUNT) AS TOTAL_REVENUE FROM CUSTOMER_SHOPPING_RAW GROUP BY 1,MONTH(purchase_date) order by  MONTH(PURCHASE_DATE)  ;


