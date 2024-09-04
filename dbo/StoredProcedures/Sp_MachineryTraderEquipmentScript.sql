CREATE PROCEDURE [dbo].[Sp_MachineryTraderEquipmentScript] 
@SourceSiteid int = 0 
AS
BEGIN
MERGE MachineryTraderEquipment AS MTE
    USING RTVDataStaging AS RTV
    ON (MTE.SiteListingId = RTV.SiteListingId  and MTE.EquipmentSubCategoryId= RTV.EquipmentSubCategoryId )  
WHEN MATCHED and  RTV.SourceSite=2  and (MTE.Year!=RTV.Year or MTE.Model!=RTV.Model or  MTE.StockNumber != RTV.StockNumber)
THEN 
    UPDATE SET 
         MTE.HoursMiles = RTV.HoursMiles,
		 MTE.Year = RTV.Year,
		 MTE.Seller = RTV.Seller,
		 MTE.CityState = RTV.CityState,
         MTE.SaleDate = RTV.SaleDate,
		 MTE.Model = RTV.Model,
		 MTE.VinNumber = RTV.VinNumber,
		 MTE.StockNumber = RTV.StockNumber,
		 MTE.EngineManufacturer = RTV.EngineManufacturer,
		 MTE.EquipmentCategoryManufacturerId = RTV.EquipmentCategoryManufacturerId,
	     MTE.LastUpdated = RTV.LastUpdated,
		 MTE.JsonData =	RTV.JsonData,
		 MTE.Suspension= RTV.Suspension,
		 MTE.Condition= RTV.Condition,
		 MTE.Horsepower= RTV.Horsepower,
		 MTE.Capacity= RTV.Capacity,
		 MTE.FreeAirDelivery= RTV.FreeAirDelivery
WHEN NOT MATCHED BY TARGET  and RTV.SourceSite=2
THEN 
     INSERT (HoursMiles, Year, Seller,CityState,SalePrice,SaleDate,ImageUrl,SiteListingId,SiteListingName,
	         Model,VinNumber,StockNumber,EngineManufacturer,EngineHorsepower,Transmission,Length,Width,Suspension,SerialNumber,Condition,Horsepower,Capacity,FreeAirDelivery,EquipmentCategoryManufacturerId,EquipmentSubCategoryId,
	         LastUpdated,DateCreated,ParentModel,SiteListingLink,DupeData,SourceFileName,JsonData)
     VALUES (RTV.HoursMiles, RTV.Year, RTV.Seller,RTV.CityState,RTV.SalePrice,RTV.SaleDate,RTV.ImageUrl,RTV.SiteListingId,RTV.SiteListingName,
	         RTV.Model,RTV.VinNumber,RTV.StockNumber,RTV.EngineManufacturer,RTV.EngineHorsepower,RTV.Transmission,RTV.Length,RTV.Width,RTV.Suspension,RTV.SerialNumber,RTV.Condition,RTV.Horsepower,RTV.Capacity,RTV.FreeAirDelivery,RTV.EquipmentCategoryManufacturerId,RTV.EquipmentSubCategoryId,
	         RTV.LastUpdated,RTV.DateCreated,RTV.ParentModel,RTV.SiteListingLink,RTV.DupeData,RTV.SourceFileName,RTV.JsonData);
 

	 UPDATE RTVDataStaging SET Isprocess=1 ,processDate=GETDATE()
	 WHERE SourceSite=2 AND Isprocess=0
END

GO

