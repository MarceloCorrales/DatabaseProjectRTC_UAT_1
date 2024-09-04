CREATE TABLE [dbo].[RTVDataStagingFailed] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [RTVDataStagingMasterId] BIGINT         NOT NULL,
    [ReasonDesc]             NVARCHAR (MAX) NULL,
    [JsonData]               VARCHAR (MAX)  NULL,
    [SourceSite]             INT            NULL,
    [SiteListingId]          BIGINT         NULL,
    CONSTRAINT [PK_RTVDataStagingFailed] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

