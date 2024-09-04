CREATE TABLE [dbo].[RTVClient] (
    [Id]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [FullName]    VARCHAR (100) NULL,
    [FullAddress] VARCHAR (250) NULL,
    [PhoneNumber] VARCHAR (50)  NULL,
    [IsActive]    BIT           NULL,
    [DateCreated] DATETIME      NULL,
    [LastUpdated] DATETIME      NULL,
    [UpdatedBy]   VARCHAR (50)  NULL,
    CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

