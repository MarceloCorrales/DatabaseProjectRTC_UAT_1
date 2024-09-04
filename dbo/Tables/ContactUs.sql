CREATE TABLE [dbo].[ContactUs] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (100)  NULL,
    [Company]         VARCHAR (100)  NULL,
    [Phone]           VARCHAR (20)   NULL,
    [Email]           VARCHAR (100)  NULL,
    [Address]         VARCHAR (250)  NULL,
    [City]            VARCHAR (20)   NULL,
    [State]           VARCHAR (20)   NULL,
    [ZipCode]         VARCHAR (10)   NULL,
    [Message]         VARCHAR (MAX)  NULL,
    [ContactDateTime] DATETIME       NULL,
    [UserId]          NVARCHAR (128) NULL,
    CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

