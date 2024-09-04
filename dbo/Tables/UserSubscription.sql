CREATE TABLE [dbo].[UserSubscription] (
    [Id]                    INT            IDENTITY (1, 1) NOT NULL,
    [UserId]                NVARCHAR (128) NOT NULL,
    [SubscriptionId]        INT            NOT NULL,
    [LastDayOfSubscription] DATETIME       NOT NULL,
    [IsActive]              BIT            NOT NULL,
    [Remarks]               VARCHAR (100)  NULL,
    [CreatedBy]             VARCHAR (50)   NULL,
    [CreatedDate]           DATETIME       NULL,
    [UpdatedBy]             VARCHAR (50)   NULL,
    [UpdatedDate]           DATETIME       NULL,
    CONSTRAINT [PK_UserSubscription] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_User_Subscription] FOREIGN KEY ([SubscriptionId]) REFERENCES [dbo].[Subscription] ([Id]),
    CONSTRAINT [FK_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id])
);


GO
ALTER TABLE [dbo].[UserSubscription] NOCHECK CONSTRAINT [FK_User_Subscription];


GO
ALTER TABLE [dbo].[UserSubscription] NOCHECK CONSTRAINT [FK_UserId];


GO

