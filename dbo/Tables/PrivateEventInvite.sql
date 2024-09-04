CREATE TABLE [dbo].[PrivateEventInvite] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [PrivateEventId]   BIGINT         NOT NULL,
    [Email]            NVARCHAR (256) NOT NULL,
    [EmailCount]       INT            NOT NULL,
    [LastEmailSent]    DATETIME       NOT NULL,
    [InviteKey]        VARCHAR (50)   NULL,
    [Acknowledged]     BIT            NOT NULL,
    [AcceptDateTime]   DATETIME       NULL,
    [ApprovedDateTime] DATETIME       NULL,
    [DateCreated]      DATETIME       NOT NULL,
    [DateUpdated]      DATETIME       NOT NULL,
    [LastUpdatedBy]    VARCHAR (250)  NOT NULL,
    CONSTRAINT [PK_PrivateEventInvite] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PrivateEventInvite_PrivateEventInvite] FOREIGN KEY ([PrivateEventId]) REFERENCES [dbo].[PrivateEvent] ([Id])
);


GO
ALTER TABLE [dbo].[PrivateEventInvite] NOCHECK CONSTRAINT [FK_PrivateEventInvite_PrivateEventInvite];


GO

