-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[sp_TruckPaperEquipmentScript_V2]
@SourceSiteid int = 1 
AS
BEGIN
  MERGE TruckPaperEquipment_v2 as TP
	USING RTVDataStaging_v2 as RTV
	ON (TP.SiteListingId = RTV.SiteListingId  and TP.CategoryId= RTV.CategoryId and TP.SubCategoryId=TP.SubCategoryId and TP.ManufacturerId=RTV.ManufacturerId )  
WHEN MATCHED and RTV.SourceSite=1 and ( TP.SalePrice!=RTV.SalePrice) and  RTV.Isprocess=0
THEN 
	UPDATE SET 
		TP.HoursMiles = RTV.HoursMiles,
		TP.Year = RTV.Year,
		TP.Seller = RTV.Seller,
		TP.CityState = RTV.CityState,
		 TP.SalePrice= RTV.SalePrice,
		TP.SaleDate = RTV.SaleDate,
		TP.Model = RTV.Model,
		TP.VinNumber = RTV.VinNumber,
		TP.StockNumber = RTV.StockNumber,
		TP.EngineManufacturer = RTV.EngineManufacturer,
		TP.LastUpdated = RTV.LastUpdated,
		TP.JsonData =	RTV.JsonData

WHEN NOT MATCHED BY TARGET and RTV.SourceSite = 1  and  RTV.Isprocess=0
THEN 
	INSERT (HoursMiles, Year, Seller,CityState,SalePrice,SaleDate,ImageUrl,SiteListingId,SiteListingName,
		Model,VinNumber,StockNumber,EngineManufacturer,EngineHorsepower,Transmission,Length,Width,Suspension,CategoryId,SubCategoryId,ManufacturerId,Filter,
		LastUpdated,DateCreated,ParentModel,SiteListingLink,DupeData,SourceFileName,JsonData)
    VALUES (RTV.HoursMiles, RTV.Year, RTV.Seller,RTV.CityState,RTV.SalePrice,RTV.SaleDate,RTV.ImageUrl,RTV.SiteListingId,RTV.SiteListingName,
	 RTV.Model,RTV.VinNumber,RTV.StockNumber,RTV.EngineManufacturer,RTV.EngineHorsepower,RTV.Transmission,RTV.Length,RTV.Width,RTV.Suspension,RTV.CategoryId,RTV.SubCategoryId,RTV.ManufacturerId,RTV.Filter,
	 RTV.LastUpdated,RTV.DateCreated,RTV.ParentModel,RTV.SiteListingLink,RTV.DupeData,RTV.SourceFileName,RTV.JsonData);



	 UPDATE RTVDataStaging_v2 SET Isprocess=1 ,processDate=GETDATE()
	 WHERE SourceSite=1 AND Isprocess=0

 

END

GO

