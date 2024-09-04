CREATE TABLE [dbo].[AlternativeLocation] (
    [Id]               INT            IDENTITY (1000, 1) NOT NULL,
    [OriginalLocation] NVARCHAR (255) NULL,
    [ReplaceLocation]  NVARCHAR (255) NULL,
    [isDeleted]        BIT            DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

