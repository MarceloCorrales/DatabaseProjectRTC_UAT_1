CREATE TABLE [dbo].[CategorySections] (
    [Id]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [CategoryId]  INT          NOT NULL,
    [SectionName] VARCHAR (50) NOT NULL,
    [CreateDate]  DATETIME     NULL,
    [LastUpdated] DATETIME     NULL,
    [UpdatedBy]   VARCHAR (50) NULL,
    CONSTRAINT [PK_CategorySections] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CategorySections_InspectionCategory] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[EquipmentCategory_V2] ([Id])
);


GO
ALTER TABLE [dbo].[CategorySections] NOCHECK CONSTRAINT [FK_CategorySections_InspectionCategory];


GO

