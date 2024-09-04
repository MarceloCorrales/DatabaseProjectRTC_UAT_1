CREATE TABLE [dbo].[ClientCertifiedAppraisal] (
    [Id]                      BIGINT        IDENTITY (1, 1) NOT NULL,
    [ClientUsersId]           BIGINT        NOT NULL,
    [CertifiedAppraisalModel] VARCHAR (MAX) NULL,
    [LastUpdated]             DATETIME      NOT NULL,
    [DateCreated]             DATETIME      NOT NULL,
    CONSTRAINT [PK_ClientCertifiedAppraisal] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ClientCertifiedAppraisal_ClientUsers] FOREIGN KEY ([ClientUsersId]) REFERENCES [dbo].[ClientUsers] ([Id])
);


GO
ALTER TABLE [dbo].[ClientCertifiedAppraisal] NOCHECK CONSTRAINT [FK_ClientCertifiedAppraisal_ClientUsers];


GO

