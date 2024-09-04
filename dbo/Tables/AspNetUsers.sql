CREATE TABLE [dbo].[AspNetUsers] (
    [Id]                   NVARCHAR (128) NOT NULL,
    [Email]                NVARCHAR (256) NULL,
    [EmailConfirmed]       BIT            NOT NULL,
    [PasswordHash]         NVARCHAR (MAX) NULL,
    [SecurityStamp]        NVARCHAR (MAX) NULL,
    [PhoneNumber]          NVARCHAR (MAX) NULL,
    [PhoneNumberConfirmed] BIT            NOT NULL,
    [TwoFactorEnabled]     BIT            NOT NULL,
    [LockoutEndDateUtc]    DATETIME       NULL,
    [LockoutEnabled]       BIT            NOT NULL,
    [AccessFailedCount]    INT            NOT NULL,
    [UserName]             NVARCHAR (256) NOT NULL,
    [FirstName]            VARCHAR (100)  NULL,
    [LastName]             VARCHAR (100)  NULL,
    [UtmSource]            VARCHAR (100)  NULL,
    [UserNote]             VARCHAR (MAX)  NULL,
    [DateCreated]          DATETIME       NULL,
    [DateUpdated]          DATETIME       NULL,
    [LastLoginDateTime]    DATETIME       NULL,
    [IsDeleted]            BIT            NULL,
    [DeletedDateTime]      DATETIME       NULL,
    [DeletedBy]            NVARCHAR (255) NULL,
    CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_AspNetUsers_UserName]
    ON [dbo].[AspNetUsers]([UserName] ASC);


GO
ALTER INDEX [IX_AspNetUsers_UserName]
    ON [dbo].[AspNetUsers] DISABLE;


GO

