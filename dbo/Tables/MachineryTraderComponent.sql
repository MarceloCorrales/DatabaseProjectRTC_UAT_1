CREATE TABLE [dbo].[MachineryTraderComponent] (
    [Id]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (250) NOT NULL,
    [YearsOldStart] INT           NOT NULL,
    [YearsOldEnd]   INT           NOT NULL,
    [ValueAdd]      MONEY         NOT NULL,
    CONSTRAINT [PK_MachineryTraderComponent] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

