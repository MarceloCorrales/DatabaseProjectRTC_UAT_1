CREATE TABLE [dbo].[PriceRange] (
    [Id]       INT          NOT NULL,
    [Name]     VARCHAR (50) NOT NULL,
    [MinValue] INT          NOT NULL,
    [MaxValue] INT          NOT NULL,
    CONSTRAINT [PK_PriceRange] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

