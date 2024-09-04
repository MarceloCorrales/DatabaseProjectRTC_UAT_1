CREATE PROCEDURE [dbo].[Sp_MachineryTraderEquipmentScript_V2] 
@SourceSiteid int = 2
AS
BEGIN
MERGE MachineryTraderEquipment_v2 AS MTE
    USING RTVDataStaging_v2 AS RTV
    ON (MTE.SiteListingId = RTV.SiteListingId  and MTE.CategoryId= RTV.CategoryId and MTE.SubCategoryId=RTV.SubCategoryId and MTE.ManufacturerId=RTV.ManufacturerId )  
WHEN MATCHED and  RTV.SourceSite=2  and ( MTE.SalePrice!=RTV.SalePrice) and  RTV.Isprocess=0
THEN 
    UPDATE SET 
         MTE.HoursMiles = RTV.HoursMiles,
		 MTE.Year = RTV.Year,
		 MTE.Seller = RTV.Seller,
		 MTE.SalePrice= RTV.SalePrice,
		 MTE.CityState = RTV.CityState,
         MTE.SaleDate = RTV.SaleDate,
		 MTE.Model = RTV.Model,
		 MTE.VinNumber = RTV.VinNumber,
		 MTE.StockNumber = RTV.StockNumber,
		 MTE.EngineManufacturer = RTV.EngineManufacturer,
	     MTE.LastUpdated = RTV.LastUpdated,
		 MTE.JsonData =	RTV.JsonData,
		 MTE.Suspension= RTV.Suspension,
		 MTE.Condition= RTV.Condition,
		 MTE.Horsepower= RTV.Horsepower,
		 MTE.Capacity= RTV.Capacity,
		 MTE.FreeAirDelivery= RTV.FreeAirDelivery
WHEN NOT MATCHED BY TARGET  and RTV.SourceSite=2  and  RTV.Isprocess=0
THEN 
     INSERT (HoursMiles, Year, Seller,CityState,SalePrice,SaleDate,ImageUrl,SiteListingId,SiteListingName,
	         Model,VinNumber,StockNumber,EngineManufacturer,EngineHorsepower,Transmission,Length,Width,Suspension,SerialNumber,Condition,Horsepower,Capacity,FreeAirDelivery,CategoryId,SubCategoryId,ManufacturerId,
	         LastUpdated,DateCreated,ParentModel,SiteListingLink,DupeData,SourceFileName,JsonData)
     VALUES (RTV.HoursMiles, RTV.Year, RTV.Seller,RTV.CityState,RTV.SalePrice,RTV.SaleDate,RTV.ImageUrl,RTV.SiteListingId,RTV.SiteListingName,
	         RTV.Model,RTV.VinNumber,RTV.StockNumber,RTV.EngineManufacturer,RTV.EngineHorsepower,RTV.Transmission,RTV.Length,RTV.Width,RTV.Suspension,RTV.SerialNumber,RTV.Condition,RTV.Horsepower,RTV.Capacity,RTV.FreeAirDelivery,RTV.CategoryId,RTV.SubCategoryId,RTV.ManufacturerId,
	         RTV.LastUpdated,RTV.DateCreated,RTV.ParentModel,RTV.SiteListingLink,RTV.DupeData,RTV.SourceFileName,RTV.JsonData);
 

	 UPDATE RTVDataStaging_v2 SET Isprocess=1 ,processDate=GETDATE()
	 WHERE SourceSite=2 AND Isprocess=0
END

GO

