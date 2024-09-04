

CREATE  PROCEDURE [dbo].[sp_CalculateEquipmentFutureValues_DEP_NA] 
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


--DECLARE @Make VARCHAR(100)= 'CATERPILLAR', @Model VARCHAR(50)= '930K',
-- @YearMake INT= 2012, @DaysFrom INT= 0, @DaysTo INT= 365, @MilesFrom INT= 0, 
-- @MilesTo INT= 999999999, @SalesDate DATE, @Hours INT, @Cnt INT
-- , @CategoryId INT  = 1060 ,@SubCategoryId  INT = 0,@SelectedIds varchar(1000)  = '32681,32987,32988,32989,32990,32991,32992,32993,32994,32995,32996,32997,32998,32999,33000,33001,33002,33003,33004,33005,33006,33007,33008,33009,33010,33011,33012,33013,33014,33015,33016,33017,33018,33019,33020,33021,49021,49544,49545,49546,49580,49581,49582,49583,49584,49585,49586,49587,49588,49589,49590,49591,49592,49593,49594,49595,49596,49597,49598,49599,49600,49601,49602,49603,49604,49605,49606,49607,49608,49609,49610,49611,49612,49613,49614,49615,49650,49651,49652,49653,49654,49655,49656,49657,49658,49659,49660,49661,49662,49663,49664,49665,49685,49686,49687,49688,49689,49690,49691,49692,49693,49694,49695,49696,49697,49698,49699,49700,76574,174109,174150,174158,174176,174198,174200,174608,174617,174737'
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



 if  @YearMake < YEAR(GETDATE()) - 10
 BEGIN
 INSERT @YH
 SELECT distinct FutureYear,HoursAfterTenYears FROM  [dbo].[EquipmentSubCategoryHoursYear], @Y
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


IF (@SelectedIds IS NULL OR LTRIM(RTRIM(@SelectedIds)) = '' )
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
    ,@Model [Model]
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
	LEFT JOIN [dbo].[EquipmentSubCategory] s ON s.EquipmentCategoryId = c.Id and m.EquipmentSubCategoryId = s.Id
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
   GROUP BY 
   e.Name
   ,[Year]
   ORDER BY 
   MAKE,
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
    ,@Model [Model]
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
	LEFT JOIN [dbo].[EquipmentSubCategory] s ON s.EquipmentCategoryId = c.Id and m.EquipmentSubCategoryId = s.Id
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
   ,[Year]
   ORDER BY 
   MAKE,  
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
	
	SELECT * FROM  @T2

GO

