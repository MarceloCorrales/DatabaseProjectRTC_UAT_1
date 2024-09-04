

CREATE  PROCEDURE [dbo].[sp_CalculateEquipmentFutureValues] 
(
 @Make               VARCHAR(100), 
 @Model              VARCHAR(50), 
 @CategoryId         INT, 
 @SubCategoryId      INT, 
 @YearMake           INT, 
 @DaysFrom           INT, 
 @DaysTo             INT, 
 @MilesFrom          INT, 
 @MilesTo            INT, 
 @SelectedIds        VARCHAR(MAX), 
 @MilesHoursAdjusted INT 
)
AS

BEGIN

  IF @SubCategoryId = 0
   EXEC [dbo].[sp_CalculateEquipmentFutureValues_DEP_NA] @Make , @Model, @CategoryId, @SubCategoryId, @YearMake, @DaysFrom, @DaysTo, @MilesFrom, @MilesTo, @SelectedIds
  ELSE 
    EXEC [dbo].[sp_CalculateEquipmentFutureValues_DEP] @Make , @Model, @CategoryId, @SubCategoryId, @YearMake, @DaysFrom, @DaysTo, @MilesFrom, @MilesTo ,@SelectedIds
END

--BEGIN
--INSERT  [dbo].[zTest]
--(
--  [Make]
--      ,[Model]
--      ,[CategoryId]
--      ,[SubCategoryId]
--      ,[YearMake]
--      ,[DaysFrom]
--      ,[DaysTo]
--      ,[MilesFrom]
--      ,[MilesTo]
--      ,[SelectedIds]
--)
--SELECT 
--@Make  ,
-- @Model  ,
-- @CategoryId   ,
-- @SubCategoryId  ,
-- @YearMake  ,
-- @DaysFrom  ,
-- @DaysTo    ,
-- @MilesFrom ,
-- @MilesTo   ,
-- @SelectedIds 

--  END

GO

