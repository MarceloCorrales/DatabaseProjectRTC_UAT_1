CREATE TABLE [dbo].[Inspector] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [EmailAddress] NVARCHAR (256) NOT NULL,
    [IsEnabled]    BIT            NOT NULL,
    [DateCreated]  DATETIME       NOT NULL,
    CONSTRAINT [PK_Inspector] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

