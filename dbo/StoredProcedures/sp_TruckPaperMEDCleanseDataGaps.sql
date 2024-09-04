

--exec  [dbo].[sp_TruckPaperMEDCleanseDataGaps]

CREATE PROCEDURE [dbo].[sp_TruckPaperMEDCleanseDataGaps]
AS

/** Fill in data gaps in years for each make and model **/

     IF OBJECT_ID('tempdb.dbo.#ModelYears', 'U') IS NOT NULL
         DROP TABLE #ModelYears;
     IF OBJECT_ID('tempdb.dbo.#Year', 'U') IS NOT NULL
         DROP TABLE #Year;
     CREATE TABLE #Year(YearNum INT);
     DECLARE @x INT= 1900;
     WHILE @x < 2020
         BEGIN
             INSERT INTO #Year
                    SELECT @x;
             SET @x = @x + 1;
         END;
     SELECT e.[Name] 'Make',
            [Model],
            MIN([Year]) MinYear,
            MAX([Year]) MaxYear
     INTO #ModelYears
     FROM [dbo].[TruckPaperEquipment] t
          JOIN [dbo].[EquipmentCategoryManufacturer] e ON t.[EquipmentCategoryManufacturerId] = e.id
          JOIN [dbo].[EquipmentCategory] c ON E.EquipmentCategoryId = c.Id
     WHERE c.name IN( 'Medium Duty Trucks')
     GROUP BY e.[Name],
              [Model]
     ORDER BY 1,
              2,
              3;
	--3500HD	1998

      TRUNCATE TABLE dbo.TruckPaperMedEquipmentYearGaps;
	  INSERT TruckPaperMedEquipmentYearGaps
     SELECT A.*,
            CASE
                WHEN B.AvgPrice IS NULL
                THEN 0
                ELSE 1
            END IsValue,
            B.AvgPrice,
            NULL DiffPrice,
            NULL NewPrice,
		  CountSale
    -- INTO TruckPaperEquipmentYearGaps
     FROM
     (
         SELECT MAKE,
                MODEL,
                YEARNum
         FROM #ModelYears,
              #Year
         WHERE YearNum BETWEEN MinYear AND MaxYear
     ) A
     LEFT JOIN
     (
         SELECT e.[Name] 'Make',
                [Model],
                [YEAR],
                AVG([SalePrice]) AvgPrice
			 ,Count(1) CountSale
         FROM [dbo].[TruckPaperEquipment] t
              JOIN [dbo].[EquipmentCategoryManufacturer] e ON t.[EquipmentCategoryManufacturerId] = e.id
              JOIN [dbo].[EquipmentCategory] c ON E.EquipmentCategoryId = c.Id
         WHERE c.name IN('Medium Duty Trucks')
         GROUP BY e.[Name],
                  [Model],
                  [YEAR]
     ) B ON A.Make = B.MAKE
            AND A.MODEL = B.MODEL
            AND A.YEARNum = B.[YEAR]
     ORDER BY 1,
              2,
              3;
     DECLARE @make VARCHAR(100);
     DECLARE @model VARCHAR(100);
     DECLARE @make_outer VARCHAR(100);
     DECLARE @model_outer VARCHAR(100);
     DECLARE @year INT, @isvalue BIT, @avgprice MONEY, @counter INT, @beginvalue MONEY, @endvalue MONEY, @diffprice MONEY, @beginYear INT, @endYear INT, @salecount INT;
     DECLARE @Outer_loop INT;
     DECLARE outercursor CURSOR SCROLL
     FOR
         SELECT DISTINCT
                [MAKE],
                [MODEL]
         FROM [dbo].[TruckPaperEquipmentYearGaps] a
         WHERE EXISTS
         (
             SELECT *
             FROM [dbo].[TruckPaperEquipmentYearGaps] b
             WHERE a.make = b.make
                   AND a.model = b.model
                   AND a.YearNum = b.YearNum
                   AND b.IsValue = 0
         )
               AND NOT EXISTS
         (
             SELECT *
             FROM
             (
                 SELECT [MAKE],
                        [MODEL]
                 FROM [dbo].[TruckPaperEquipmentYearGaps]
                 GROUP BY [MAKE],
                          [MODEL]
                 HAVING COUNT(1) = 1
             ) c
             WHERE a.make = c.make
                   AND a.model = c.model
         )
         ORDER BY [MAKE],
                  [MODEL];
     OPEN outercursor;
     FETCH NEXT FROM outercursor INTO @make_outer, @model_outer;
     SET @Outer_loop = @@FETCH_STATUS;
     WHILE @Outer_loop = 0
         BEGIN
             DECLARE cursor_inner CURSOR SCROLL
             FOR
                 SELECT [MAKE],
                        [MODEL],
                        [YEARNum],
                        [IsValue],
                        [AvgPrice],
				    [SaleCount]
                 FROM [dbo].[TruckPaperMedEquipmentYearGaps](NOLOCK)
                 WHERE [MAKE] = @make_outer
                       AND [MODEL] = @model_outer
                 ORDER BY [YEARNum];
             OPEN cursor_inner;
             FETCH NEXT FROM cursor_inner INTO @make, @model, @year, @isvalue, @avgprice,@salecount;

			--print   'INITIAL:  @year '  + cast(@year as varchar) + '@@make '  + cast(@make as varchar)+ '@avgprice '  + cast(@avgprice as varchar)

             SET @counter = 1;
             SET @beginValue = @avgprice;
             SET @beginYear = @year;
             WHILE @@FETCH_STATUS <> -1
                 BEGIN
				    --print 'isvalue: ' + cast(@IsValue as varchar)
                     IF @IsValue = 0
                         SET @counter = @counter + 1;
                         ELSE
                         BEGIN
                             SET @endValue = @avgprice;
                             SET @endYear = @year;
                             SET @diffprice = (@endValue - @beginValue) / @counter;
                             UPDATE TruckPaperMEDEquipmentYearGaps
                               SET
                                   DiffPrice = @diffprice
							--,SaleCount = @salecount
                             WHERE Make = @make
                                   AND Model = @model
                                   AND [YearNum] > @beginYear
                                   AND [YearNum] < @endYear
                                   AND IsValue = 0;

						--PRINT 'YEARS: BEGIN ' +  cast(@beginYear as varchar(4)) +  ',YEARS: end ' +  cast(@endYear as varchar(4)) +  ', Make: ' +  cast(@make as varchar(50)) +  ', Model:' +  cast(@model as varchar(50)) + ', DiffPrice:' +  cast(@diffprice as varchar(50))

                             SET @counter = 1;
                             SET @beginValue = @avgprice;
                             SET @beginYear = @year;
                     END;
                     FETCH NEXT FROM cursor_inner INTO @make, @model, @year, @isvalue, @avgprice, @salecount;		
					--print   'next:  @year '  + cast(@year as varchar) + '@@make '  + cast(@make as varchar)+ '@avgprice '  + cast(@avgprice as varchar) +  '@counter '  + cast(@counter as varchar)
                 END;
             CLOSE cursor_inner;
             DEALLOCATE cursor_inner;
	     	--print   'outer1:  @year '  + cast(@year as varchar) + '@@make '  + cast(@make as varchar)+ '@avgprice '  + cast(@avgprice as varchar) +  '@counter '  + cast(@counter as varchar)
             FETCH NEXT FROM outercursor INTO @make_outer, @model_outer;
         END;
     CLOSE outercursor;
     DEALLOCATE outercursor;

GO

