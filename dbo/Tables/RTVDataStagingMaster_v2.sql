CREATE TABLE [dbo].[RTVDataStagingMaster_v2] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [SourceFileName]   NVARCHAR (MAX) NULL,
    [DateCreated]      DATETIME       NULL,
    [DateProcessed]    DATETIME       NULL,
    [TotalRecords]     INT            NULL,
    [ProcessedRecords] INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

