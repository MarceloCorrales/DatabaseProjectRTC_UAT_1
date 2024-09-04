CREATE TABLE [dbo].[InspectionSubCategory] (
    [Id]            INT           NOT NULL,
    [CategoryId]    INT           NOT NULL,
    [Name]          VARCHAR (250) NOT NULL,
    [ShowHours]     BIT           CONSTRAINT [DF_SubCategory_ShowHours] DEFAULT ((0)) NOT NULL,
    [ShowMiles]     BIT           CONSTRAINT [DF_SubCategory_ShowMiles] DEFAULT ((0)) NOT NULL,
    [ShowVIN]       BIT           CONSTRAINT [DF_SubCategory_ShowVIN] DEFAULT ((0)) NOT NULL,
    [ShowSerialNum] BIT           CONSTRAINT [DF_SubCategory_ShowSerialNum] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_InspectionSubCategory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SubCategory_InspectionCategory] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[InspectionCategory] ([Id])
);


GO
ALTER TABLE [dbo].[InspectionSubCategory] NOCHECK CONSTRAINT [FK_SubCategory_InspectionCategory];


GO

