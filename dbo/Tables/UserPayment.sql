CREATE TABLE [dbo].[UserPayment] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [Type]                INT            NOT NULL,
    [UserId]              NVARCHAR (128) NOT NULL,
    [MaskedAccountNumber] VARCHAR (20)   NULL,
    [AccountExpiration]   VARCHAR (10)   NULL,
    [ReferenceId]         VARCHAR (30)   NULL,
    [ValidationResponse]  VARCHAR (250)  NULL,
    [PaymentProfileId]    VARCHAR (30)   NULL,
    [IsDefault]           BIT            NOT NULL,
    [IsDeleted]           BIT            NOT NULL,
    [DateCreated]         DATETIME       NOT NULL,
    [DateUpdated]         DATETIME       NOT NULL,
    CONSTRAINT [PK_UserPayment] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserPayment_AspNetUsers] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_UserPayment_LookupPaymentType] FOREIGN KEY ([Type]) REFERENCES [dbo].[LookupPaymentType] ([Id])
);


GO
ALTER TABLE [dbo].[UserPayment] NOCHECK CONSTRAINT [FK_UserPayment_AspNetUsers];


GO
ALTER TABLE [dbo].[UserPayment] NOCHECK CONSTRAINT [FK_UserPayment_LookupPaymentType];


GO

CREATE NONCLUSTERED INDEX [IX_UserId_UserPayment]
    ON [dbo].[UserPayment]([UserId] ASC);


GO
ALTER INDEX [IX_UserId_UserPayment]
    ON [dbo].[UserPayment] DISABLE;


GO

