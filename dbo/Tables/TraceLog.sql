CREATE TABLE [dbo].[TraceLog] (
    [Id]                       BIGINT        IDENTITY (1, 1) NOT NULL,
    [TraceDateTime]            DATETIME      NULL,
    [TraceCategory]            VARCHAR (50)  NULL,
    [TraceDescription]         VARCHAR (MAX) NULL,
    [StackTrace]               VARCHAR (MAX) NULL,
    [DetailedErrorDescription] VARCHAR (MAX) NULL,
    [Machine]                  VARCHAR (100) NULL,
    CONSTRAINT [PK_TraceLog] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

