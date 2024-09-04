

CREATE PROCEDURE [dbo].[sp_TP_GetManufacturersByCategory] 
	@CategoryId int = 0 
AS
BEGIN

	SET NOCOUNT ON;

	SELECT ECM.[Name], 
	ECM.[Id] 
	FROM TruckPaperEquipment TPE 
	INNER JOIN EquipmentCategoryManufacturer ECM ON ECM.Id = TPE.EquipmentCategoryManufacturerId 
	WHERE EquipmentCategoryId = @CategoryId 
	GROUP BY ECM.[Name], ECM.[Id] 
	ORDER BY ECM.[Name], ECM.[Id] 

END

GO

