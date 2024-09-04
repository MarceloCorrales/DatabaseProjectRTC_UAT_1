CREATE TABLE [dbo].[ClientSearchHistory] (
    [Id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [ClientUsersId]        BIGINT        NOT NULL,
    [EquipmentSearchModel] VARCHAR (MAX) NULL,
    [DateInvoiced]         DATETIME      NOT NULL,
    [LastUpdated]          DATETIME      NOT NULL,
    [DateCreated]          DATETIME      NOT NULL,
    CONSTRAINT [PK_ClientSearchHistory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ClientSearchHistory_ClientUsers] FOREIGN KEY ([ClientUsersId]) REFERENCES [dbo].[ClientUsers] ([Id])
);


GO
ALTER TABLE [dbo].[ClientSearchHistory] NOCHECK CONSTRAINT [FK_ClientSearchHistory_ClientUsers];


GO

