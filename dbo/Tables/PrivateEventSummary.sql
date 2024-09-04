CREATE TABLE [dbo].[PrivateEventSummary] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [PrivateEventId]         BIGINT         NOT NULL,
    [Title]                  VARCHAR (100)  NULL,
    [Description]            VARCHAR (2000) NULL,
    [ImageUrl]               VARCHAR (500)  NULL,
    [Quantity]               INT            NULL,
    [StartTime]              DATETIME       NULL,
    [ExpireNotificationSent] BIT            NULL,
    [EndTime]                DATETIME       NULL,
    [InitialEndTime]         DATETIME       NULL,
    [GroupName]              VARCHAR (100)  NULL,
    [ItemTagId]              INT            NULL,
    CONSTRAINT [PK_PrivateEventItem] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PrivateEventItem_PrivateEvent] FOREIGN KEY ([PrivateEventId]) REFERENCES [dbo].[PrivateEvent] ([Id]),
    CONSTRAINT [FK_PrivateEventSummary_ItemTags] FOREIGN KEY ([ItemTagId]) REFERENCES [dbo].[ItemTags] ([Id])
);


GO
ALTER TABLE [dbo].[PrivateEventSummary] NOCHECK CONSTRAINT [FK_PrivateEventItem_PrivateEvent];


GO
ALTER TABLE [dbo].[PrivateEventSummary] NOCHECK CONSTRAINT [FK_PrivateEventSummary_ItemTags];


GO

CREATE NONCLUSTERED INDEX [IX_Title_PrivateEventSummary]
    ON [dbo].[PrivateEventSummary]([Title] ASC);


GO
ALTER INDEX [IX_Title_PrivateEventSummary]
    ON [dbo].[PrivateEventSummary] DISABLE;


GO

