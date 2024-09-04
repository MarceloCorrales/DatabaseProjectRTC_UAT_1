CREATE TABLE [dbo].[UserDocument] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [AspNetUserId] NVARCHAR (128) NOT NULL,
    [DocumentName] NVARCHAR (128) NULL,
    [DocumentType] NVARCHAR (128) NULL,
    [DocumentData] VARCHAR (MAX)  NULL,
    CONSTRAINT [PK_UserDocument] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserDocument_AspNetUsers] FOREIGN KEY ([AspNetUserId]) REFERENCES [dbo].[AspNetUsers] ([Id])
);


GO
ALTER TABLE [dbo].[UserDocument] NOCHECK CONSTRAINT [FK_UserDocument_AspNetUsers];


GO

