CREATE TABLE [dbo].[PrivateEventState] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [PrivateEventId] BIGINT         NOT NULL,
    [UserId]         NVARCHAR (128) NOT NULL,
    [RaisedAt]       INT            NOT NULL,
    [EventDateTime]  DATETIME       NOT NULL,
    [IsPaused]       BIT            NOT NULL,
    CONSTRAINT [PK_PrivateEventState] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PrivateEventState_PrivateEvent] FOREIGN KEY ([PrivateEventId]) REFERENCES [dbo].[PrivateEvent] ([Id])
);


GO
ALTER TABLE [dbo].[PrivateEventState] NOCHECK CONSTRAINT [FK_PrivateEventState_PrivateEvent];


GO

