



CREATE   VIEW [dbo].[v_ItemListJoined]        
AS        
SELECT  CAST(i.Id AS VARCHAR(30)) AS id, i.[Name] AS [name], i.Id AS itemNumber,         
        ia.LocationId AS locationId, l.[Name] AS locationName,kw.Name as kw,    
  s.Id as sellerId, s.Name as sellerName,        
        CAST(ISNULL(usloc.Latitude, 0) AS FLOAT) AS locationLatitude, CAST(ISNULL(usloc.Longitude, 0) AS FLOAT) AS locationLongitude,         
        l.RegionId AS regionId, r.[Name] AS regionName, r.Abbreviation AS regionAbbreviation,         
        r.CountryId AS countryId, c.[Name] AS countryName, c.Abbreviation AS countryAbbreviation,         
        eventAuction.Id AS eventId, eventAuction.StartDateTime AS auctionDate,         
        eventAuction.IsOnlineEvent AS isOnlineEvent,         
        eventAuction.lotStartTime AS lotStartTime, eventAuction.lotCloseTime AS lotCloseTime,         
        privateEventAuction.privateEventId, privateEventAuction.privateEventStartTime, privateEventAuction.privateEventEndTime, privateEventAuction.privateEventStartingFloorPrice,         
  CAST(i.StartingBid AS FLOAT) AS startingBid, CAST(i.BidIncrement AS FLOAT) AS bidIncrement,         
  CASE WHEN ia.InspectionReportJson IS NOT NULL AND ia.ShowInspection = 1 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS 'isInspectionVisible',         
        ia.CategoryId AS categoryId, cat.[Name] AS categoryName, ISNULL(ia.SubCategoryId, 0) AS subCategoryId, ISNULL(subcat.[Name], '') AS subCategoryName,         
        ia.ManufacturerId AS manufacturerId, m.[Name] AS manufacturerName,         
        ia.PriceRangeId AS priceRangeId, CAST(i.[Year] AS VARCHAR(10)) AS year, ia.YearRangeId AS yearRangeId,   
        ia.KWRangeId AS kwRangeId,   
        ia.ModelId AS modelId, model.[Name] AS model,
		ISNULL(CAST(ia.HoursOrMileage AS VARCHAR(20)), 0) AS hoursOrMileage,         
        NULL AS buyingFormat,         
  Tags.Tags as 'Tags',        
        CASE WHEN eventAuction.Id IS NULL THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS isAuctionItem,         
        CASE WHEN (terraVerse.privateEventBlockId IS NOT NULL AND terraVerse.privateEventBlockIsPurchased IS NOT NULL AND terraVerse.privateEventBlockIsPurchased != 1) THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS isTerraVerseItem,         
        CASE WHEN (terraVerse.privateEventSummaryEndDateTime IS NULL) THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS isTerraVerseExpiredItem,         
        CASE WHEN (privateEventAuction.privateEventStartTime IS NULL) THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS isTerraVerseSaleItem,         
        terraVerse.terraVerseStartingFloorPrice,         
        ISNULL(ia.CanMakePriorityBid, 0) AS canMakePriorityBid, ISNULL(ia.CanMakeOffer, 0) AS canMakeOffer, ISNULL(ia.CanBuyNow, 0) AS canBuyNow,         
        ISNULL(ia.IsFeaturedItem, 0) AS isFeaturedItem,         
        CASE WHEN ia.IsMarketPlaceItem = 1 AND eventAuction.Id IS NULL THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS isMarketPlaceItem,         
  ISNULL(ia.IsFleetSelectItem, 0) AS isFleetSelectItem,         
        ISNULL(im.PublicUrl, '') AS primaryImageUrl, ISNULL(im.CloudId, '') AS primaryImageCloudId,         
        CASE WHEN ia.SortOrder IS NOT NULL THEN CAST(ia.SortOrder AS INT) ELSE CAST(RAND(CHECKSUM(NEWID())) * 10000 as INT) END AS 'auctionSortOrder',         
        NULL AS imageAltTag, NULL AS distance, NULL AS watchCount,         
        i.[Status] AS 'statusId', ist.[Name] AS 'itemStatus', i.IsDeleted AS isDeleted, i.DateCreated AS dateCreated, i.DateUpdated AS dateUpdated        
  --,CAST(CONVERT(NVARCHAR(MAX), CONVERT(BINARY(8), i.[Rowversion]), 1) AS VARCHAR(MAX)) AS 'rowVersion'         
  ,i.[Rowversion] AS 'rowVersion'        
  ,(CASE         
   WHEN (i.IsDeleted IS NOT NULL AND i.[Status] >= 1 AND i.[Status] <= 2 AND (ia.IsTerraVerseLive = 0 OR ia.IsTerraVerseLive IS NULL)) THEN 1        
   ELSE 0        
   END) AS 'isSearchable',        
   ia.IsWholeSale,        
   Itemwatch.aspnetusersid,        
   CAST(i.WholeSalePrice AS FLOAT) AS wholesaleprice        
