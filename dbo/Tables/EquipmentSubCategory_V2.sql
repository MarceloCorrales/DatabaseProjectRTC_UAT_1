CREATE TABLE [dbo].[EquipmentSubCategory_V2] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [Name]                VARCHAR (250) NULL,
    [EquipmentCategoryId] INT           NULL,
    [SiteSubCategoryName] VARCHAR (250) NULL,
    [SiteSubCategoryId]   INT           NULL,
    [CreatedDate]         DATETIME      NULL,
    [CreatedBy]           VARCHAR (100) NULL,
    [Updatedate]          DATETIME      NULL,
    [UpdateBy]            VARCHAR (100) NULL,
    [IsDeleted]           BIT           NULL,
    [ShowHours]           BIT           NULL,
    [ShowMiles]           BIT           NULL,
    [ShowVIN]             BIT           NULL,
    [ShowSerialNum]       BIT           NULL,
    CONSTRAINT [PK__Equipmen__3214EC078481CE98] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK__Equipment__Equip__6A50C1DA] FOREIGN KEY ([EquipmentCategoryId]) REFERENCES [dbo].[EquipmentCategory_V2] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentSubCategory_V2] NOCHECK CONSTRAINT [FK__Equipment__Equip__6A50C1DA];


GO

