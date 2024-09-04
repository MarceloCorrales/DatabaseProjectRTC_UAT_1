


CREATE  PROCEDURE [dbo].[sp_CalculateEquipmentFutureValues_DEP_EQ_One] 
(@Make      VARCHAR(100),
 @Model     VARCHAR(50),
 @CategoryId  int  ,
 @SubCategoryId  int ,
 @YearMake  INT,
 @DaysFrom  INT,
 @DaysTo    INT,
 @MilesFrom INT,
 @MilesTo   INT,
 @SelectedIds  VARCHAR(max) 
)
AS


--  EXEC [dbo].[sp_CalculateEquipmentFutureValues_DEP] @Make = 'CATERPILLAR', @Model = '345CL', @CategoryId  = 1031 ,
-- @SubCategoryId  = 1032, @YearMake = 2016, @DaysFrom = 1, @DaysTo = 730, @MilesFrom = 0, @MilesTo = 999999999,  
-- @SelectedIds = '8361,47796,8362'

--329d--1055--1072
--329d
--345CL--1031--1032

--DECLARE @Make VARCHAR(100)= 'CATERPILLAR', @Model VARCHAR(50)= '345CL',
-- @YearMake INT= 2006, @DaysFrom INT= 0, @DaysTo INT= 365, @MilesFrom INT= 0, 
-- @MilesTo INT= 999999999, @SalesDate DATE, @Hours INT, @Cnt INT
-- , @CategoryId INT  = 1031 ,@SubCategoryId  INT = 1032, @sql varchar(2000),@SelectedIds varchar(1000)  = '8361,8362'
-- ;

DECLARE @sql varchar(2000)
       ,@sqlwhere  varchar(1000)
	  ,@factorpct decimal(5,2)

DECLARE @Y TABLE
(
Id smallint identity(1,1),
FutureYear int)
INSERT @Y
SELECT YEAR(GETDATE()) UNION ALL
SELECT YEAR(GETDATE()) + 1 UNION ALL
SELECT YEAR(GETDATE()) + 2  UNION ALL
SELECT YEAR(GETDATE()) + 3  UNION ALL
SELECT YEAR(GETDATE()) + 4


DECLARE @H TABLE
(
Id smallint,
HoursMonth int)

DECLARE @YH TABLE
(FutureYear int,
 HoursMonth int)


 --select @YearMake, @YearMake-1, @YearMake-2,@YearMake-3, @YearMake-4  FROM  [dbo].[EquipmentSubCategoryHoursYear]
 -- WHERE (CategoryId = @CategoryId AND SubCategoryId = @SubCategoryId)  

 if  @YearMake < YEAR(GETDATE()) - 10
 BEGIN
 INSERT @YH
 SELECT FutureYear,HoursAfterTenYears FROM  [dbo].[EquipmentSubCategoryHoursYear], @Y
  WHERE (CategoryId = @CategoryId AND SubCategoryId = @SubCategoryId)
  END
ELSE
BEGIN
SET @sql = 
'
SELECT ROW_NUMBER() OVER(ORDER BY YearMake DESC) AS Id, YearMake 
FROM
(
  select [' + cast(@YearMake as varchar) + '],[' + cast(@YearMake  - 1 as varchar) + '],[' + cast(@YearMake - 2 as varchar) + '],[' + cast(@YearMake - 3 as varchar) + '],[' + cast(@YearMake - 4 as varchar) + ']  FROM  [dbo].[EquipmentSubCategoryHoursYear]
  WHERE (CategoryId = ' + cast(@CategoryId as varchar) + ' AND SubCategoryId = ' + cast(@SubCategoryId as varchar) + ')
)AS p
UNPIVOT
(
  YearMake FOR YearMakes IN ([' + cast(@YearMake as varchar) + '],[' + cast(@YearMake  - 1 as varchar) + '],[' + cast(@YearMake - 2 as varchar) + '],[' + cast(@YearMake - 3 as varchar) + '],[' + cast(@YearMake - 4 as varchar) + '])
)
AS p1'
INSERT @H
exec (@sql)
 INSERT @YH
 SELECT FutureYear ,HoursMonth  FROM @Y y JOIN @H h ON Y.Id = H.Id
END

--SELECT * FROM @YH

