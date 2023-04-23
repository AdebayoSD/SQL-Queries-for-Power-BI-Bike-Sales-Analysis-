-- All the queries below are queries written to get data from AdventureWorks Database to analyse Bike sales across 6 Business locations
-- To check profitability and Customer Demography
-- Analysis is also expected to determine improvement areas withing the business
-- Determine which business channel is more profitable (Online and Physical Store)
-- Queries also have comment on required joining relationship required in Power BI


-- This table shows product information for all products (Dimension)
SELECT [ProductID],
	[ProductSubcategoryID],-- Primary Key that would be used to join this to sales order detail table
	[Name],
	[FinishedGoodsFlag],
	[Color],
	[StandardCost],
	[ListPrice]
FROM [Production].[Product]

-- This table shows Product Category information for all products (Dimension)
SELECT [ProductCategoryID], -- Primary Key that would be used to join this table to Product Subcategory using many to one relationship
		[Name]
FROM [Production].[ProductCategory]

-- This table shows Product SubCategory information for all products (Dimension)
SELECT [ProductSubcategoryID], -- Primary Key that would be used to join this to Product category table to Product Table
	[ProductCategoryID],
	[Name]
FROM [Production].[ProductSubcategory]


-- This table shows Very detailed Sales information for all transactions (Fact Table)
SELECT [SalesOrderID],
		[SalesOrderDetailID],-- Connects to SalesOder Detail Table  
		[OrderQty],
		[ProductID],-- Coonects to Products Table (Many to One)
		[SpecialOfferID], --Connects to Special Offers Table   (Many to One)
		[UnitPrice],
		[UnitPriceDiscount],
		[LineTotal]
FROM [Sales].[SalesOrderDetail]


-- This table shows Sales information for all transactions by grouping each order basket as one transaction
SELECT [OrderDate],
	[SalesOrderID],-- Primary Key that would be used to join this to SalesOrder Header table to SalesOrder Detail Table
	[OnlineOrderFlag],
	[CustomerID],
	[TerritoryID],
	[SubTotal],
	[TaxAmt],
	[Freight],
	[TotalDue]
FROM [Sales].[SalesOrderHeader]

--This table shows Territory information for all transactions (Dimension)
SELECT [TerritoryID],--Primary Key that would be used to join this Territory table to SalesOrder Header Table
	[Name],
	[Group]
FROM [Sales].[SalesTerritory]

--This table shows Promotions and Special offer information for all Sales (Dimension)
SELECT [SpecialOfferID], --Primary Key that would be used to join this Special Offers table to SalesOrder Detail Table
	[DiscountPct],
	[Type]
FROM [Sales].[SpecialOffer]


