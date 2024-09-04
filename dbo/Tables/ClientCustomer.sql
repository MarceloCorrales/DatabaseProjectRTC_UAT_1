CREATE TABLE [dbo].[ClientCustomer] (
    [Id]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [RTVClientId]  BIGINT        NOT NULL,
    [CompanyName]  VARCHAR (100) NULL,
    [Address1]     VARCHAR (100) NULL,
    [Address2]     VARCHAR (100) NULL,
    [City]         VARCHAR (100) NULL,
    [State]        VARCHAR (5)   NULL,
    [PostalCode]   VARCHAR (20)  NULL,
    [FirstName]    VARCHAR (100) NULL,
    [LastName]     VARCHAR (100) NULL,
    [EmailAddress] VARCHAR (100) NULL,
    [MobileNumber] VARCHAR (20)  NULL,
    [OfficeNumber] VARCHAR (20)  NULL,
    [LastUpdated]  DATETIME      NOT NULL,
    [DateCreated]  DATETIME      NOT NULL,
    CONSTRAINT [PK_ClientCustomer] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ClientCustomer_RTVClient] FOREIGN KEY ([RTVClientId]) REFERENCES [dbo].[RTVClient] ([Id])
);


GO
ALTER TABLE [dbo].[ClientCustomer] NOCHECK CONSTRAINT [FK_ClientCustomer_RTVClient];


GO

