-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[sp_SetCategory]
AS
BEGIN
   Select * INTO #TempSubCategory from SubCategory where Name like '%Power Generator%'  and Id <> 1125 and CategoryId<>1059  
   
   update UserTracking set SubCategoryId=1125,CategoryId=1059  where SubCategoryId in (Select Id from #TempSubCategory)
   delete from SubCategory   where Id in (Select Id from #TempSubCategory)

END

GO

