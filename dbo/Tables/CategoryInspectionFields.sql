CREATE TABLE [dbo].[CategoryInspectionFields] (
    [Id]                BIGINT IDENTITY (1, 1) NOT NULL,
    [CategorySectionId] BIGINT NOT NULL,
    [InspectionFieldId] BIGINT NOT NULL,
    CONSTRAINT [PK_CategoryInspectionFields] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CategoryInspectionFields_CategorySections] FOREIGN KEY ([CategorySectionId]) REFERENCES [dbo].[CategorySections] ([Id]),
    CONSTRAINT [FK_CategoryInspectionFields_InspectionFields] FOREIGN KEY ([InspectionFieldId]) REFERENCES [dbo].[InspectionFields] ([Id]),
    CONSTRAINT [UQ_CategoryInspectionFields] UNIQUE NONCLUSTERED ([CategorySectionId] ASC, [InspectionFieldId] ASC)
);


GO
ALTER TABLE [dbo].[CategoryInspectionFields] NOCHECK CONSTRAINT [FK_CategoryInspectionFields_CategorySections];


GO
ALTER TABLE [dbo].[CategoryInspectionFields] NOCHECK CONSTRAINT [FK_CategoryInspectionFields_InspectionFields];


GO

