CREATE TABLE [dbo].[ClientUsers] (
    [Id]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [ClientId] BIGINT         NOT NULL,
    [UserId]   NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_ClientUsers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ClientUsers_Client] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[RTVClient] ([Id])
);


GO
ALTER TABLE [dbo].[ClientUsers] NOCHECK CONSTRAINT [FK_ClientUsers_Client];


GO

