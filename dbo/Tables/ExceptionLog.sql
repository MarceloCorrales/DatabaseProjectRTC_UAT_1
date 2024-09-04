CREATE TABLE [dbo].[ExceptionLog] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [ExceptionOn] DATETIME       NULL,
    [StackTrace]  NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

