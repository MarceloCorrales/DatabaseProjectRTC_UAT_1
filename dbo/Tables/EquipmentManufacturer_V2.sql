CREATE TABLE [dbo].[EquipmentManufacturer_V2] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (250) NULL,
    [CreatedDate] DATETIME      NULL,
    [CreatedBy]   VARCHAR (100) NULL,
    [Updatedate]  DATETIME      NULL,
    [UpdateBy]    VARCHAR (100) NULL,
    [IsDeleted]   BIT           NULL,
    [SiteId]      INT           NULL,
    CONSTRAINT [PK__Equipmen__3214EC07AD531566] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EquipmentManufacturer_V2_Site] FOREIGN KEY ([SiteId]) REFERENCES [dbo].[Site] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentManufacturer_V2] NOCHECK CONSTRAINT [FK_EquipmentManufacturer_V2_Site];


GO

CREATE NONCLUSTERED INDEX [nci_wi_EquipmentManufacturer_V2_45C32E3FE7034143C693A37337D9F165]
    ON [dbo].[EquipmentManufacturer_V2]([IsDeleted] ASC, [SiteId] ASC, [Name] ASC)
    INCLUDE([CreatedBy], [CreatedDate], [UpdateBy], [Updatedate]);


GO
ALTER INDEX [nci_wi_EquipmentManufacturer_V2_45C32E3FE7034143C693A37337D9F165]
    ON [dbo].[EquipmentManufacturer_V2] DISABLE;


GO

CREATE NONCLUSTERED INDEX [nci_wi_EquipmentManufacturer_V2_E2C9640CAD6E2B3B1F339FDD4E1A977A]
    ON [dbo].[EquipmentManufacturer_V2]([SiteId] ASC, [IsDeleted] ASC)
    INCLUDE([CreatedBy], [CreatedDate], [Name], [UpdateBy], [Updatedate]);


GO
ALTER INDEX [nci_wi_EquipmentManufacturer_V2_E2C9640CAD6E2B3B1F339FDD4E1A977A]
    ON [dbo].[EquipmentManufacturer_V2] DISABLE;


GO

