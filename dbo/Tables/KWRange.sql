CREATE TABLE [dbo].[KWRange] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [Name]     VARCHAR (40) NULL,
    [MinValue] INT          NULL,
    [MaxValue] INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

