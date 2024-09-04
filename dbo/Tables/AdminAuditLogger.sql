CREATE TABLE [dbo].[AdminAuditLogger] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [Desciption]     VARCHAR (200) NOT NULL,
    [Module]         VARCHAR (50)  NOT NULL,
    [AdditionalInfo] VARCHAR (MAX) NOT NULL,
    [CreatedBy]      VARCHAR (200) NOT NULL,
    [CreatedDate]    DATETIME      NOT NULL,
    CONSTRAINT [PK_AdminAuditLogger] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

