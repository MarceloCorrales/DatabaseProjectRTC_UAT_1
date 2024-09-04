CREATE TABLE [dbo].[ItemTracking] (
    [Id]                BIGINT          IDENTITY (1, 1) NOT NULL,
    [ItemId]            BIGINT          NOT NULL,
    [NewStatus]         NVARCHAR (200)  NULL,
    [NewPrice]          NVARCHAR (200)  NULL,
    [NewDescription]    NVARCHAR (2000) NULL,
    [NewIsTerraVerse]   NVARCHAR (200)  NULL,
    [NewIsMarketPlace]  NVARCHAR (200)  NULL,
    [NewIsDeleted]      NVARCHAR (200)  NULL,
    [UpdatedBy]         NVARCHAR (200)  NULL,
    [DateUpdated]       DATETIME        NOT NULL,
    [PrevStatus]        NVARCHAR (200)  NULL,
    [PrevPrice]         NVARCHAR (200)  NULL,
    [PrevDescription]   NVARCHAR (2000) NULL,
    [PrevIsTerraVerse]  NVARCHAR (200)  NULL,
    [PrevIsMarketPlace] NVARCHAR (200)  NULL,
    [PrevIsDeleted]     NVARCHAR (200)  NULL,
    [PrevName]          NVARCHAR (200)  NULL,
    [NewName]           NVARCHAR (200)  NULL,
    [PrevIsFleetSale]   NVARCHAR (200)  NULL,
    [NewIsFleetSale]    NVARCHAR (200)  NULL,
    CONSTRAINT [PK_ItemTracking] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ItemTracking_Item] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id])
);


GO
ALTER TABLE [dbo].[ItemTracking] NOCHECK CONSTRAINT [FK_ItemTracking_Item];


GO

