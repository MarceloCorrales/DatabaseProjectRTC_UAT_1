CREATE TABLE [dbo].[WebCastEventMedia] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [WebcastAuctionId]       BIGINT         NOT NULL,
    [CloudId]                VARCHAR (50)   NULL,
    [PublicUrl]              VARCHAR (1000) NULL,
    [IsPrimary]              BIT            NULL,
    [UploadResponse]         VARCHAR (MAX)  NULL,
    [HashChecksum]           VARCHAR (250)  NULL,
    [SortSequence]           INT            NULL,
    [IsInspectionFieldImage] BIT            CONSTRAINT [DF_WebCastEventMedia_IsInspectionFieldImage] DEFAULT ((0)) NULL,
    [IsVideo]                BIT            CONSTRAINT [DF_WebCastEventMedia_IsVideo] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_WebCastEventMedia] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebCastEventMedia_WebCastAuctionEvent] FOREIGN KEY ([WebcastAuctionId]) REFERENCES [dbo].[WebCastAuctionEvent] ([Id])
);


GO
ALTER TABLE [dbo].[WebCastEventMedia] NOCHECK CONSTRAINT [FK_WebCastEventMedia_WebCastAuctionEvent];


GO

