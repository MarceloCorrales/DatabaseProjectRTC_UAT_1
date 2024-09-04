CREATE TABLE [dbo].[InspectionFields] (
    [Id]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [FieldName]   VARCHAR (50)  NOT NULL,
    [DisplayName] VARCHAR (100) NULL,
    [FieldType]   VARCHAR (20)  NULL,
    [ShowImage]   BIT           CONSTRAINT [DF_InspectionFields_ShowImage] DEFAULT ((1)) NOT NULL,
    [ShowDetail]  BIT           CONSTRAINT [DF_InspectionFields_ShowDetail] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_InspectionFields] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_InspectionFields] UNIQUE NONCLUSTERED ([FieldName] ASC, [DisplayName] ASC, [FieldType] ASC)
);


GO

