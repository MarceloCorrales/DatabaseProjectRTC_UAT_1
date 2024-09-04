CREATE TABLE [dbo].[RTVDataLoad] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [SourceFileName] VARCHAR (250)  NOT NULL,
    [SiteListingId]  VARCHAR (100)  NULL,
    [JsonData]       VARCHAR (MAX)  NULL,
    [ReasonDesc]     VARCHAR (1000) NULL,
    [DateCreated]    DATETIME       NOT NULL,
    [DateProcessed]  DATETIME       CONSTRAINT [DF_RTVDataLoad_DateProcessed] DEFAULT (NULL) NULL,
    CONSTRAINT [PK_RTVDataLoad] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

