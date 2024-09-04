CREATE TABLE [dbo].[AdversitementTransaction] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [TransId]         VARCHAR (100)  NULL,
    [CardNumber]      VARCHAR (30)   NULL,
    [CardType]        VARCHAR (20)   NULL,
    [NetworkTransId]  VARCHAR (100)  NULL,
    [ExpDate]         VARCHAR (10)   NULL,
    [CustomerId]      INT            NULL,
    [Error]           NVARCHAR (MAX) NULL,
    [ResponseMessage] VARCHAR (500)  NULL,
    [ResponseCode]    VARCHAR (10)   NULL,
    [Createddate]     DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

