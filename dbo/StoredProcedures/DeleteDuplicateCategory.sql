-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDuplicateCategory]
AS
BEGIN
 DECLARE @LOCAL_EquipmentCategoryManufacturer TABLE
(
Name varchar(350), 
 EquipmentCategoryId int
)

insert into @LOCAL_EquipmentCategoryManufacturer (Name,EquipmentCategoryId)
Select Name, EquipmentCategoryId  from EquipmentCategoryManufacturer
 group by Name,EquipmentCategoryId
 having count(*)>1
 --Select * from @LOCAL_EquipmentCategoryManufacturer
 DECLARE @Cid int ,@name varchar(20),@Mid int,@Mid1 int
 DECLARE emp_cursor CURSOR FOR
 Select  * from @LOCAL_EquipmentCategoryManufacturer  
 OPEN emp_cursor
 FETCH NEXT FROM emp_cursor
 into @name,@Cid
 WHILE @@FETCH_STATUS = 0
BEGIN
 BEGIN TRANSACTION
  set @Mid= ( Select top 1 Id from EquipmentCategoryManufacturer where Name =@name and EquipmentCategoryId=@Cid order by 1)
  set @Mid1= ( Select top 1 Id from EquipmentCategoryManufacturer where Name =@name and EquipmentCategoryId=@Cid order by 1 desc)
  --Select * from RTVDataStaging where EquipmentCategoryManufacturerId in (@Mid,@Mid1)
  update RTVDataStaging set EquipmentCategoryManufacturerId=@Mid where EquipmentCategoryManufacturerId=@Mid1
   update TruckPaperEquipment set EquipmentCategoryManufacturerId=@Mid where EquipmentCategoryManufacturerId=@Mid1
   update MachineryTraderEquipment set EquipmentCategoryManufacturerId=@Mid where EquipmentCategoryManufacturerId=@Mid1
    delete from EquipmentCategoryManufacturer where Id=@Mid1
 IF @@ERROR != 0
    BEGIN
        ROLLBACK TRANSACTION
        RETURN
    END
    ELSE
    BEGIN
        COMMIT TRANSACTION
    END
    FETCH NEXT FROM emp_cursor
INTO @name,@Cid

END
CLOSE emp_cursor;
DEALLOCATE emp_cursor;

END

GO

