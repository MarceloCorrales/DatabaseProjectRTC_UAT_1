CREATE TABLE [dbo].[RTVMachinaryFailed] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Link]        NVARCHAR (500) NULL,
    [SiteId]      BIGINT         NULL,
    [ErrorMsg]    VARCHAR (MAX)  NULL,
    [JsonData]    VARCHAR (MAX)  NULL,
    [Datecreated] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

