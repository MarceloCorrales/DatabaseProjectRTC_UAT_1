CREATE TABLE [dbo].[InspectionFieldDetail] (
    [Id]                BIGINT        IDENTITY (1, 1) NOT NULL,
    [InspectionFieldId] BIGINT        NOT NULL,
    [FieldName]         VARCHAR (50)  NULL,
    [DisplayName]       VARCHAR (100) NULL,
    [FieldType]         VARCHAR (20)  NULL,
    [DataValues]        VARCHAR (MAX) NULL,
    [SortOrder]         INT           NULL,
    CONSTRAINT [PK_InspectionFieldDetail] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_InspectionFieldDetail_InspectionFields] FOREIGN KEY ([InspectionFieldId]) REFERENCES [dbo].[InspectionFields] ([Id])
);


GO
ALTER TABLE [dbo].[InspectionFieldDetail] NOCHECK CONSTRAINT [FK_InspectionFieldDetail_InspectionFields];


GO

