-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- exec sp_RTVDataFromExcel_V2 '207','Heavy Duty Truck',8009,'Attenuator Trucks','GMC',2
-- =============================================
Create PROCEDURE [dbo].[sp_RTVDataFromExcel_V3]  
  @ManufacturerName varchar(250),
  @SiteId int
AS
BEGIN
 
 Declare @manuCatId int
 Declare @CSMId int

 set @manuCatId = (Select Id from EquipmentManufacturer_V2 em where LOWER(em.Name) = lower(@ManufacturerName) and IsDeleted=0)

	if(@manuCatId is null and @ManufacturerName<>'')
	begin
		insert into EquipmentManufacturer_V2 values (@ManufacturerName,getdate(),'By Procedure Machniary',getdate(),'By Procedure',0)
	 
	end
END

GO

