/*

Creating database and Schemas

Script Purpose: 
This script creates a new databse named 'DataWarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas within the databse: bronze, silver and gold.

WARNING:
Running this script will drop the entire 'DataWarehouse' databse if it exists.
All data in databse will be permanently deleted. Proceed with caution and ensure you have proper backups before running this script.

*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.database WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DatwaWarehouse SET SINGLE USER IWTH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create bronze, silver and gold schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
