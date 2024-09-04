CREATE TABLE [dbo].[SubscriptionPermission] (
    [SubscriptionId] INT          NOT NULL,
    [PermissionId]   INT          NOT NULL,
    [CreatedBy]      VARCHAR (50) NULL,
    [CreatedDate]    DATETIME     NULL,
    CONSTRAINT [PK_SubscriptionPermission] PRIMARY KEY CLUSTERED ([SubscriptionId] ASC, [PermissionId] ASC),
    CONSTRAINT [FK_PermissionId] FOREIGN KEY ([PermissionId]) REFERENCES [dbo].[Permission] ([Id]),
    CONSTRAINT [FK_SubscriptionId] FOREIGN KEY ([SubscriptionId]) REFERENCES [dbo].[Subscription] ([Id])
);


GO
ALTER TABLE [dbo].[SubscriptionPermission] NOCHECK CONSTRAINT [FK_PermissionId];


GO
ALTER TABLE [dbo].[SubscriptionPermission] NOCHECK CONSTRAINT [FK_SubscriptionId];


GO

