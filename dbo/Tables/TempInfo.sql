CREATE TABLE [dbo].[TempInfo] (
    [Id]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [KeyId]    VARCHAR (50)  NOT NULL,
    [KeyValue] VARCHAR (250) NOT NULL,
    CONSTRAINT [PK_TempInfo] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_KeyId_TempInfo]
    ON [dbo].[TempInfo]([KeyId] ASC);


GO
ALTER INDEX [IX_KeyId_TempInfo]
    ON [dbo].[TempInfo] DISABLE;


GO

