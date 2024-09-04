CREATE TABLE [dbo].[RTVDataStagingMaster] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [SourceFileName] NVARCHAR (MAX) NOT NULL,
    [DateCreated]    DATETIME2 (7)  NOT NULL,
    [DateProcessed]  DATETIME2 (7)  NULL,
    [TotalRecords]   INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

