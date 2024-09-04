
CREATE PROCEDURE [dbo].[sp_CalculateEquipmentFutureValues_LOG]
(@Make      VARCHAR(100),
 @Model     VARCHAR(50),
 @CategoryId  int = NULL ,
 @SubCategoryId  int = NULL,
 @YearMake  INT,
 @DaysFrom  INT,
 @DaysTo    INT,
 @MilesFrom INT,
 @MilesTo   INT,
 @SelectedIds  VARCHAR(1000) = NULL
)
AS
     DECLARE @T TABLE
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
     IF EXISTS
     (
         SELECT 1
         FROM [dbo].[MachineryTraderEquipment](NOLOCK)
         WHERE ParentModel <> Model
               AND ParentModel = @Model
     )
         BEGIN
             SELECT @Model =
             (
                 SELECT MAX(ParentModel)
                 FROM [dbo].[MachineryTraderEquipment](NOLOCK)
                 WHERE ParentModel <> Model
                       AND ParentModel = @Model
             );
     END;
     DECLARE @YearCurrent INT= YEAR(GETDATE()), @x DECIMAL(10, 3), @Intercept DECIMAL(10, 3), @factor INT= 1, @EquipmentHours INT, @Count INT, @Count1 INT, @Diff MONEY;
     SELECT @Count =
     (
         SELECT COUNT(1)
         FROM [dbo].[MachineryTraderLogModel] M
         WHERE(Make = @Make
               AND [Model] = @Model)
     );
     SELECT @Count1 =
     (
         SELECT COUNT(1)
         FROM [dbo].[MachineryTraderEquipment] T
              JOIN [dbo].[EquipmentCategoryManufacturer] e ON t.[EquipmentCategoryManufacturerId] = e.id
              JOIN [dbo].[EquipmentCategory] c ON E.EquipmentCategoryId = c.Id
              LEFT JOIN [dbo].[EquipmentHours] h ON c.Id = h.[EquipmentCategoryId]
         WHERE(E.NAME = @Make
               AND ([Model] = @Model OR ParentModel = @Model))
			AND [HoursMiles] > 0
     );
     IF(@Count >= 1
        AND @Count1 > 0)
         BEGIN
             SET @x =
             (
                 SELECT [x]
                 FROM [dbo].[MachineryTraderLogModel] M
                 WHERE(Make = @Make
                       AND [Model] = @Model
                       AND Equation <> '')
             );
             SET @Intercept =
             (
                 SELECT Intercept
                 FROM [dbo].[MachineryTraderLogModel] M
                 WHERE(Make = @Make
                       AND [Model] = @Model
                       AND Equation <> '')
             );
             SET @EquipmentHours =
             (
                 SELECT MAX([HoursMonth])
                 FROM [dbo].[MachineryTraderEquipment] T
                      JOIN [dbo].[EquipmentCategoryManufacturer] e ON t.[EquipmentCategoryManufacturerId] = e.id
                      JOIN [dbo].[EquipmentCategory] c ON E.EquipmentCategoryId = c.Id
                      LEFT JOIN [dbo].[EquipmentHours] h ON c.Id = h.[EquipmentCategoryId]
                 WHERE(E.NAME = @Make
                       AND  ([Model] = @Model or ParentModel = @Model )
				   )
             );
             INSERT INTO @T
                    SELECT Make,
                           [Model],
                           @YearMake [Year],
                           FutureYear,
                           CASE
                               WHEN FutureYear = @YearCurrent
                               THEN AvgSalePrice
                               WHEN FutureYear = @YearCurrent + 1
                               THEN(@x * LOG(LEAD(ProjectedMiles, 1, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 12)) + @Intercept)
                               WHEN FutureYear = @YearCurrent + 2
                               THEN(@x * LOG(LEAD(ProjectedMiles, 2, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 24)) + @Intercept)
                               WHEN FutureYear = @YearCurrent + 3
                               THEN(@x * LOG(LEAD(ProjectedMiles, 3, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 36)) + @Intercept)
                               WHEN FutureYear = @YearCurrent + 4
                               THEN(@x * LOG(LEAD(ProjectedMiles, 4, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 48)) + @Intercept)
                           END AS 'AvgSalePrice',
                           0 MinSalePrice,
                           0 MaxSalePrice,
                           CASE
                               WHEN FutureYear = @YearCurrent
                               THEN ProjectedMiles
                               WHEN FutureYear = @YearCurrent + 1
                               THEN LEAD(ProjectedMiles, 1, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 12)
                               WHEN FutureYear = @YearCurrent + 2
                               THEN LEAD(ProjectedMiles, 2, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 24)
                               WHEN FutureYear = @YearCurrent + 3
                               THEN LEAD(ProjectedMiles, 3, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 36)
                               WHEN FutureYear = @YearCurrent + 4
                               THEN LEAD(ProjectedMiles, 4, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 48)
                               ELSE NULL
                           END AS 'ProjectedMiles',
                           0 MinHoursMiles,
                           0 MaxHoursMiles,
                           CountSale AS CountNumber,
                           CASE
                               WHEN FutureYear = @YearCurrent
                               THEN(@x * LOG(ProjectedMiles) + @Intercept)
                               WHEN FutureYear = @YearCurrent + 1
                               THEN(@x * LOG(LEAD(ProjectedMiles, 1, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 12)) + @Intercept)
                               WHEN FutureYear = @YearCurrent + 2
                               THEN(@x * LOG(LEAD(ProjectedMiles, 2, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 24)) + @Intercept)
                               WHEN FutureYear = @YearCurrent + 3
                               THEN(@x * LOG(LEAD(ProjectedMiles, 3, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 36)) + @Intercept)
                               WHEN FutureYear = @YearCurrent + 4
                               THEN(@x * LOG(LEAD(ProjectedMiles, 4, 0) OVER(ORDER BY FutureYear DESC) + (@EquipmentHours * 48)) + @Intercept)
                           END AS 'LogSalePrice'
                    FROM
                    (
                        SELECT @YearCurrent AS 'FutureYear',
                               E.NAME AS Make,
                               @Model AS Model,
                               AVG(T.[HoursMiles]) ProjectedMiles,
                               AVG(SalePrice) AvgSalePrice,
                               COUNT(1) CountSale,
                               (@x * LOG(AVG(T.[HoursMiles])) + @Intercept) LogSalePrice
                        FROM [dbo].[MachineryTraderEquipment] T
                             JOIN [dbo].[EquipmentCategoryManufacturer] e ON t.[EquipmentCategoryManufacturerId] = e.id
                             JOIN [dbo].[EquipmentCategory] c ON E.EquipmentCategoryId = c.Id
                             LEFT JOIN [dbo].[EquipmentHours] h ON c.Id = h.[EquipmentCategoryId]
                        WHERE([HoursMiles] BETWEEN ISNULL(@MilesFrom, 1) AND ISNULL(@MilesTo, 3000000))
                             AND ([SaleDate] BETWEEN ISNULL(DATEADD(DAY, -@DaysTo, GETDATE()), 0) AND ISNULL(DATEADD(DAY, -@DaysFrom, GETDATE()),0))
                             AND (E.Name = @Make
                                  AND ([Model] = @Model or ParentModel = @Model )
                                  AND [Year] = @YearMake)
						    AND [HoursMiles] > 0 -- HOURS 
                        GROUP BY E.NAME
                        UNION ALL
                        SELECT @YearCurrent + 1 AS 'FutureYear',
                               @Make,
                               @Model,
                               NULL ProjectedMiles,
                               (@x * LOG(AVG(T.[HoursMiles]) + (MAX([HoursMonth]) * 12)) + @Intercept) AvgSalePrice,
                               1,
                               NULL AS LogSalePrice
                        FROM [dbo].[MachineryTraderEquipment] T
                             JOIN [dbo].[EquipmentCategoryManufacturer] e ON t.[EquipmentCategoryManufacturerId] = e.id
                             JOIN [dbo].[EquipmentCategory] c ON E.EquipmentCategoryId = c.Id
                             LEFT JOIN [dbo].[EquipmentHours] h ON c.Id = h.[EquipmentCategoryId]
                        WHERE(E.NAME = @Make
                              AND [Model] = @Model)
						AND [HoursMiles] > 0 -- HOURS 
                        UNION ALL
                        SELECT @YearCurrent + 2 AS 'FutureYear',
                               @Make,
                               @Model,
                               NULL ProjectedMiles,
                               (@x * LOG(AVG(T.[HoursMiles]) + (MAX([HoursMonth]) * 24)) + @Intercept) AvgSalePrice,
                               1,
                               (@x * LOG(AVG(T.[HoursMiles]) + (MAX([HoursMonth]) * 24)) + @Intercept) LogSalePrice
                        FROM [dbo].[MachineryTraderEquipment] T
                             JOIN [dbo].[EquipmentCategoryManufacturer] e ON t.[EquipmentCategoryManufacturerId] = e.id
                             JOIN [dbo].[EquipmentCategory] c ON E.EquipmentCategoryId = c.Id
                             LEFT JOIN [dbo].[EquipmentHours] h ON c.Id = h.[EquipmentCategoryId]
                        WHERE(E.NAME = @Make
                              AND [Model] = @Model)
						AND [HoursMiles] > 0 -- HOURS 
                        UNION ALL
                        SELECT @YearCurrent + 3 AS 'FutureYear',
                               @Make,
                               @Model,
                               NULL ProjectedMiles,
                               (@x * LOG(AVG(T.[HoursMiles]) + (MAX([HoursMonth]) * 36)) + @Intercept) AvgSalePrice,
                               1,
                               (@x * LOG(AVG(T.[HoursMiles]) + (MAX([HoursMonth]) * 36)) + @Intercept) LogSalePrice
                        FROM [dbo].[MachineryTraderEquipment] T
                             JOIN [dbo].[EquipmentCategoryManufacturer] e ON t.[EquipmentCategoryManufacturerId] = e.id
                             JOIN [dbo].[EquipmentCategory] c ON E.EquipmentCategoryId = c.Id
                             LEFT JOIN [dbo].[EquipmentHours] h ON c.Id = h.[EquipmentCategoryId]
                        WHERE(E.NAME = @Make
                              AND [Model] = @Model)
						AND [HoursMiles] > 0 -- HOURS 
                        UNION ALL
                        SELECT @YearCurrent + 4 AS 'FutureYear',
                               @Make,
                               @Model,
                               NULL ProjectedMiles,
                               (@x * LOG(AVG(T.[HoursMiles]) + (MAX([HoursMonth]) * 48)) + @Intercept) AvgSalePrice,
                               1,
                               (@x * LOG(AVG(T.[HoursMiles]) + (MAX([HoursMonth]) * 48)) + @Intercept) LogSalePrice
                        FROM [dbo].[MachineryTraderEquipment] T
                             JOIN [dbo].[EquipmentCategoryManufacturer] e ON t.[EquipmentCategoryManufacturerId] = e.id
                             JOIN [dbo].[EquipmentCategory] c ON E.EquipmentCategoryId = c.Id
                             LEFT JOIN [dbo].[EquipmentHours] h ON c.Id = h.[EquipmentCategoryId]
                        WHERE(E.NAME = @Make
                              AND [Model] = @Model)
						AND [HoursMiles] > 0 -- HOURS 
                    ) Equipment;
             SELECT @Diff =
             (
                 SELECT diff
                 FROM
                 (
                     SELECT FutureYear,
                            LAG(AvgSalePrice, 1, 0) OVER(ORDER BY FutureYear DESC) - AvgSalePrice AS Diff
                     FROM @t
                 ) d
                 WHERE FutureYear = @YearCurrent
             );
             IF @Diff > 0
                 SELECT Make,
                        [Model],
                        [Year],
                        FutureYear,
                        CASE
                            WHEN FutureYear = @YearCurrent + 1
                            THEN AvgSalePrice - (@Diff * 1.08)
                            WHEN FutureYear = @YearCurrent + 2
                            THEN AvgSalePrice - (@Diff * 1.08)
                            WHEN FutureYear = @YearCurrent + 3
                            THEN AvgSalePrice - (@Diff * 1.08)
                            WHEN FutureYear = @YearCurrent + 4
                            THEN AvgSalePrice - (@Diff * 1.08)
                            ELSE AvgSalePrice
                        END AS AvgSalePrice,
                        MinSalePrice,
                        MaxSalePrice,
                        ProjectedMiles,
                        MinHoursMiles,
                        MaxHoursMiles,
                        CountNumber,
                        LogSalePrice
                 FROM @t;
                 ELSE
             SELECT Make,
                    [Model],
                    [Year],
                    FutureYear,
                    AvgSalePrice,
                    MinSalePrice,
                    MaxSalePrice,
                    ProjectedMiles,
                    MinHoursMiles,
                    MaxHoursMiles,
                    CountNumber,
                    LogSalePrice
             FROM @t;
     END;


--GO

GO

