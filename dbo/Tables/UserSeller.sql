CREATE TABLE [dbo].[UserSeller] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [UserId]    NVARCHAR (128) NOT NULL,
    [SellerId]  BIGINT         NOT NULL,
    [isDeleted] BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_UserSeller] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserSeller_AspNetUsers] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_UserSeller_Seller] FOREIGN KEY ([SellerId]) REFERENCES [dbo].[Seller] ([Id])
);


GO
ALTER TABLE [dbo].[UserSeller] NOCHECK CONSTRAINT [FK_UserSeller_AspNetUsers];


GO
ALTER TABLE [dbo].[UserSeller] NOCHECK CONSTRAINT [FK_UserSeller_Seller];


GO

