CREATE PROCEDURE [dbo].[ItemAttribute_UpdateStatusToArchived]
AS

DECLARE @NumberOfDaysToRetainData int = -7

UPDATE 
  item 
SET 
  item.[Status] = 5
FROM 
  [dbo].Item AS item 
  INNER JOIN [dbo].ItemAttribute AS itemAttribute ON item.Id = itemAttribute.ItemId 
  LEFT JOIN [dbo].Seller AS seller ON itemAttribute.SellerId = seller.Id 
WHERE 
  item.Status = '2'
  AND itemAttribute.IsMarketPlaceItem = 1
  AND item.DateUpdated < DATEADD(DAY, @NumberOfDaysToRetainData, seller.JobProcessed_on)

GO

