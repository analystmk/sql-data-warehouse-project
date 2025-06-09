/*
--------------------------------------------------------------------------------
 Description  : 
                This script creates and initializes the tables in the 'bronze' 
                layer of a data warehouse. It first checks for the existence of 
                each table and drops it if present, then recreates the table 
                structure. These tables are typically used for raw ingestion 
                from CRM and ERP systems.
 Tables Created:
    - bronze.crm_cust_info
    - bronze.crm_prd_info
    - bronze.crm_sales_details
    - bronze.erp_cust_az12
    - bronze.erp_loc_101
    - bronze.erp_px_cat_g1v2

 Usage        : Run in SQL Server Management Studio or integrated pipeline.
--------------------------------------------------------------------------------
*/

IF OBJECT_ID('bronze.crm_cust_info','U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info
GO
CREATE TABLE bronze.crm_cust_info(
	cst_id				INT,
	cst_key				NVARCHAR(50),
	cst_firstname		NVARCHAR(50),
	cst_lastname		NVARCHAR(50),
	cst_marital_status	NVARCHAR(50),
	cst_gndr			NVARCHAR(50),
	cst_create_date		DATE
);
GO

IF OBJECT_ID('bronze.crm_prd_info','U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info
GO
CREATE TABLE bronze.crm_prd_info(
	prd_id			INT,
	prd_key			NVARCHAR(50),
	prd_nm			NVARCHAR(50),
	prd_cost		INT,
	prd_line		NVARCHAR(50),
	prd_start_dt	DATETIME,
	prd_end_dt		DATETIME

);
GO

IF OBJECT_ID('bronze.crm_sales_details','U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details
GO
CREATE TABLE bronze.crm_sales_details(
	sls_ord_num		NVARCHAR(50),
	sls_prd_key		NVARCHAR(50),
	sls_cust_id		INT,
	sls_order_dt	INT,
	sls_ship_dt		INT,
	sls_due_dt		INT,
	sls_sales		INT,
	sls_quantity	INT,
	sls_price		INT

);
GO

IF OBJECT_ID('bronze.erp_cust_az12','U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12
GO
CREATE TABLE bronze.erp_cust_az12(
	cid		NVARCHAR(50),
	bdate	DATE,
	gen		NVARCHAR(50)
);
GO

IF OBJECT_ID('bronze.erp_loc_101','U') IS NOT NULL
	DROP TABLE bronze.erp_loc_101
GO
CREATE TABLE bronze.erp_loc_101(
	cid		NVARCHAR(50),
	cntry	NVARCHAR(50)
);
GO

IF OBJECT_ID('bronze.erp_px_cat_g1v2','U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2
GO
CREATE TABLE bronze.erp_px_cat_g1v2(
	id			NVARCHAR(50),
	cat			NVARCHAR(50),
	subcat		NVARCHAR(50),
	maintenance NVARCHAR(50)
);
GO
