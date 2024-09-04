CREATE TABLE [dbo].[FindMileHour] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [TruckId]         BIGINT         NULL,
    [SiteListingId]   BIGINT         NULL,
    [SiteListingLink] NVARCHAR (MAX) NULL,
    [PageLink]        NVARCHAR (MAX) NULL,
    [hourvalue]       NVARCHAR (30)  NULL,
    [CreatedDate]     DATETIME       NULL,
    [updateDate]      DATETIME       NULL,
    [saleDate]        DATETIME       NULL,
    [status]          BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

