
CREATE PROCEDURE [dbo].[sp_TP_GetManufacturersBySubCategory] 
	@SubCategoryId int = 0 
AS
BEGIN

	SET NOCOUNT ON;

	SELECT ECM.[Name], 
	ECM.[Id] 
	FROM TruckPaperEquipment TPE 
	INNER JOIN EquipmentCategoryManufacturer ECM ON ECM.Id = TPE.EquipmentCategoryManufacturerId 
	WHERE EquipmentSubCategoryId = @SubCategoryId 
	GROUP BY ECM.[Name], ECM.[Id] 
	ORDER BY ECM.[Name], ECM.[Id] 

END

GO

