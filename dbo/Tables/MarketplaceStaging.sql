CREATE TABLE [dbo].[MarketplaceStaging] (
    [Id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileName]      VARCHAR (200)  NOT NULL,
    [DataAsJson]    NVARCHAR (MAX) NULL,
    [DateCreated]   DATETIME       NOT NULL,
    [DateProcessed] DATETIME       NULL,
    CONSTRAINT [PK_MarketplaceStaging] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_MarketplaceStaging_FileName]
    ON [dbo].[MarketplaceStaging]([FileName] ASC);


GO
ALTER INDEX [IX_MarketplaceStaging_FileName]
    ON [dbo].[MarketplaceStaging] DISABLE;


GO

