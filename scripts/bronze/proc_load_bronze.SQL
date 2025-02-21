/*

Stored Procedure: Load Bronze layer (Source -> Bronze)

Script Purpose:
  This stored procedure loads data into bronze schema from external CSV files
  It performs the following actions:
  - Truncates the bronze  tables before loading data.
  - Uses the BULK INSERT command to load the data from CSV files to bronze tables.

Parameters:
  None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
  EXEC bronze.load_bronze;
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
  	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    SET @batch_start_time = GETDATE()
  	BEGIN TRY
    		PRINT '************************'
            PRINT 'Loading the bronze layer'
    		PRINT '************************'
            PRINT ''
    		PRINT 'Loading the sales tables'
            PRINT '========================'
            
    		SET @start_time = GETDATE()
      
    		TRUNCATE TABLE bronze.sales_customer;
            PRINT ''
			PRINT 'TRUNCATE TABLE bronze.sales_customer'
    		BULK INSERT bronze.sales_customer
    		FROM 'C:\Users\viven\Downloads\Bikestore database\sales\customers.csv'
    		WITH (
      			FIRSTROW = 2,
      			FIELDTERMINATOR = ',',
      			TABLOCK
  		    );
            PRINT 'BULK INSERT bronze.sales_customer'

    		TRUNCATE TABLE bronze.sales_order_items;
            PRINT ''
			PRINT 'TRUNCATE TABLE bronze.sales_order_items'
    		BULK INSERT bronze.sales_order_items
    		FROM 'C:\Users\viven\Downloads\Bikestore database\sales\order_items.csv'
    		WITH (
      			FIRSTROW = 2,
      			FIELDTERMINATOR = ',',
      			TABLOCK
    		);
            PRINT 'BULK INSERT bronze.sales_order_items'

    		TRUNCATE TABLE bronze.sales_orders;
            PRINT ''
			PRINT 'TRUNCATE TABLE bronze.sales_orders'
    		BULK INSERT bronze.sales_orders
    		FROM 'C:\Users\viven\Downloads\Bikestore database\sales\orders.csv'
    		WITH (
          		FIRSTROW = 2,
          		FIELDTERMINATOR = ',',
          		TABLOCK
    		);
            PRINT 'BULK INSERT bronze.sales_orders'

    		TRUNCATE TABLE bronze.sales_staffs;
            PRINT ''
			PRINT 'TRUNCATE TABLE bronze.sales_staffs'
    		BULK INSERT bronze.sales_staffs
    		FROM 'C:\Users\viven\Downloads\Bikestore database\sales\staffs.csv'
    		WITH (
      			FIRSTROW = 2,
      			FIELDTERMINATOR = ',',
      			KEEPNULLS,
      			TABLOCK
    		);
            PRINT 'BULK INSERT bronze.sales_staffs'

    		TRUNCATE TABLE bronze.sales_stores;
            PRINT ''
			PRINT 'TRUNCATE TABLE bronze.sales_stores'
    		BULK INSERT bronze.sales_stores
    		FROM 'C:\Users\viven\Downloads\Bikestore database\sales\stores.csv'
    		WITH (
    			FIRSTROW = 2,
    			FIELDTERMINATOR = ',',
    			KEEPNULLS,
    			TABLOCK
    		);
            PRINT 'BULK INSERT bronze.sales_stores'
            
    		SET @end_time = GETDATE()
            PRINT ''
    		PRINT 'Loading time sales tables: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
            PRINT ''
            PRINT ''
    
    		PRINT 'Loading production tables'
            PRINT '============================='
    		SET @start_time = GETDATE()
      
    		TRUNCATE TABLE bronze.production_brands;
            PRINT ''
			PRINT 'TRUNCATE TABLE bronze.production_brands'
    		BULK INSERT bronze.production_brands
    		FROM 'C:\Users\viven\Downloads\Bikestore database\production\brands.csv'
    		WITH (
    			FIRSTROW = 2,
    			FIELDTERMINATOR = ',',
    			KEEPNULLS,
    			TABLOCK
    		);
            PRINT 'BULK INSERT bronze.production_brands'
    
    		TRUNCATE TABLE bronze.production_categories;
            PRINT ''
			PRINT 'TRUNCATE TABLE bronze.production_categories'
    		BULK INSERT bronze.production_categories
    		FROM 'C:\Users\viven\Downloads\Bikestore database\production\categories.csv'
    		WITH (
    			FIRSTROW = 2,
    			FIELDTERMINATOR = ',',
    			KEEPNULLS,
    			TABLOCK
    		);
            PRINT 'BULK INSERT bronze.production_categories'
    
    		TRUNCATE TABLE bronze.production_products;
            PRINT ''
			PRINT 'TRUNCATE TABLE bronze.production_products'
    		BULK INSERT bronze.production_products
    		FROM 'C:\Users\viven\Downloads\Bikestore database\production\products.csv'
    		WITH (
    			FIRSTROW = 2,
    			FIELDTERMINATOR = ',',
    			KEEPNULLS,
    			TABLOCK
    		);
            PRINT 'BULK INSERT bronze.production_products'
    
    		TRUNCATE TABLE bronze.production_stocks;
            PRINT ''
			PRINT 'TRUNCATE TABLE bronze.production_stocks'
    		BULK INSERT bronze.production_stocks
    		FROM 'C:\Users\viven\Downloads\Bikestore database\production\stocks.csv'
    		WITH (
    			FIRSTROW = 2,
    			FIELDTERMINATOR = ',',
    			KEEPNULLS,
    			TABLOCK
    		);
            PRINT 'BULK INSERT bronze.production_stocks'
            
    		SET @end_time = GETDATE()
            PRINT ''
    		PRINT 'Loading time production tables:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
            PRINT ''
            PRINT ''
		
		SET @batch_end_time = GETDATE()
		PRINT '+++++++++++++++++++++++++++++++++++++++++++++++++++++++'
		PRINT 'Batch Load time: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds'
		PRINT '+++++++++++++++++++++++++++++++++++++++++++++++++++++++'
	END TRY
	BEGIN CATCH
		PRINT 'Error occured in loading the data'
	END CATCH
END
