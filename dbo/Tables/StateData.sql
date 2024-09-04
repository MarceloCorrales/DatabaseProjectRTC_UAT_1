CREATE TABLE [dbo].[StateData] (
    [Abbreviation] VARCHAR (2)   NOT NULL,
    [Name]         VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_StateData] PRIMARY KEY CLUSTERED ([Abbreviation] ASC)
);


GO

