
CREATE PROCEDURE [dbo].[SearchAuctionItems_dynamic] (@PageNumber   INT = 1, 
                                             @PageSize     INT = 20, 
                                             @category     VARCHAR(100) = NULL, 
                                             @type         VARCHAR(100) = NULL, 
                                             @yearRange    VARCHAR(100) = NULL, 
                                             @manufacturer VARCHAR(100) = NULL, 
                                             @location     VARCHAR(100) = NULL, 
                                             @price        VARCHAR(100) = NULL) 
AS 
    --declare @PageNumber INT = 5 
    --  declare @PageSize   INT = 100 
    --  declare @category varchar(100) 
    --  declare @type varchar(100) 
    --  declare @yearRange nvarchar(100) = '4,3' 
    --  declare @manufacturer varchar(100) 
    --  declare @location varchar(100)  
    --  declare @price varchar(100) 
    DECLARE @sSQL NVARCHAR(2000) 
    DECLARE @Where NVARCHAR(1000) = '' 

    SET @sSQL = ';WITH pg AS   (     SELECT I.Id, c = COUNT(*) OVER()       FROM dbo.Item I join ItemAttribute IA on I.Id = IA.Id '; 

    IF @category IS NOT NULL 
      SET @Where = @Where + 'AND IA.CategoryId IN (' + @category 
                   + ') ' 

    IF @type IS NOT NULL 
      SET @Where = @Where + 'AND IA.SubCategoryId IN (' + @type 
                   + ') ' 

    IF @yearRange IS NOT NULL 
      SET @Where = @Where + 'AND IA.YearRangeId IN (' 
                   + @yearRange + ') ' 

    IF @manufacturer IS NOT NULL 
      SET @Where = @Where + 'AND IA.ManufacturerId IN (' 
                   + @manufacturer + ') ' 

    IF @location IS NOT NULL 
      SET @Where = @Where + 'AND IA.LocationId IN (' + @location 
                   + ') ' 

    IF @price IS NOT NULL 
      SET @Where = @Where + 'AND IA.PriceRangeId IN (' + @price 
                   + ') ' 

    IF Len(@Where) > 0 
      SET @sSQL = @sSQL + 'WHERE ' 
                  + RIGHT(@Where, Len(@Where)-3) 

    SET @sSQL = @sSQL 
                + ' ORDER BY I.Id       OFFSET @_PageSize * (@_PageNumber - 1) ROWS       FETCH NEXT @_PageSize ROWS ONLY   )   SELECT *, TotalRowCount = c   FROM dbo.Item AS c   join ItemAttribute IA on c.Id = IA.Id   INNER JOIN pg ON pg.Id = c.Id   ORDER BY c.Id OPTION (RECOMPILE);' 

    --select @ssQL 
    EXEC Sp_executesql 
      @sSQL, 
      N'@_PageNumber int, @_PageSize int', 
      @_PageNumber = @PageNumber, 
      @_PageSize = @PageSize

GO

