CREATE TABLE [dbo].[ScrapMaster] (
    [Id]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileName]    NVARCHAR (300) NULL,
    [SellerId]    BIGINT         NULL,
    [CreatedDate] DATETIME       NULL,
    [TotalRecord] INT            NULL,
    [Processed]   INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

