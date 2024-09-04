CREATE TABLE [dbo].[MarketingLeads] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [DateCreated]  DATETIME       NULL,
    [Message]      VARCHAR (MAX)  NULL,
    [SellerId]     NCHAR (10)     NULL,
    [Status]       NVARCHAR (50)  NULL,
    [DateReceived] DATETIME       NULL,
    [MessageId]    VARCHAR (100)  NULL,
    [MailFrom]     VARCHAR (100)  NULL,
    [MailSubject]  VARCHAR (300)  NULL,
    [LeadName]     VARCHAR (255)  NULL,
    [LeadEmail]    NVARCHAR (255) NULL,
    [LeadCompany]  VARCHAR (255)  NULL,
    [LeadLocation] VARCHAR (255)  NULL,
    [ItemId]       BIGINT         NULL,
    [LeadPhone]    BIGINT         NULL,
    [ItemPrice]    MONEY          NULL,
    [IsDeleted]    BIT            CONSTRAINT [DF_MarketingLeads_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_MarketingLeads] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

