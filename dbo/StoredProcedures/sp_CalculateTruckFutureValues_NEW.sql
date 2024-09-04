

--USE [RTVDevDb]
--GO
--/****** Object:  StoredProcedure [dbo].[sp_CalculateTruckFutureValues_NEW]    Script Date: 1/16/2018 11:11:23 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

CREATE  PROCEDURE [dbo].[sp_CalculateTruckFutureValues_NEW]
(
 @Make                VARCHAR(100), 
 @Model               VARCHAR(50), 
 @YearMake            INT, 
 @DaysFrom            INT, 
 @DaysTo              INT, 
 @MilesFrom           INT, 
 @MilesTo             INT, 
 @SiteCategoryName    VARCHAR(100), 
 @SiteSubCategoryName VARCHAR(100), 
 @SelectedIds         VARCHAR(MAX), 
 @MilesHoursAdjusted  INT 
)
AS


--DECLARE @Make varchar(100) = 'FREIGHTLINER'
--,@Model varchar(50) =  'CASCADIA 125'--'COLUMBIA 120' -- 
--, @YearMake int = 2008
--, @DaysFrom int = 0
--, @DaysTo int = 365
--, @MilesFrom int = 0
--, @MilesTo int = 999999999
--, @SiteCategoryName    VARCHAR(100) = 'Heavy Duty Trucks'
--, @SiteSubCategoryName VARCHAR(100) =   'Conventional Trucks w/o Sleeper'
--, @SelectedIds  VARCHAR(max)  = NULL
--, @MilesHoursAdjusted  INT = 994000


INSERT [dbo].[Log] 
( [Make] 
 ,[Model] 
 ,[YearMake] 
 ,[DaysFrom] 
 ,[DaysTo] 
 ,[MilesFrom] 
 ,[MilesTo] 
 ,[SiteCategoryName] 
 ,[SiteSubCategoryName] 
 ,[SelectedIds] 
 ,[MilesHoursAdjusted] 
)
SELECT 
 @Make, 
 @Model, 
 @YearMake, 
 @DaysFrom, 
 @DaysTo, 
 @MilesFrom, 
 @MilesTo, 
 @SiteCategoryName, 
 @SiteSubCategoryName, 
 @SelectedIds, 
 @MilesHoursAdjusted 

DECLARE @sql nvarchar(max)
       ,@sqlwhere  nvarchar(max)
	   ,@factorpct decimal(5,2)
	   ,@year int
	   ,@sql1 nvarchar(max)
	   ,@sql2 nvarchar(max)
	   ,@counter int
	   ,@OverUnderMiles int
	   ,@AvgMiles float
	   ,@RemainMiles int
	   ,@AvgDollars money
	   ,@TotalDollars money
	   ,@TotalDollarsDeduct money
	   ,@AvgSalesPrice money

DECLARE @OutputParameter  datetime
       ,@ReturnValue      int

-- CJP changed to show 2018 instead of 2017
--SELECT @YEAR = YEAR(GETDATE()) -1 
SELECT @YEAR = YEAR(GETDATE())


DECLARE @Y TABLE
(
Id smallint identity(1,1),
FutureYear int)
INSERT @Y
SELECT @YEAR UNION ALL
SELECT @YEAR + 1 UNION ALL
SELECT @YEAR + 2  UNION ALL
SELECT @YEAR + 3  UNION ALL
SELECT @YEAR + 4


DECLARE @H TABLE
(
Id smallint,
HoursMonth int)

DECLARE @D TABLE
(
Id smallint,
DollarsMonth float)

DECLARE @E TABLE
(
Id smallint,
Deduct float)

DECLARE @YH TABLE
(FutureYear int,
 HoursMonth int,
 DollarsMonth float,
 Deduct float
 )


SET @sql = 
'
SELECT ROW_NUMBER() OVER(ORDER BY YearMakes DESC) AS Id, YearMake 
FROM
(
  select [' + cast(@YearMake as varchar) + '],[' + cast(@YearMake  - 1 as varchar) + '],[' + cast(@YearMake - 2 as varchar) + '],[' + cast(@YearMake - 3 as varchar) + '],[' + cast(@YearMake - 4 as varchar) + ']  FROM [stg].[TruckYearsMiles]
  WHERE (Make = ''' + cast(@Make as varchar) + ''' AND Model = ''' + cast(@Model as varchar)  + ''' AND SiteSubCategoryName = ''' + @SiteSubCategoryName  + ''')
)AS p
UNPIVOT
(
  YearMake FOR YearMakes IN ([' + cast(@YearMake as varchar) + '],[' + cast(@YearMake  - 1 as varchar) + '],[' + cast(@YearMake - 2 as varchar) + '],[' + cast(@YearMake - 3 as varchar) + '],[' + cast(@YearMake - 4 as varchar) + '])
)
AS p1'
INSERT @H
EXEC (@sql)

SET @sql = 
'
SELECT ROW_NUMBER() OVER(ORDER BY YearMakes DESC) AS Id, YearMake as DollarsMonth 
FROM
(
  select [' + cast(@YearMake as varchar) + '],[' + cast(@YearMake  - 1 as varchar) + '],[' + cast(@YearMake - 2 as varchar) + '],[' + cast(@YearMake - 3 as varchar) + '],[' + cast(@YearMake - 4 as varchar) + ']  FROM [stg].[TruckYearsDollars]
  WHERE (Make = ''' + cast(@Make as varchar) + ''' AND Model = ''' + cast(@Model as varchar)  + ''' AND SiteSubCategoryName = ''' + @SiteSubCategoryName  + ''')
)AS p
UNPIVOT
(
  YearMake FOR YearMakes IN ([' + cast(@YearMake as varchar) + '],[' + cast(@YearMake  - 1 as varchar) + '],[' + cast(@YearMake - 2 as varchar) + '],[' + cast(@YearMake - 3 as varchar) + '],[' + cast(@YearMake - 4 as varchar) + '])
)
AS p1'
INSERT @D
EXEC (@sql)

SET @sql = 
'
SELECT ROW_NUMBER() OVER(ORDER BY YearMakes DESC) AS Id, YearMake as Deduct 
FROM
(
  select [' + cast(@YearMake as varchar) + '],[' + cast(@YearMake  - 1 as varchar) + '],[' + cast(@YearMake - 2 as varchar) + '],[' + cast(@YearMake - 3 as varchar) + '],[' + cast(@YearMake - 4 as varchar) + ']  FROM [stg].[TruckYearsDeduct]
  WHERE (Make = ''' + cast(@Make as varchar) + ''' AND Model = ''' + cast(@Model as varchar)  + ''' AND SiteSubCategoryName = ''' + @SiteSubCategoryName  + ''')
)AS p
UNPIVOT
(
  YearMake FOR YearMakes IN ([' + cast(@YearMake as varchar) + '],[' + cast(@YearMake  - 1 as varchar) + '],[' + cast(@YearMake - 2 as varchar) + '],[' + cast(@YearMake - 3 as varchar) + '],[' + cast(@YearMake - 4 as varchar) + '])
)
AS p1'
INSERT @e
EXEC (@sql)


 INSERT @YH
 SELECT FutureYear ,HoursMonth,DollarsMonth, Deduct  FROM @Y y JOIN @H h ON y.Id = h.Id
							       JOIN @D d ON Y.ID = d.Id and h.id = d.id
								  JOIN @E e ON Y.ID = e.Id and h.id = e.id

--SELECT * FROM @YH

DECLARE @T TABLE
(
  Make varchar(100) 
 ,Model varchar(50) 
 ,YearMake int 
 ,AvgSalePrice money 
 ,MinSalePrice money 
 ,MaxSalePrice money 
 ,AvgHoursMiles int 
 ,MinHoursMiles int 
 ,MaxHoursMiles int 
 ,HoursMonth int 
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

 
IF  ((@SelectedIds IS NULL OR LTRIM(RTRIM(@SelectedIds)) = '' ) AND (@MilesHoursAdjusted IS NULL OR @MilesHoursAdjusted = 0))
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
	 ,AVG(HoursMiles) AvgHoursMiles--ProjectedMiles
	 ,MIN(HoursMiles) MinHoursMiles
	 ,MAX(HoursMiles) MaxHoursMiles
	 , NULL HoursMonth --,AVG(HoursMonth) HoursMonth
	 ,Count(1) Cnt
	 ,AVG(SalePrice) LogSalesPrice
	FROM [dbo].[TruckPaperEquipment] m (NOLOCK)
	JOIN [dbo].[EquipmentCategoryManufacturer] e (NOLOCK) ON m.[EquipmentCategoryManufacturerId] = e.Id
	JOIN [dbo].[EquipmentCategory] c (NOLOCK) ON E.EquipmentCategoryId = c.Id
	JOIN [dbo].[EquipmentSubCategory] s (NOLOCK) ON s.EquipmentCategoryId = c.Id and m.EquipmentSubCategoryId = s.Id
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
   ,[Year]
   ORDER BY 
   MAKE,
   [YEAR]
END
ELSE IF ((@SelectedIds IS NOT NULL OR LTRIM(RTRIM(@SelectedIds)) <> '') AND (@MilesHoursAdjusted IS NULL OR @MilesHoursAdjusted = 0))
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
	 ,AVG(HoursMiles) AvgHoursMiles--ProjectedMiles
	 ,MIN(HoursMiles) MinHoursMiles
	 ,MAX(HoursMiles) MaxHoursMiles
	 , NULL HoursMonth --,AVG(HoursMonth) HoursMonth
	 ,Count(1) Cnt
	 ,AVG(SalePrice) LogSalesPrice
	FROM [dbo].[TruckPaperEquipment] m (NOLOCK)
	JOIN [dbo].[EquipmentCategoryManufacturer] e (NOLOCK) ON m.[EquipmentCategoryManufacturerId] = e.Id
	JOIN [dbo].[EquipmentCategory] c (NOLOCK) ON E.EquipmentCategoryId = c.Id
	JOIN [dbo].[EquipmentSubCategory] s (NOLOCK) ON s.EquipmentCategoryId = c.Id and m.EquipmentSubCategoryId = s.Id
	where
   (
   [HoursMiles] BETWEEN ISNULL(@MilesFrom,0) AND ISNULL(@MilesTo,3000000)
   )
   AND
   (
   [SaleDate] BETWEEN ISNULL(DATEADD(DAY,-@DaysTo,GETDATE()),0) AND ISNULL(DATEADD(DAY,-@DaysFrom,GETDATE()),360)
   )
	--AND
	--	(
	--	E.Name = @Make
	--	AND ([Model] = @Model or ParentModel = @Model)
	--	AND [Year] = @YearMake
	--	)
     AND m.id in (SELECT * FROM  dbo.Split(@SelectedIds, ','))
 GROUP BY 
   e.Name
   ,[Year]
   ORDER BY 
   MAKE,
   [YEAR]
END
ELSE 
BEGIN


 --Calc
 --IF (@MilesHoursAdjusted IS NOT NULL)

  --SELECT MAKE MODEL AVG SALES PRICE --19557.14
SELECT @sql = 'MAX([' + cast(@YearMake as varchar) + '])' + 
  ' FROM [stg].[TruckYearsSalesAvg] ' +
  ' WHERE MakeModel = ''' + @make + ' - ' + @model + '''' +
  ' AND SiteSubCategoryName = ''' + @SiteSubCategoryName + ''''

SELECT @sql1 = 'SELECT TOP 1 @DynamicWord = ' + @sql

EXEC sp_executesql
   @sql1  --dynamic sql query to execute
    ,N'@DynamicWord sysname OUTPUT' --parameter definitions
    ,@DynamicWord=@AvgSalesPrice OUTPUT --assigning the caller procs local variable to the dynamic parameter

--SELECT @AvgSalesPrice

--SELECT THE CUMMULATIVE MILES 994000, YEAR 2008-2017

  SELECT @SQL1 = '[' + cast(@YearMake as varchar) + ']' 
  SELECT @counter = @YearMake + 1
  While @counter < 2018
  BEGIN
   SELECT @SQL = @counter
   SELECT @SQL1 = @SQL1 + ' + [' + cast(@SQL as varchar) + ']'
   SELECT @counter = @counter + 1
  END

 SELECT @sql =  @sql1 +
  ' FROM [stg].[TruckYearsMiles] ' +
  ' WHERE Make = ''' + @make + '''' + ' AND Model = '''  + @model + '''' +
  ' AND SiteSubCategoryName = ''' + @SiteSubCategoryName + ''''

  SELECT @sql2 = 'SELECT TOP 1 @DynamicWord = ' + @sql

EXEC sp_executesql
   @sql2  --dynamic sql query to execute
    ,N'@DynamicWord sysname OUTPUT' --parameter definitions
    ,@DynamicWord=@AvgMiles OUTPUT --assigning the caller procs local variable to the dynamic parameter

--SELECT @AvgMiles

 --add or SUBTRACT CUMMLATIVE 994000 - 800000 @MilesHoursAdjusted = 194000
 SELECT @OverUnderMiles = @AvgMiles - @MilesHoursAdjusted
 
 --DIVIDE THE 194,000 UNTIL ZERO , 67000 THEN 70000 THEN PARTIAL 74000 
 --IF @OverUnderMiles > 0
 ----SELECT RIGHT
 --  SELECT
 --ELSE 
 ----SELECT LEFT
 
  SELECT @sql = 'MAX([' + cast(@YearMake as varchar) + '])' + 
  ' FROM [stg].[TruckYearsDollars] ' +
  ' WHERE Make = ''' + @make + '''' + ' AND Model = '''  + @model + '''' +
  ' AND SiteSubCategoryName = ''' + @SiteSubCategoryName + ''''

SELECT @sql1 = 'SELECT TOP 1 @DynamicWord = ' + @sql

EXEC sp_executesql
   @sql1  --dynamic sql query to execute
    ,N'@DynamicWord sysname OUTPUT' --parameter definitions
    ,@DynamicWord=@AvgDollars OUTPUT --assigning the caller procs local variable to the dynamic parameter

--SELECT @AvgDollars
SELECT @TotalDollarsDeduct  = @OverUnderMiles *  @AvgDollars
SELECT @AvgSalesPrice = @AvgSalesPrice + @TotalDollarsDeduct  

 -- aVG SALES 19557.14 MINUS MILES* DOLLARS = NEW ADJUSTED SALES PRICE

 --@AdjustedSalesPrice, @MilesHoursAdjusted


INSERT @T
 (Make
,Model
, YearMake
, AvgSalePrice 
, AvgHoursMiles 
 )
SELECT @Make
    ,@Model
    ,@YearMake
    ,@AvgSalesPrice as AvgSalePrice
    ,@MilesHoursAdjusted AvgHoursMiles
END
 --select * from @T



   SET @salesprice = (SELECT AvgSalePrice from @T)
 --  SET @factorpct = IIF(@salesprice > 50000, 1, @salesprice / 50000)

	--IF (@YEAR - @YearMake <= 12 ) and (@salesprice >=45000)
	INSERT @T2
	SELECT * FROM
	( 
		   SELECT 
					Make 
					,Model 
					,@YearMake as Year 
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
					 @YEAR as FutureYear
					 ,AvgSalePrice
					 ,AvgHoursMiles
					--, @AvgSalesPrice as AvgSalePrice
					--, @MilesHoursAdjusted AvgHoursMiles

					FROM @T

					UNION ALL

					SELECT 
					 @YEAR + 1 as FutureYear
					  , AvgSalePrice - 
						   ( (SELECT DollarsMonth from @YH where FutureYear = @YEAR + 1) * (SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 1))
						   + (SELECT Deduct from @YH where FutureYear = @YEAR + 1)
					  , AvgHoursMiles +   ( (SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 1))
					FROM @T 

					UNION ALL

					SELECT 
					 @YEAR +2 as FutureYear
				      , AvgSalePrice - 
						    ( (SELECT DollarsMonth from @YH where FutureYear = @YEAR + 1) * (SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 1))
						  -  ( (SELECT DollarsMonth from @YH where FutureYear = @YEAR + 2)  * (SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 2))
						   + (SELECT Deduct from @YH where FutureYear = @YEAR + 1)
						    + (SELECT Deduct from @YH where FutureYear = @YEAR + 2)
					 , AvgHoursMiles +  ((SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 1) ) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 2) )
					FROM @T t JOIN @YH yh ON @YEAR + 2 = yh.FutureYear

					UNION ALL

					SELECT 
					 @YEAR +3 as FutureYear
				      , AvgSalePrice - 
						     ( (SELECT DollarsMonth from @YH where FutureYear = @YEAR + 1) * (SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 1))
						  -  ( (SELECT DollarsMonth from @YH where FutureYear = @YEAR + 2)  * (SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 2))
						  -  ( (SELECT DollarsMonth from @YH where FutureYear = @YEAR + 3)  * (SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 3))
						   + (SELECT Deduct from @YH where FutureYear = @YEAR + 1)
						   + (SELECT Deduct from @YH where FutureYear = @YEAR + 2)
						   + (SELECT Deduct from @YH where FutureYear = @YEAR + 3)
					 , AvgHoursMiles +  ((SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 1) ) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 2)) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 3))
					FROM @T t JOIN @YH yh ON @YEAR + 3 = yh.FutureYear

					UNION ALL

					SELECT 
					 @YEAR +4 as FutureYear
				      , AvgSalePrice - 
						    ( (SELECT DollarsMonth from @YH where FutureYear = @YEAR + 1) * (SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 1))
						  -  ( (SELECT DollarsMonth from @YH where FutureYear = @YEAR + 2)  * (SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 2))
						  -  ( (SELECT DollarsMonth from @YH where FutureYear = @YEAR + 3)  * (SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 3))
						  -  ( (SELECT DollarsMonth from @YH where FutureYear = @YEAR + 4)  * (SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 4))
						    + (SELECT Deduct from @YH where FutureYear = @YEAR + 1)
						    + (SELECT Deduct from @YH where FutureYear = @YEAR + 2)
						    + (SELECT Deduct from @YH where FutureYear = @YEAR + 3)
						    + (SELECT Deduct from @YH where FutureYear = @YEAR + 4)
					 , AvgHoursMiles +  ((SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 1) ) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 2) ) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 3)) + ((SELECT HoursMonth FROM @YH WHERE FutureYear =@YEAR + 4) )
					FROM @T 
					)x , @T 
	)T1 ORDER BY FutureYear DESC
	
	SELECT * FROM  @T2

GO

