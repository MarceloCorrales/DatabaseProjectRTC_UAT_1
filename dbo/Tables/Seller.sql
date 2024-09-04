CREATE TABLE [dbo].[Seller] (
    [Id]                      BIGINT         IDENTITY (150000, 1) NOT NULL,
    [Name]                    VARCHAR (50)   NOT NULL,
    [ShowSellerInfo]          BIT            NOT NULL,
    [MobileNumber]            VARCHAR (20)   NULL,
    [ContactName]             VARCHAR (100)  NULL,
    [ContactEmail]            VARCHAR (100)  NULL,
    [ShowFourCornerWatermark] BIT            CONSTRAINT [DF_Seller_ShowFourCornerWatermark] DEFAULT ((0)) NULL,
    [AutoApproveItems]        BIT            CONSTRAINT [DF_Seller_AutoApproveItems] DEFAULT ((0)) NULL,
    [AutomateB2BLoad]         BIT            CONSTRAINT [DF_Seller_AutomateB2BLoad] DEFAULT ((0)) NULL,
    [DateCreated]             DATETIME       NOT NULL,
    [DateUpdated]             DATETIME       NOT NULL,
    [MarketingSites]          VARCHAR (MAX)  NULL,
    [JobProcessed_on]         DATETIME       DEFAULT (getutcdate()) NOT NULL,
    [LastUpdatedBy]           VARCHAR (250)  NULL,
    [Status]                  NVARCHAR (20)  NULL,
    [Notes]                   NVARCHAR (MAX) NULL,
    [SalesOwnerID]            NVARCHAR (50)  NULL,
    [Url-1]                   NVARCHAR (MAX) NULL,
    [Url-2]                   NVARCHAR (MAX) NULL,
    [Url-3]                   NVARCHAR (MAX) NULL,
    [Url-4]                   NVARCHAR (MAX) NULL,
    [Url-5]                   NVARCHAR (MAX) NULL,
    [IsAutomatic]             BIT            NULL,
    [SellerLogoUrl]           NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

