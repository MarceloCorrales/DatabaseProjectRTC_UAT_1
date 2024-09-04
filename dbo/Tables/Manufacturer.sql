CREATE TABLE [dbo].[Manufacturer] (
    [Id]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (250) NOT NULL,
    [DateCreated]   DATETIME      NULL,
    [DateUpdated]   DATETIME      NULL,
    [LastUpdatedBy] VARCHAR (250) NULL,
    CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

