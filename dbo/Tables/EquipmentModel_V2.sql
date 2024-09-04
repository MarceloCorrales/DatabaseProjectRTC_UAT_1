CREATE TABLE [dbo].[EquipmentModel_V2] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (MAX) NULL,
    [ManufacturerId] INT            NOT NULL,
    [CreatedDate]    DATETIME       CONSTRAINT [DF_EquipmentModel_V2_CreatedDate] DEFAULT (getdate()) NULL,
    [CreatedBy]      NVARCHAR (100) NULL,
    [UpdatedDate]    DATETIME       CONSTRAINT [DF_EquipmentModel_V2_UpdatedDate] DEFAULT (getdate()) NULL,
    [UpdatedBy]      NVARCHAR (100) NULL,
    [IsDeleted]      BIT            CONSTRAINT [DF_EquipmentModel_V2_IsDeleted] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_EquipmentModel_V2] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EquipmentModel_EquipmentManufacturer_V2] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[EquipmentManufacturer_V2] ([Id])
);


GO
ALTER TABLE [dbo].[EquipmentModel_V2] NOCHECK CONSTRAINT [FK_EquipmentModel_EquipmentManufacturer_V2];


GO

