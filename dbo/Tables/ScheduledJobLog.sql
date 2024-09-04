CREATE TABLE [dbo].[ScheduledJobLog] (
    [Id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [JobName]         VARCHAR (50)  NOT NULL,
    [Message]         VARCHAR (MAX) NULL,
    [NumberErrors]    INT           NULL,
    [NumberProcessed] INT           NULL,
    [JobResult]       VARCHAR (200) NULL,
    [DateCreated]     DATETIME      NOT NULL,
    CONSTRAINT [PK_ScheduledJobLog] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

