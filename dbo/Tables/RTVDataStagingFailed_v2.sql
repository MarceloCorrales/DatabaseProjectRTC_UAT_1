CREATE TABLE [dbo].[RTVDataStagingFailed_v2] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [RTVDataStagingMasterId] INT            NULL,
    [ReasonDesc]             NVARCHAR (MAX) NULL,
    [JsonData]               VARCHAR (MAX)  NULL,
    [SourceSite]             INT            NULL,
    [SiteListingId]          BIGINT         NULL,
    [CreatedDate]            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK__RTVDataSt__RTVDa__119F9925] FOREIGN KEY ([RTVDataStagingMasterId]) REFERENCES [dbo].[RTVDataStagingMaster_v2] ([Id])
);


GO
ALTER TABLE [dbo].[RTVDataStagingFailed_v2] NOCHECK CONSTRAINT [FK__RTVDataSt__RTVDa__119F9925];


GO

