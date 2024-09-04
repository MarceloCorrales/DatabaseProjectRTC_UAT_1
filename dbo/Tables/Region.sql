CREATE TABLE [dbo].[Region] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [CountryId]     INT           NOT NULL,
    [Abbreviation]  VARCHAR (5)   NOT NULL,
    [Name]          VARCHAR (100) NOT NULL,
    [LastUpdatedBy] VARCHAR (255) NULL,
    [DateUpdated]   DATETIME      NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Region_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id])
);


GO
ALTER TABLE [dbo].[Region] NOCHECK CONSTRAINT [FK_Region_Country];


GO

CREATE NONCLUSTERED INDEX [IX_Region_CountryIdAbbreviation]
    ON [dbo].[Region]([CountryId] ASC, [Abbreviation] ASC);


GO
ALTER INDEX [IX_Region_CountryIdAbbreviation]
    ON [dbo].[Region] DISABLE;


GO

