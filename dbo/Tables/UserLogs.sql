CREATE TABLE [dbo].[UserLogs] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]         NVARCHAR (128) NULL,
    [Platform]       VARCHAR (250)  NULL,
    [UserEmail]      VARCHAR (100)  NULL,
    [FunctionName]   VARCHAR (250)  NULL,
    [Description]    VARCHAR (MAX)  NULL,
    [AdditionalData] VARCHAR (MAX)  NULL,
    [DateTime]       DATETIME       NULL,
    [TimeStamp]      DATETIME       NULL,
    CONSTRAINT [PK_UserLogs] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

