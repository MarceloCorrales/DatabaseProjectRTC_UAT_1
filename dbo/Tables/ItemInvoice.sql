CREATE TABLE [dbo].[ItemInvoice] (
    [Id]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [ItemId]          BIGINT          NOT NULL,
    [InvoiceNumber]   VARCHAR (20)    NULL,
    [InvoiceTotal]    MONEY           NULL,
    [SalesTaxPercent] DECIMAL (10, 4) NULL,
    [InvoiceDate]     DATETIME        NULL,
    [ItemBidId]       BIGINT          NULL,
    [InvoicePdf]      VARBINARY (MAX) NULL,
    CONSTRAINT [PK_ItemInvoice] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ItemInvoice_Item] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id])
);


GO
ALTER TABLE [dbo].[ItemInvoice] NOCHECK CONSTRAINT [FK_ItemInvoice_Item];


GO

