CREATE TABLE [dbo].[Customer] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (100)  NULL,
    [CustProfileId] VARCHAR (100)  NULL,
    [CustomerName]  VARCHAR (250)  NULL,
    [CompanyName]   VARCHAR (150)  NULL,
    [WebsiteUrl]    VARCHAR (150)  NULL,
    [Email]         VARCHAR (50)   NULL,
    [Uid]           NVARCHAR (256) NULL,
    [createdate]    DATETIME       NULL,
    [IsDeleted]     BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

