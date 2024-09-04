CREATE TABLE [HangFire].[State] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [JobId]     INT            NOT NULL,
    [Name]      NVARCHAR (20)  NOT NULL,
    [Reason]    NVARCHAR (100) NULL,
    [CreatedAt] DATETIME       NOT NULL,
    [Data]      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY ([JobId]) REFERENCES [HangFire].[Job] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
ALTER TABLE [HangFire].[State] NOCHECK CONSTRAINT [FK_HangFire_State_Job];


GO

CREATE NONCLUSTERED INDEX [IX_HangFire_State_JobId]
    ON [HangFire].[State]([JobId] ASC);


GO
ALTER INDEX [IX_HangFire_State_JobId]
    ON [HangFire].[State] DISABLE;


GO

