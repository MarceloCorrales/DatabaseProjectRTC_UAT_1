CREATE TABLE [dbo].[EventUser] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [EventId]          BIGINT         NOT NULL,
    [AspNetUsersId]    NVARCHAR (128) NOT NULL,
    [AgreeToTermsDate] DATETIME       NOT NULL,
    CONSTRAINT [PK_EventUser] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EventUser_AspNetUsers] FOREIGN KEY ([AspNetUsersId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_EventUser_Event] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id])
);


GO
ALTER TABLE [dbo].[EventUser] NOCHECK CONSTRAINT [FK_EventUser_AspNetUsers];


GO
ALTER TABLE [dbo].[EventUser] NOCHECK CONSTRAINT [FK_EventUser_Event];


GO

CREATE NONCLUSTERED INDEX [IX_EventId_UserId]
    ON [dbo].[EventUser]([EventId] ASC, [AspNetUsersId] ASC);


GO
ALTER INDEX [IX_EventId_UserId]
    ON [dbo].[EventUser] DISABLE;


GO

