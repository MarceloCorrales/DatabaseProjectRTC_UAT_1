CREATE TABLE [dbo].[Inspection] (
    [Id]                  BIGINT            IDENTITY (1000, 1) NOT NULL,
    [AspNetUsersId]       NVARCHAR (128)    NOT NULL,
    [CategoryId]          INT               NOT NULL,
    [SubCategoryId]       INT               NULL,
    [Year]                INT               NOT NULL,
    [ManufacturerId]      INT               NOT NULL,
    [Model]               VARCHAR (50)      NULL,
    [Name]                VARCHAR (100)     NULL,
    [HoursOrMileage]      INT               NULL,
    [SerialNumberOrVin]   VARCHAR (50)      NOT NULL,
    [StockNumber]         VARCHAR (50)      NOT NULL,
    [ContractVersion]     VARCHAR (5)       NOT NULL,
    [AssignedInspectorId] NVARCHAR (128)    NULL,
    [InspectionStatusId]  INT               NOT NULL,
    [LocationLatLong]     [sys].[geography] NULL,
    [StartedDateTime]     DATETIME          NULL,
    [DateUpdated]         DATETIME          NULL,
    [CompletedDateTime]   DATETIME          NULL,
    [PrevInspectionId]    BIGINT            NULL,
    [City]                VARCHAR (80)      NULL,
    [State]               VARCHAR (10)      NULL,
    [Miles]               INT               NULL,
    [Vin]                 VARCHAR (50)      NULL,
    [AskingPrice]         DECIMAL (18, 2)   NULL,
    [ModelId]             INT               NULL,
    [Location]            VARCHAR (250)     NULL,
    CONSTRAINT [PK_Inspection] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Inspection_AspNetUsers] FOREIGN KEY ([AspNetUsersId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Inspection_EquipmentCategory] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[EquipmentCategory_V2] ([Id]),
    CONSTRAINT [FK_Inspection_EquipmentManufacturer] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[EquipmentManufacturer_V2] ([Id]),
    CONSTRAINT [FK_Inspection_EquipmentModel] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[EquipmentModel_V2] ([Id]),
    CONSTRAINT [FK_Inspection_EquipmentSubCategory] FOREIGN KEY ([SubCategoryId]) REFERENCES [dbo].[EquipmentSubCategory_V2] ([Id]),
    CONSTRAINT [FK_Inspection_InspectionStatus] FOREIGN KEY ([InspectionStatusId]) REFERENCES [dbo].[InspectionStatus] ([Id])
);


GO
ALTER TABLE [dbo].[Inspection] NOCHECK CONSTRAINT [FK_Inspection_AspNetUsers];


GO
ALTER TABLE [dbo].[Inspection] NOCHECK CONSTRAINT [FK_Inspection_EquipmentCategory];


GO
ALTER TABLE [dbo].[Inspection] NOCHECK CONSTRAINT [FK_Inspection_EquipmentManufacturer];


GO
ALTER TABLE [dbo].[Inspection] NOCHECK CONSTRAINT [FK_Inspection_EquipmentModel];


GO
ALTER TABLE [dbo].[Inspection] NOCHECK CONSTRAINT [FK_Inspection_EquipmentSubCategory];


GO
ALTER TABLE [dbo].[Inspection] NOCHECK CONSTRAINT [FK_Inspection_InspectionStatus];


GO

