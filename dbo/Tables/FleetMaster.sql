CREATE TABLE [dbo].[FleetMaster] (
    [Manufactor]        VARCHAR (250)  NOT NULL,
    [Categroy]          VARCHAR (250)  NOT NULL,
    [ParentModel]       VARCHAR (250)  NOT NULL,
    [Model]             VARCHAR (250)  NULL,
    [CountNumber]       INT            NULL,
    [Rconfidence]       DECIMAL (5, 4) NULL,
    [MinYear]           INT            NULL,
    [MaxYear]           INT            NULL,
    [AvgYear]           INT            NULL,
    [MinHours]          INT            NULL,
    [MaxHours]          INT            NULL,
    [AvgHours]          INT            NULL,
    [MinSalePrice]      MONEY          NULL,
    [MaxSalePrice]      MONEY          NULL,
    [AvgSalePrice]      MONEY          NULL,
    [MinSaleDate]       DATETIME       NULL,
    [MaxSaleDate]       DATETIME       NULL,
    [PredictiveModelId] SMALLINT       NULL
);


GO

