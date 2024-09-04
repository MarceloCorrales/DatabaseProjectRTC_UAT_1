CREATE TABLE [dbo].[Site] (
    [Id]        INT           NOT NULL,
    [Name]      VARCHAR (100) NOT NULL,
    [GroupName] VARCHAR (50)  NULL,
    CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

