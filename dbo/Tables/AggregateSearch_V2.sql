CREATE TABLE [dbo].[AggregateSearch_V2] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [AggregateId]      VARCHAR (250) NOT NULL,
    [AggregateName]    VARCHAR (250) NOT NULL,
    [SiteId]           INT           NOT NULL,
    [SiteGroup]        VARCHAR (250) NOT NULL,
    [CategoryId]       INT           NOT NULL,
    [CategoryName]     VARCHAR (250) NOT NULL,
    [SubCategoryId]    INT           NULL,
    [SubCategoryName]  VARCHAR (250) NULL,
    [ManufacturerId]   INT           NOT NULL,
    [ManufacturerName] VARCHAR (250) NOT NULL,
    [Parentmodel]      VARCHAR (250) NOT NULL,
    [NumberOfComps]    INT           NOT NULL,
    CONSTRAINT [PK_AggregateSearch_V2] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

