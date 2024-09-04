


CREATE PROCEDURE [dbo].[sp_MT_GetManufacturersByCategory] 
	@CategoryId int = 0 
AS
BEGIN

	SET NOCOUNT ON;

	SELECT ECM.[Name], 
	ECM.[Id] 
	FROM MachineryTraderEquipment MTE 
	INNER JOIN EquipmentCategoryManufacturer ECM ON ECM.Id = MTE.EquipmentCategoryManufacturerId 
	WHERE EquipmentCategoryId = @CategoryId 
	GROUP BY ECM.[Name], ECM.[Id] 
	ORDER BY ECM.[Name], ECM.[Id] 

END

GO

