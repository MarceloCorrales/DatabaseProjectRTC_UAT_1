CREATE TABLE [dbo].[ItemTagsXref] (
    [Id]     INT    IDENTITY (1, 1) NOT NULL,
    [TagId]  INT    NULL,
    [ItemId] BIGINT NULL,
    CONSTRAINT [PK__ItemTags__3214EC27BB5A58AB] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ItemTagsXref_ItemTags] FOREIGN KEY ([TagId]) REFERENCES [dbo].[ItemTags] ([Id]),
    CONSTRAINT [FK_ItemTagsXref_ItemTagsXref] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([Id])
);


GO
ALTER TABLE [dbo].[ItemTagsXref] NOCHECK CONSTRAINT [FK_ItemTagsXref_ItemTags];


GO
ALTER TABLE [dbo].[ItemTagsXref] NOCHECK CONSTRAINT [FK_ItemTagsXref_ItemTagsXref];


GO