FROM    dbo.Item AS i         
        INNER JOIN dbo.ItemAttribute AS ia ON ia.ItemId = i.Id         
        INNER JOIN dbo.LookupItemStatusType AS ist ON ist.Id = i.[Status]         
        INNER JOIN dbo.[Location] AS l ON l.Id = ia.LocationId         
        INNER JOIN dbo.Region AS r ON r.Id = l.RegionId         
        INNER JOIN dbo.Country AS c ON c.Id = r.CountryId        
  INNER JOIN dbo.Seller AS s ON s.Id = ia.SellerId        
        OUTER APPLY (         
          SELECT TOP 1 usloctable.*         
          FROM dbo.USLocationData usloctable         
          WHERE usloctable.City = l.[Name] AND usloctable.[State] = r.Abbreviation         
        ) AS usloc         
        INNER JOIN dbo.EquipmentCategory_V2 AS cat ON cat.Id = ia.CategoryId         
        LEFT OUTER JOIN dbo.EquipmentSubCategory_V2 AS subcat ON subcat.Id = ia.SubCategoryId         
        INNER JOIN dbo.EquipmentManufacturer_V2 AS m ON m.Id = ia.ManufacturerId
		LEFT OUTER JOIN dbo.EquipmentModel_V2 AS model ON model.Id = ia.ModelId 
        LEFT OUTER JOIN dbo.PriceRange AS pr ON pr.Id = ia.PriceRangeId         
        LEFT OUTER JOIN dbo.YearRange AS yr ON yr.Id = ia.YearRangeId     
   LEFT OUTER JOIN dbo.KWRange AS kw ON kw.Id = ia.KWRangeId    
        LEFT OUTER JOIN dbo.ItemMedia AS im ON im.ItemId = i.Id AND im.IsPrimary = 1         
        OUTER APPLY (         
          SELECT TOP 1 eventtable.*, eventitemtable.StartTime AS lotStartTime, eventitemtable.EndTime AS lotCloseTime         
          FROM dbo.EventItem eventitemtable         
          LEFT OUTER JOIN dbo.[Event] eventtable ON (         
            eventtable.Id = eventitemtable.EventId AND CONVERT(date, eventtable.ClosingDateTime) >= CONVERT(date, GETUTCDATE())         
          )         
          WHERE eventitemtable.ItemId = i.Id         
        ) AS eventAuction         
        OUTER APPLY (         
          SELECT PESUMMARY.PrivateEventId AS privateEventId,         
            PESUMMARY.StartTime AS privateEventStartTime,         
            PESUMMARY.EndTime AS privateEventEndTime,         
            PEBLOCK.StartingFloorPrice AS privateEventStartingFloorPrice         
          FROM PrivateEventBlockItem PEBITEM         
            INNER JOIN PrivateEventBlock PEBLOCK ON PEBLOCK.Id = PEBITEM.PrivateEventBlockId         
            INNER JOIN PrivateEventSummary PESUMMARY ON PESUMMARY.Id = PEBLOCK.PrivateEventSummaryId         
          WHERE ItemId = i.Id         
          AND PESUMMARY.[Description] != 'TerraVerse Marketplace Item'         
          AND CONVERT(date, PESUMMARY.EndTime) >= CONVERT(date, GETUTCDATE())         
        ) AS privateEventAuction         
        OUTER APPLY (         
          SELECT peb.Id AS privateEventBlockId,         
          pes.EndTime AS privateEventSummaryEndDateTime, peb.StartingFloorPrice AS terraVerseStartingFloorPrice,         
    CASE WHEN (pebid.IsPurchase IS NOT NULL AND pebid.IsPurchase = 1) THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS privateEventBlockIsPurchased         
          FROM dbo.PrivateEventBlockItem pebi         
    INNER JOIN dbo.PrivateEventBlock peb ON peb.Id = pebi.PrivateEventBlockId         
    INNER JOIN dbo.PrivateEventSummary pes ON (pes.Id = peb.PrivateEventSummaryId AND pes.[Description] = 'TerraVerse Marketplace Item')         
    INNER JOIN dbo.PrivateEvent pe ON pe.Id = pes.PrivateEventId         
    LEFT OUTER JOIN dbo.PrivateEventBid pebid ON (         
      pebid.PrivateEventBlockId = peb.Id AND pebid.IsPurchase = 1 AND pebid.IsDeleted = 0        
    )         
          WHERE pebi.ItemId = i.Id         
    AND pes.EndTime >= GETUTCDATE()         
        ) AS terraVerse         
  OUTER APPLY(        
     select LOWER(STRING_AGG(URL, ',')) as Tags        
    FROM [dbo].[ItemTagsXref] itgf        
    JOIN ItemTags itg on itgf.tagid = itg.ID        
    Where itgf.itemid = i.Id        
  ) AS Tags        
  --TODO 1/18/2021        
  outer apply(        
  select aspnetusersid from ItemWatch iw where iw.itemid=i.id        
  ) as Itemwatch        
        --where i.IsDeleted=0
--WHERE   (i.IsDeleted IS NOT NULL AND i.[Status] >= 1 AND i.[Status] <= 2)      
      
-- UPDATE ON 20210712 

GO

