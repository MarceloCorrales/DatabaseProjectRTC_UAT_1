CREATE TABLE [dbo].[InspectionDetail] (
    [Id]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [InspectionId] BIGINT        NOT NULL,
    [ReportData]   VARCHAR (MAX) NULL,
    CONSTRAINT [PK_InspectionDetail] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_InspectionDetail_Inspection] FOREIGN KEY ([InspectionId]) REFERENCES [dbo].[Inspection] ([Id])
);


GO
ALTER TABLE [dbo].[InspectionDetail] NOCHECK CONSTRAINT [FK_InspectionDetail_Inspection];


GO

