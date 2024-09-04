
-- exec  [dbo].[CreateAllTrucks]

CREATE procedure [dbo].[CreateAllTrucks]
as
--get list of all equipment cat, subcat, years
--add cu
DECLARE 
@make1  varchar(200), 
@model1 varchar(200), 
 @CategoryName1   varchar(200), 
 @SubCategoryName1   varchar(200), 
 @YearMake1 INT

 TRUNCATE TABLE TruckFutureValues

-- drop table EquipmentFutureValues
--		create table EquipmentFutureValues
--		(
--		Id int not null identity(1,1),
--		Make varchar(200),
--Model varchar(200),
--Year int,
--FutureYear int,
--AvgSalePrice money,
--MinSalePrice money,
--MaxSalePrice money,
--ProjectedMiles int,
--MinHoursMiles int,
--MaxHoursMiles int,
--CountNumber int,
--LogSalePrice money,
--		constraint PK_EquipmentFutureValues PRIMARY KEY (Id)
--		)

DECLARE vendor_cursor CURSOR FOR   
SELECT 
e.name,  model , c.Name CategoryName, s.Name SubcategoryName,  year
FROM [dbo].[TruckPaperEquipment] m  (nolock)
	JOIN [dbo].[EquipmentCategoryManufacturer] e (nolock) ON m.[EquipmentCategoryManufacturerId] = e.Id
	JOIN [dbo].[EquipmentCategory] c (nolock) ON E.EquipmentCategoryId = c.Id
	JOIN [dbo].[EquipmentSubCategory] s (nolock) ON s.EquipmentCategoryId = c.Id and m.EquipmentSubCategoryId = s.Id
	WHERE year <> 0 and [HoursMiles] <> 0 --and Model = N'D6T' and c.id = 1025 and s.id = 1026
	AND C.Name = 'Heavy Duty Trucks'
	group by e.name,  model, year, c.name , s.name 
	ORDER BY 1,2,5

OPEN vendor_cursor  

FETCH NEXT FROM vendor_cursor   
INTO @make1, @model1,  @CategoryName1, @SubCategoryName1, @YearMake1

WHILE @@FETCH_STATUS = 0  
BEGIN  
  
 
  EXEC [dbo].[sp_CalculateTruckFutureValues_NEW_1]
	     @Make = @make1,
		@Model = @model1 ,
		@SiteCategoryName = @CategoryName1,
		@SiteSubCategoryName = @SubCategoryName1,
		@YearMake = @YearMake1,
		@DaysFrom = 1,
		@DaysTo = 730,
		@MilesFrom = 0,
		@MilesTo = 9999999,
		@SelectedIds = ''

  FETCH NEXT FROM vendor_cursor   
    INTO  @make1, @model1,  @CategoryName1, @SubCategoryName1, @YearMake1
END   
CLOSE vendor_cursor;  
DEALLOCATE vendor_cursor;

GO

