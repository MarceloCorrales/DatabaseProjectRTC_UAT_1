CREATE TABLE [dbo].[PasswordTracking] (
    [Id]           INT            NOT NULL,
    [UserId]       NVARCHAR (500) NULL,
    [ModifiedBy]   NVARCHAR (500) NULL,
    [ModifiedDate] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