DECLARE @T TABLE
(
 Make varchar(100)
,Model varchar(50)
, YearMake int
, AvgSalePrice money
, MinSalePrice money
, MaxSalePrice money
, AvgHoursMiles int
, MinHoursMiles int
, MaxHoursMiles int
, HoursMonth int
,Cnt int
,LogSalesPrice money
)

 DECLARE @T2 TABLE
     (Make           VARCHAR(100),
      Model          VARCHAR(50),
      [Year]         INT,
      FutureYear     INT,
      AvgSalePrice   MONEY,
      MinSalePrice   MONEY,
      MaxSalePrice   MONEY,
      ProjectedMiles INT,
      MinHoursMiles  INT,
      MaxHoursMiles  INT,
      CountNumber    INT,
      LogSalePrice   MONEY
     );

DECLARE @salesprice money


IF (@SelectedIds = NULL OR LTRIM(RTRIM(@SelectedIds)) = '' )
BEGIN
INSERT @T
 (Make
,Model
, YearMake
, AvgSalePrice 
, MinSalePrice 
, MaxSalePrice 
, AvgHoursMiles 
, MinHoursMiles 
, MaxHoursMiles 
, HoursMonth 
,Cnt
,LogSalesPrice
 )
	SELECT
	E.Name Make
    ,[Model]
      ,[Year] 
	 ,AVG(SalePrice) AvgSalePrice
	 ,MIN(SalePrice) MinSalePrice
	 ,MAX(SalePrice) MaxSalePrice
	 ,AVG(HoursMiles) ProjectedMiles
	 ,MIN(HoursMiles) MinHoursMiles
	 ,MAX(HoursMiles) MaxHoursMiles
	 , NULL HoursMonth --,AVG(HoursMonth) HoursMonth
	 ,Count(1) Cnt
	 ,AVG(SalePrice) LogSalesPrice
	FROM [dbo].[MachineryTraderEquipment] m 
	JOIN [dbo].[EquipmentCategoryManufacturer] e ON m.[EquipmentCategoryManufacturerId] = e.Id
	JOIN [dbo].[EquipmentCategory] c ON E.EquipmentCategoryId = c.Id
	JOIN [dbo].[EquipmentSubCategory] s ON s.EquipmentCategoryId = c.Id and m.EquipmentSubCategoryId = s.Id
	where
   (
   [HoursMiles] BETWEEN ISNULL(@MilesFrom,0) AND ISNULL(@MilesTo,3000000)
   )
   AND
   (
   [SaleDate] BETWEEN ISNULL(DATEADD(DAY,-@DaysTo,GETDATE()),0) AND ISNULL(DATEADD(DAY,-@DaysFrom,GETDATE()),360)
   )
	AND
		(
		E.Name = @Make
		AND ([Model] = @Model or ParentModel = @Model)
		AND [Year] = @YearMake
		)
 --    AND m.id not in (SELECT * FROM  dbo.Split(@SelectedIds, ','))
   GROUP BY 
   e.Name
   ,[Model]
   ,[Year]
   ORDER BY 
   MAKE,
   Model,   
   [YEAR]
END
ELSE
BEGIN
INSERT @T
 (Make
,Model
, YearMake
, AvgSalePrice 
, MinSalePrice 
, MaxSalePrice 
, AvgHoursMiles 
, MinHoursMiles 
, MaxHoursMiles 
, HoursMonth 
,Cnt
,LogSalesPrice
 )
SELECT
	E.Name Make
    ,[Model]
      ,[Year] 
	 ,AVG(SalePrice) AvgSalePrice
	 ,MIN(SalePrice) MinSalePrice
	 ,MAX(SalePrice) MaxSalePrice
	 ,AVG(HoursMiles) ProjectedMiles
	 ,MIN(HoursMiles) MinHoursMiles
	 ,MAX(HoursMiles) MaxHoursMiles
	 , NULL HoursMonth --,AVG(HoursMonth) HoursMonth
	 ,Count(1) Cnt
	 ,AVG(SalePrice) LogSalesPrice
	FROM [dbo].[MachineryTraderEquipment] m 
	JOIN [dbo].[EquipmentCategoryManufacturer] e ON m.[EquipmentCategoryManufacturerId] = e.Id
	JOIN [dbo].[EquipmentCategory] c ON E.EquipmentCategoryId = c.Id
	JOIN [dbo].[EquipmentSubCategory] s ON s.EquipmentCategoryId = c.Id and m.EquipmentSubCategoryId = s.Id
	where
   (
   [HoursMiles] BETWEEN ISNULL(@MilesFrom,0) AND ISNULL(@MilesTo,3000000)
   )
   AND
   (
   [SaleDate] BETWEEN ISNULL(DATEADD(DAY,-@DaysTo,GETDATE()),0) AND ISNULL(DATEADD(DAY,-@DaysFrom,GETDATE()),360)
   )
	AND
		(
		E.Name = @Make
		AND ([Model] = @Model or ParentModel = @Model)
		AND [Year] = @YearMake
		)
     AND m.id in (SELECT * FROM  dbo.Split(@SelectedIds, ','))
 GROUP BY 
   e.Name
   ,[Model]
   ,[Year]
   ORDER BY 
   MAKE,
   Model,   
   [YEAR]
