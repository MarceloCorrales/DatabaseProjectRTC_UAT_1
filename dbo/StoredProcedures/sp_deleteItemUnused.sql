-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[sp_deleteItemUnused]
AS
BEGIN


 update item set DateUpdated=GETDATE(),Status=3,IsDeleted=1,LastUpdatedBy='B2BFileAutoMated Remove' where Id in ( Select i.Id from Item i left join ItemAttribute ia on i.Id = ia.ItemId where ia.ItemId is null)
END

GO

