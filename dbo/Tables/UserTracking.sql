CREATE TABLE [dbo].[UserTracking] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [IPAddress]        VARCHAR (20)   NULL,
    [AspNetUsersId]    NVARCHAR (128) NULL,
    [Referrer]         VARCHAR (200)  NULL,
    [URL]              VARCHAR (200)  NULL,
    [ItemId]           BIGINT         NULL,
    [ItemName]         VARCHAR (250)  NULL,
    [Model]            VARCHAR (250)  NULL,
    [CategoryId]       INT            NULL,
    [SubCategoryId]    INT            NULL,
    [ManufacturerId]   BIGINT         NULL,
    [ManufacturerName] VARCHAR (250)  NULL,
    [DateCreated]      DATETIME       NOT NULL,
    CONSTRAINT [PK_UserMetrics] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserMetrics_AspNetUsers] FOREIGN KEY ([AspNetUsersId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_UserMetrics_Category] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([Id]),
    CONSTRAINT [FK_UserMetrics_Item] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id]),
    CONSTRAINT [FK_UserMetrics_Manufacturer] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[Manufacturer] ([Id]),
    CONSTRAINT [FK_UserMetrics_SubCategory] FOREIGN KEY ([SubCategoryId]) REFERENCES [dbo].[SubCategory] ([Id])
);


GO
ALTER TABLE [dbo].[UserTracking] NOCHECK CONSTRAINT [FK_UserMetrics_AspNetUsers];


GO
ALTER TABLE [dbo].[UserTracking] NOCHECK CONSTRAINT [FK_UserMetrics_Category];


GO
ALTER TABLE [dbo].[UserTracking] NOCHECK CONSTRAINT [FK_UserMetrics_Item];


GO
ALTER TABLE [dbo].[UserTracking] NOCHECK CONSTRAINT [FK_UserMetrics_Manufacturer];


GO
ALTER TABLE [dbo].[UserTracking] NOCHECK CONSTRAINT [FK_UserMetrics_SubCategory];


GO

