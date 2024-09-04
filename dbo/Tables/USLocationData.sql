CREATE TABLE [dbo].[USLocationData] (
    [Zipcode]     INT            NOT NULL,
    [Latitude]    DECIMAL (9, 6) NULL,
    [Longitude]   DECIMAL (9, 6) NULL,
    [City]        VARCHAR (100)  NULL,
    [State]       VARCHAR (50)   NULL,
    [County]      VARCHAR (100)  NULL,
    [DateUpdated] DATETIME       NOT NULL,
    CONSTRAINT [PK_USLocationData] PRIMARY KEY CLUSTERED ([Zipcode] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_USLocationData_CityState]
    ON [dbo].[USLocationData]([City] ASC, [State] ASC);


GO
ALTER INDEX [IX_USLocationData_CityState]
    ON [dbo].[USLocationData] DISABLE;


GO

