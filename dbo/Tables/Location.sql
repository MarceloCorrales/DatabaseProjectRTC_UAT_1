CREATE TABLE [dbo].[Location] (
    [Id]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [RegionId]      INT           NOT NULL,
    [Name]          VARCHAR (250) NOT NULL,
    [LastUpdatedBy] VARCHAR (255) NULL,
    [DateUpdated]   DATETIME      NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Location_Region] FOREIGN KEY ([RegionId]) REFERENCES [dbo].[Region] ([Id])
);


GO
ALTER TABLE [dbo].[Location] NOCHECK CONSTRAINT [FK_Location_Region];


GO

