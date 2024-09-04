CREATE TABLE [dbo].[EquipmentAcceptedManufacturer] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [Name]           VARCHAR (250) NULL,
    [ManufacturerId] INT           NOT NULL,
    [CreatedDate]    DATETIME      NULL,
    [CreatedBy]      VARCHAR (100) NULL,
    [Updatedate]     DATETIME      NULL,
    [UpdateBy]       VARCHAR (100) NULL,
    [IsDeleted]      BIT           NULL,
    CONSTRAINT [PK__Equipmen__3214EC077DD6D0D0] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK__Equipment__Manuf__379037E3] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[EquipmentManufacturer_V2] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentAcceptedManufacturer] NOCHECK CONSTRAINT [FK__Equipment__Manuf__379037E3];


GO

