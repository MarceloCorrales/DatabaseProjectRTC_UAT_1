CREATE TABLE [dbo].[UserProfile] (
    [Id]                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [AspNetUsersId]           NVARCHAR (128) NOT NULL,
    [CompanyName]             VARCHAR (200)  NULL,
    [MiddleName]              VARCHAR (50)   NULL,
    [ProfileType]             VARCHAR (50)   NULL,
    [Title]                   VARCHAR (200)  NULL,
    [Address]                 VARCHAR (200)  NULL,
    [City]                    VARCHAR (100)  NULL,
    [State]                   VARCHAR (100)  NULL,
    [Country]                 VARCHAR (100)  NULL,
    [PostalCode]              VARCHAR (20)   NULL,
    [Fax]                     VARCHAR (20)   NULL,
    [MobileNumber]            VARCHAR (20)   NULL,
    [TimeZone]                VARCHAR (50)   NULL,
    [LocalCurrency]           VARCHAR (20)   NULL,
    [CommunicationEmailYesNo] BIT            NOT NULL,
    [CommunicationSMSYesNo]   BIT            NOT NULL,
    [CustomerProfileId]       VARCHAR (30)   NULL,
    [CreditLimit]             MONEY          CONSTRAINT [DF_UserProfile_CreditLimit] DEFAULT ((0.00)) NULL,
    [DateUpdated]             DATETIME       NULL,
    [BankName]                VARCHAR (200)  NULL,
    [BankAddress]             VARCHAR (200)  NULL,
    [BankerName]              VARCHAR (200)  NULL,
    [BankerPhoneNumber]       VARCHAR (200)  NULL,
    [RegisteredPage]          VARCHAR (100)  NULL,
    CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserProfile_AspNetUsers] FOREIGN KEY ([AspNetUsersId]) REFERENCES [dbo].[AspNetUsers] ([Id])
);


GO
ALTER TABLE [dbo].[UserProfile] NOCHECK CONSTRAINT [FK_UserProfile_AspNetUsers];


GO

CREATE NONCLUSTERED INDEX [IX_AspNetUsersId_UserProfile]
    ON [dbo].[UserProfile]([AspNetUsersId] ASC);


GO
ALTER INDEX [IX_AspNetUsersId_UserProfile]
    ON [dbo].[UserProfile] DISABLE;


GO

