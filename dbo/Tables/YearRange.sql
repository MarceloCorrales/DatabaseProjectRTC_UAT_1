CREATE TABLE [dbo].[YearRange] (
    [Id]       INT           NOT NULL,
    [Name]     VARCHAR (100) NOT NULL,
    [MinValue] INT           NOT NULL,
    [MaxValue] INT           NOT NULL,
    CONSTRAINT [PK_YearRange] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

