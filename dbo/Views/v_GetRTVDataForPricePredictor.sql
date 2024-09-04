
CREATE VIEW [dbo].[v_GetRTVDataForPricePredictor]
AS
SELECT        rtv.SiteListingId, rtv.Year, rtv.HoursMiles, manf.Name AS Manufacturer, model.Name AS Model, detail.AskingPrice AS Price, subcat.Name AS SubCategory, cat.Name AS Category, rtv.Condition, rtv.Horsepower, 
                         rtv.EngineManufacturer, rtv.Transmission, rtv.Suspension
FROM            dbo.RTVDataStaging_v2 AS rtv INNER JOIN
                         dbo.RTVDataStagingDetails_v2 AS detail ON detail.RTVDataStagingId = rtv.Id AND detail.AuctionSaleDate IS NULL AND detail.AuctionSalePrice IS NULL INNER JOIN
                         dbo.EquipmentManufacturer_V2 AS manf ON rtv.ManufacturerId = manf.Id LEFT OUTER JOIN
                         dbo.EquipmentModel_V2 AS model ON rtv.ModelId = model.Id LEFT OUTER JOIN
                         dbo.EquipmentCategory_V2 AS cat ON rtv.CategoryId = cat.Id LEFT OUTER JOIN
                         dbo.EquipmentSubCategory_V2 AS subcat ON rtv.SubcategoryId = subcat.Id

GO

