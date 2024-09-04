CREATE TABLE [dbo].[MasterInspection_BKP_12_10] (
    [Id]                  BIGINT            IDENTITY (1000, 1) NOT NULL,
    [AspNetUsersId]       NVARCHAR (128)    NOT NULL,
    [CategoryId]          INT               NOT NULL,
    [SubCategoryId]       INT               NULL,
    [Year]                INT               NOT NULL,
    [ManufacturerId]      INT               NOT NULL,
    [Model]               VARCHAR (50)      NULL,
    [Name]                VARCHAR (100)     NULL,
    [HoursOrMileage]      INT               NULL,
    [SerialNumberOrVin]   VARCHAR (50)      NOT NULL,
    [StockNumber]         VARCHAR (50)      NOT NULL,
    [ContractVersion]     VARCHAR (5)       NOT NULL,
    [AssignedInspectorId] NVARCHAR (128)    NULL,
    [InspectionStatusId]  INT               NOT NULL,
    [LocationLatLong]     [sys].[geography] NULL,
    [StartedDateTime]     DATETIME          NULL,
    [DateUpdated]         DATETIME          NULL,
    [CompletedDateTime]   DATETIME          NULL,
    [PrevInspectionId]    BIGINT            NULL,
    [City]                VARCHAR (80)      NULL,
    [State]               VARCHAR (10)      NULL,
    [Miles]               INT               NULL,
    [Vin]                 VARCHAR (50)      NULL,
    [AskingPrice]         DECIMAL (18, 2)   NULL,
    [ModelId]             INT               NULL
);


GO

