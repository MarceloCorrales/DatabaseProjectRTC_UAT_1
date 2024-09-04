CREATE TABLE [dbo].[ScraperLogs] (
    [Id]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [ScraperMasterId] BIGINT          NULL,
    [Errormsg]        NVARCHAR (MAX)  NULL,
    [CreatedDate]     DATETIME        NULL,
    [PageUrl]         NVARCHAR (1000) NULL,
    [methodName]      NVARCHAR (200)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

