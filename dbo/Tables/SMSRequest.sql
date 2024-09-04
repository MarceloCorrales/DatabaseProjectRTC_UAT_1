CREATE TABLE [dbo].[SMSRequest] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [MessageSid]   VARCHAR (50)   NULL,
    [FromNumber]   VARCHAR (25)   NULL,
    [ToNumber]     VARCHAR (25)   NULL,
    [Message]      VARCHAR (1000) NULL,
    [JsonData]     VARCHAR (MAX)  NULL,
    [EmailAddress] VARCHAR (250)  NULL,
    [DateCreated]  DATETIME       NOT NULL,
    CONSTRAINT [PK_SMSRequests] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

