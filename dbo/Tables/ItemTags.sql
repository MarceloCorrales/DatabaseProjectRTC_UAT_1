CREATE TABLE [dbo].[ItemTags] (
    [Id]                     INT           IDENTITY (1, 1) NOT NULL,
    [TagTitle]               VARCHAR (MAX) NULL,
    [URL]                    VARCHAR (100) NULL,
    [DisplayDealerAccordion] BIT           NULL,
    [ActiveDate]             DATE          NULL,
    [TerraverseLive]         BIT           NULL,
    [ActiveTime]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

