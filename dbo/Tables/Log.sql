CREATE TABLE [dbo].[Log] (
    [Make]                VARCHAR (100) NULL,
    [Model]               VARCHAR (50)  NULL,
    [CategoryId]          INT           NULL,
    [SubCategoryId]       INT           NULL,
    [YearMake]            INT           NULL,
    [DaysFrom]            INT           NULL,
    [DaysTo]              INT           NULL,
    [MilesFrom]           INT           NULL,
    [MilesTo]             INT           NULL,
    [SelectedIds]         VARCHAR (MAX) NULL,
    [InsertDate]          SMALLDATETIME DEFAULT (getdate()) NULL,
    [SiteCategoryName]    VARCHAR (100) NULL,
    [SiteSubCategoryName] VARCHAR (100) NULL,
    [MilesHoursAdjusted]  INT           NULL
);


GO

