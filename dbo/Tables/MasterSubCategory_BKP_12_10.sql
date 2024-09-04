CREATE TABLE [dbo].[MasterSubCategory_BKP_12_10] (
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
    [ShowSerialNum]       BIT           NULL
);


GO

