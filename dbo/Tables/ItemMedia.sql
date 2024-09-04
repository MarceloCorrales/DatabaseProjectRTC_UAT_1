CREATE TABLE [dbo].[ItemMedia] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemId]                 BIGINT         NOT NULL,
    [CloudId]                VARCHAR (50)   NULL,
    [PublicUrl]              VARCHAR (1000) NULL,
    [IsPrimary]              BIT            NULL,
    [UploadResponse]         VARCHAR (MAX)  NULL,
    [HashChecksum]           VARCHAR (250)  NULL,
    [SortSequence]           INT            NULL,
    [IsInspectionFieldImage] BIT            CONSTRAINT [DF_ItemMedia_IsInspectionFieldImage] DEFAULT ((0)) NULL,
    [IsVideo]                BIT            CONSTRAINT [DF_ItemMedia_IsVideo] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ItemMedia] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ItemMedia_Item] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id])
);


GO
ALTER TABLE [dbo].[ItemMedia] NOCHECK CONSTRAINT [FK_ItemMedia_Item];


GO

CREATE NONCLUSTERED INDEX [IX_ItemMedia_ItemId-IsVideo]
    ON [dbo].[ItemMedia]([ItemId] ASC, [IsVideo] ASC);


GO
ALTER INDEX [IX_ItemMedia_ItemId-IsVideo]
    ON [dbo].[ItemMedia] DISABLE;


GO

CREATE NONCLUSTERED INDEX [IX_ItemMedia_ItemId]
    ON [dbo].[ItemMedia]([ItemId] ASC);


GO
ALTER INDEX [IX_ItemMedia_ItemId]
    ON [dbo].[ItemMedia] DISABLE;


GO

CREATE NONCLUSTERED INDEX [nci_wi_ItemMedia_D433C3B9D93BF27F10B50A965A41DC99]
    ON [dbo].[ItemMedia]([IsPrimary] ASC)
    INCLUDE([CloudId], [ItemId], [PublicUrl]);


GO
ALTER INDEX [nci_wi_ItemMedia_D433C3B9D93BF27F10B50A965A41DC99]
    ON [dbo].[ItemMedia] DISABLE;


GO

CREATE NONCLUSTERED INDEX [IX_ItemMedia_ItemId-IsPrimary]
    ON [dbo].[ItemMedia]([ItemId] ASC, [IsPrimary] ASC);


GO
ALTER INDEX [IX_ItemMedia_ItemId-IsPrimary]
    ON [dbo].[ItemMedia] DISABLE;


GO