END


   --select * from @T

   SET @salesprice = (SELECT AvgSalePrice from @T)
   SET @factorpct = IIF(@salesprice > 50000, 1, @salesprice / 50000)

	--IF (year(getdate()) - @YearMake <= 12 ) and (@salesprice >=45000)
	INSERT @T2
	SELECT * FROM
	( 
		   SELECT 
					Make 
					,Model 
					,YearMake as Year 
					,FutureYear
					, x.AvgSalePrice 
					, MinSalePrice 
					, MaxSalePrice 
					, x.AvgHoursMiles as ProjectedMiles
					, MinHoursMiles 
					, MaxHoursMiles 
					,Cnt as CountNumber 
					 ,x.AvgSalePrice  LogSalesPrice
					 FROM
					(
					SELECT
					 year(getdate()) as FutureYear
					 ,AvgSalePrice
					 ,AvgHoursMiles
					FROM @T

					UNION ALL

					SELECT 
					 year(getdate()) + 1 as FutureYear
					  , AvgSalePrice - 
						   ( (SELECT Factor * @factorpct from EquipmentFactor where [Year] = YearMake) * (SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 1)  * 12)
					  , AvgHoursMiles +   ( (SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 1) * 12)
					FROM @T 

					UNION ALL

					SELECT 
					 year(getdate()) +2 as FutureYear
				      , AvgSalePrice - 
						   ( (SELECT Factor * @factorpct from EquipmentFactor where [Year] = YearMake) * (SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 1) * 12)
						  -  ( (SELECT Factor * @factorpct from EquipmentFactor where [Year] = YearMake - 1) * (SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 2) * 12)
					 , AvgHoursMiles +  ((SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 1) * 12) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 2) * 12)
					FROM @T t JOIN @YH yh ON year(getdate()) + 2 = yh.FutureYear

					UNION ALL

					SELECT 
					 year(getdate()) +3 as FutureYear
				      , AvgSalePrice - 
						   ( (SELECT Factor * @factorpct from EquipmentFactor where [Year] = YearMake) * (SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 1) * 12)
						-  ( (SELECT Factor * @factorpct from EquipmentFactor where [Year] = YearMake - 1) * (SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 2) * 12)
						-  ( (SELECT Factor * @factorpct from EquipmentFactor where [Year] = YearMake - 2) * (SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 3) * 12)
					 , AvgHoursMiles +  ((SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 1) * 12) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 2) * 12) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 3) * 12)
					FROM @T t JOIN @YH yh ON year(getdate()) + 3 = yh.FutureYear

					UNION ALL

					SELECT 
					 year(getdate()) +4 as FutureYear
				      , AvgSalePrice - 
						   ( (SELECT Factor * @factorpct from EquipmentFactor where [Year] = YearMake) * (SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 1) * 12)
						-  ( (SELECT Factor * @factorpct from EquipmentFactor where [Year] = YearMake - 1) * (SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 2) * 12)
						-  ( (SELECT Factor * @factorpct from EquipmentFactor where [Year] = YearMake - 2) * (SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 3) * 12)
						-  ( (SELECT Factor * @factorpct from EquipmentFactor where [Year] = YearMake - 3) * (SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 4) * 12)
					 , AvgHoursMiles +  ((SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 1) * 12) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 2) * 12) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 3) * 12) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =year(getdate()) + 4) * 12)
					FROM @T 
					)x , @T 
	)T1 ORDER BY FutureYear DESC
	
	INSERT INTO  EquipmentFutureValues1
	SELECT * FROM  @T2

GO

