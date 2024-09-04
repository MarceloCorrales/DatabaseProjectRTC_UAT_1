CREATE TABLE [dbo].[TempDataForCategorySectionAndInspectionFields] (
    [CategorySections]            NVARCHAR (MAX) NULL,
    [InspectionFieldsDisplayName] NVARCHAR (MAX) NULL,
    [InspectionFieldsFieldName]   NVARCHAR (MAX) NULL,
    [FieldType]                   NVARCHAR (MAX) NULL,
    [Id]                          INT            IDENTITY (1, 1) NOT NULL,
    [FromTrailers]                BIT            NOT NULL,
    [FromTrucks]                  BIT            NOT NULL,
    CONSTRAINT [PK_TempDataForCategorySectionAndInspectionFields] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

