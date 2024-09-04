CREATE TABLE [dbo].[EquipmentHours] (
    [Id]                  SMALLINT IDENTITY (1, 1) NOT NULL,
    [EquipmentCategoryId] INT      NULL,
    [HoursMonth]          INT      NULL,
    [LastUpdated]         DATETIME NULL,
    [DateCreated]         DATETIME DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_EquipmentHours] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

