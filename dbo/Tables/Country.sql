CREATE TABLE [dbo].[Country] (
    [Id]                   INT           IDENTITY (1, 1) NOT NULL,
    [Abbreviation]         VARCHAR (10)  NOT NULL,
    [Name]                 VARCHAR (250) NOT NULL,
    [CurrencyAbbreviation] VARCHAR (10)  NULL,
    [LastUpdatedBy]        VARCHAR (255) NULL,
    [DateUpdated]          DATETIME      NULL,
    CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

