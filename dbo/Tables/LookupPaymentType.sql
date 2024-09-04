CREATE TABLE [dbo].[LookupPaymentType] (
    [Id]            INT          NOT NULL,
    [Name]          VARCHAR (50) NOT NULL,
    [PurchaseLimit] MONEY        NOT NULL,
    CONSTRAINT [PK_LookupPaymentType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

