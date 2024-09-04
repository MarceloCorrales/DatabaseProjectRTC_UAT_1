
CREATE PROCEDURE [dbo].[sp_CleanseUpdateDataGapsEquipments]
AS
     DECLARE @make VARCHAR(100);
     DECLARE @model VARCHAR(100);
     DECLARE @year INT, @isvalue BIT, @avgprice MONEY, @counter INT, @diffprice MONEY, @diffpriceTotal MONEY,@newprice MONEY;
     DECLARE cursor_inner CURSOR SCROLL
     FOR
         SELECT [MAKE],
                [MODEL],
                [YEARNum],
                [IsValue],
                [AvgPrice],
                [DiffPrice]
         FROM [dbo].[_tmp2](NOLOCK)
         ORDER BY [MAKE],
                  [MODEL],
                  [YEARNum];
     OPEN cursor_inner;
     FETCH NEXT FROM cursor_inner INTO @make, @model, @year, @isvalue, @avgprice, @diffprice;
     PRINT 'INITIAL:  @year '+CAST(@year AS VARCHAR)+'@@make '+CAST(@make AS VARCHAR)+'@avgprice '+CAST(@avgprice AS VARCHAR);
     SET @counter = 1; 
     WHILE @@FETCH_STATUS <> -1 
         BEGIN
             IF @IsValue = 1
                 BEGIN
                     UPDATE [dbo].[_tmp2]
                       SET
                           NewPrice = @avgprice
                     WHERE Make = @make
                           AND Model = @model
                           AND [YearNum] = @year;
                     SET @newprice = @avgprice;
                     SET @diffpriceTotal = 0;
             END;
                 ELSE
                 BEGIN
                     SET @diffpriceTotal = @diffpriceTotal + @diffprice;
                     UPDATE [dbo].[_tmp2]
                       SET
                           NewPrice = @newprice + @diffpriceTotal
                     WHERE Make = @make
                           AND Model = @model
                           AND [YearNum] = @year;
             END;
             FETCH NEXT FROM cursor_inner INTO @make, @model, @year, @isvalue, @avgprice, @diffprice;
             PRINT 'next:  @year '+CAST(@year AS VARCHAR)+'@@make '+CAST(@make AS VARCHAR)+'@avgprice '+CAST(@avgprice AS VARCHAR)+'@counter '+CAST(@counter AS VARCHAR);
         END;
     CLOSE cursor_inner;
     DEALLOCATE cursor_inner;

GO

