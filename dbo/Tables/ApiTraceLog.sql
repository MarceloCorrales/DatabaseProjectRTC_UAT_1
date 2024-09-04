CREATE TABLE [dbo].[ApiTraceLog] (
    [Id]                  BIGINT         IDENTITY (1, 1) NOT NULL,
    [Application]         VARCHAR (50)   NOT NULL,
    [Machine]             VARCHAR (50)   NULL,
    [RequestContentBody]  VARCHAR (MAX)  NULL,
    [RequestContentType]  VARCHAR (250)  NULL,
    [RequestHeaders]      VARCHAR (MAX)  NULL,
    [RequestIPAddress]    VARCHAR (50)   NULL,
    [RequestMethod]       VARCHAR (20)   NULL,
    [RequestRouteData]    VARCHAR (250)  NULL,
    [RequestTimeStamp]    DATETIME       NULL,
    [RequestUri]          VARCHAR (250)  NULL,
    [ResponseContentBody] VARCHAR (MAX)  NULL,
    [ResponseHeaders]     VARCHAR (MAX)  NULL,
    [ResponseStatusCode]  SMALLINT       NULL,
    [ResponseTimeStamp]   DATETIME       NULL,
    [AppUser]             VARCHAR (100)  NULL,
    [UserAgent]           VARCHAR (1000) NULL,
    [Duration]            INT            NULL,
    CONSTRAINT [PK_ApiTraceLog] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

