CREATE TABLE [dbo].[Subscription] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (50)  NOT NULL,
    [Description]  VARCHAR (200) NULL,
    [Type]         VARCHAR (50)  NOT NULL,
    [IsPublic]     BIT           NOT NULL,
    [ValidityDays] INT           NOT NULL,
    [IsArchived]   BIT           NOT NULL,
    [CreatedBy]    VARCHAR (50)  NOT NULL,
    [CreatedDate]  DATETIME      NULL,
    [UpdatedBy]    VARCHAR (50)  NULL,
    [UpdatedDate]  DATETIME      NULL,
    CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

