-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- exec sp_RTVDataFromExcel_V2 '207','Heavy Duty Truck',8009,'Attenuator Trucks','GMC',2
-- =============================================
CREATE PROCEDURE [dbo].[sp_RTVDataFromExcel_V2]  
  @CategoryId int,
  @CategoryName varchar(250),
  @SubcategoryId int,
  @SubcategoryName varchar(250),
  --@ManufacturerName varchar(250),
  @SiteId int
AS
BEGIN
 
 Declare @CatId int
 Declare @SubCatId int
 Declare @manuCatId int
 Declare @CSMId int

 set @CatId = (Select Id from EquipmentCategory_V2 ec where lower(ec.Name) = lower(@CategoryName) and IsDeleted=0 and SiteId=@SiteId and ec.SiteCategoryId=@CategoryId)
  
	if (@CatId is null and @CategoryName<>'')
	begin
		Insert into EquipmentCategory_V2 values (@CategoryName,@SiteId,@CategoryName,@CategoryId,getdate(),'By Procedure Machinary',getdate(),'By Procedure Machinary',0)
		set @CatId = SCOPE_IDENTITY()
	end

 set @SubCatId = (Select Id from EquipmentSubCategory_V2 esc where LOWER(esc.Name) = lower(@SubcategoryName) and IsDeleted=0 and esc.EquipmentCategoryId=@CatId and esc.SiteSubCategoryId=@SubcategoryId)

    if (@SubCatId is null and @SubcategoryName<>'')
	begin
		insert into EquipmentSubCategory_V2 values (@SubcategoryName,@CatId,@SubcategoryName,@SubcategoryId,getdate(),'By Procedure Machinary',getdate(),'By Procedure Machinary',0)
		set @SubCatId = SCOPE_IDENTITY()
	end

 --set @manuCatId = (Select Id from EquipmentManufacturer_V2 em where LOWER(em.Name) = lower(@ManufacturerName) and IsDeleted=0)

	--if(@manuCatId is null and @ManufacturerName<>'')
	--begin
	--	insert into EquipmentManufacturer_V2 values (@ManufacturerName,getdate(),'By Procedure',getdate(),'By Procedure',0)
	--	set @manuCatId = SCOPE_IDENTITY()
	--end

 --Set @CSMId =  (Select Id from EquipmentCategory_Subcategory_Manufacturer_V2 ecsm where ecsm.CategoryId = @CatId and ecsm.SubcategoryId=@SubCatId and ecsm.ManufacturerId=@manuCatId and IsDeleted=0)

 --   if(@CSMId is null)
	--begin
	--	insert into EquipmentCategory_Subcategory_Manufacturer_V2 values (@CatId,@SubCatId,@manuCatId,GETDATE(),'By Procedure',0)
	--end

END

GO

