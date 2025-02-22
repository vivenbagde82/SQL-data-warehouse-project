/*

DDL Script: Create silver Tables

Script Purpose:
  This script creates tables in the silver schema, dropping existing ables if it already existed.
  Run this script to define the DDL structure of the silver tables
  This script also adds new metadata column (dwh_create_date) which will keep a track of the date a new row was entered on

*/

IF OBJECT_ID('silver.sales_customer', 'U') IS NOT NULL
DROP TABLE silver.sales_customer;
GO
CREATE TABLE silver.sales_customer(
  	cst_customer_id INT,
  	cst_firstname NVARCHAR(50),
  	cst_lastname NVARCHAR(50),
  	cst_phone NVARCHAR(20),
  	cst_email NVARCHAR(50),
  	cst_street NVARCHAR(50),
  	cst_city NVARCHAR(50),
  	cst_state CHAR(2),
  	cst_zip_code INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO


IF OBJECT_ID('silver.sales_staffs', 'U') IS NOT NULL
DROP TABLE silver.sales_staffs;
GO
CREATE TABLE silver.sales_staffs (
  	stf_staff_id INT,
  	stf_firstname NVARCHAR(50),
  	stf_lastname NVARCHAR(50),
  	stf_email NVARCHAR(50),
  	stf_phone NVARCHAR(20),
  	stf_active INT,
  	stf_store_id INT,
  	stf_manager_id NVARCHAR(10),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO


IF OBJECT_ID('silver.sales_orders', 'U') IS NOT NULL
DROP TABLE silver.sales_orders;
GO
CREATE TABLE silver.sales_orders (
        od_order_id NVARCHAR(50),
        od_customer_id NVARCHAR(50),
        od_order_status NVARCHAR(50),
        od_order_date NVARCHAR(50),
        od_required_date NVARCHAR(50),
        od_shipped_date NVARCHAR(50),
        od_store_id NVARCHAR(50),
        od_staff_id NVARCHAR(50),
        dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO


IF OBJECT_ID('silver.sales_order_items', 'U') IS NOT NULL
DROP TABLE silver.sales_order_items;
GO
CREATE TABLE silver.sales_order_items (
  	od_it_order_id INT,
  	od_it_item_id INT,
  	od_it_product_id INT,
  	od_it_quantity INT,
  	od_it_list_price DECIMAL(10,2),
  	od_it_discount DECIMAL(3,2),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO


IF OBJECT_ID('silver.sales_stores', 'U') IS NOT NULL
DROP TABLE silver.sales_stores;
GO
CREATE TABLE silver.sales_stores (
  	sto_store_id INT,
  	sto_store_name NVARCHAR(50),
  	sto_phone NVARCHAR(20),
  	sto_email NVARCHAR(50),
  	sto_street NVARCHAR(30),
  	sto_city NVARCHAR(20),
  	sto_state CHAR(2),
  	sto_zipcode INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO


IF OBJECT_ID('silver.production_categories', 'U') IS NOT NULL
DROP TABLE silver.production_categories;
GO
CREATE TABLE silver.production_categories (
	  cat_category_id INT,
	  cat_category_name NVARCHAR(20),
	  dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO


IF OBJECT_ID('silver.production_brands', 'U') IS NOT NULL
DROP TABLE silver.production_brands;
GO
CREATE TABLE silver.production_brands (
  	br_brand_id INT,
  	br_brand_name NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO



IF OBJECT_ID('silver.production_products', 'U') IS NOT NULL
DROP TABLE silver.production_products;
GO
CREATE TABLE silver.production_products (
  	pro_product_id INT,
  	pro_product_name NVARCHAR(70),
  	pro_brand_id INT,
  	pro_category_id INT,
  	pro_model_year INT,
  	pro_list_price DECIMAL(7,2),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO


IF OBJECT_ID('silver.production_stocks', 'U') IS NOT NULL
DROP TABLE silver.production_stocks;
GO
CREATE TABLE silver.production_stocks (
  	sto_store_id INT,
  	sto_product_id INT,
  	sto_quantity INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

