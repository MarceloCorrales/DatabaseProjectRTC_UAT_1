CREATE TABLE [dbo].[Permission] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (200) NOT NULL,
    [Module]        VARCHAR (50)  NOT NULL,
    [PermissionKey] VARCHAR (200) NOT NULL,
    [CreatedBy]     VARCHAR (200) NOT NULL,
    [CreatedDate]   DATETIME      NOT NULL,
    [UpdatedBy]     VARCHAR (200) NULL,
    [UpdatedDate]   DATETIME      NULL,
    CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

