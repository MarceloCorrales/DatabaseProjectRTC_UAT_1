CREATE TABLE [dbo].[UserLocation] (
    [Id]          BIGINT            IDENTITY (1, 1) NOT NULL,
    [UserId]      NVARCHAR (128)    NOT NULL,
    [Name]        VARCHAR (100)     NOT NULL,
    [LatLong]     [sys].[geography] NULL,
    [Address]     VARCHAR (200)     NULL,
    [City]        VARCHAR (100)     NULL,
    [State]       VARCHAR (100)     NULL,
    [Country]     VARCHAR (100)     NULL,
    [PostalCode]  VARCHAR (20)      NULL,
    [IsDefault]   BIT               NOT NULL,
    [IsDeleted]   BIT               NOT NULL,
    [DateUpdated] DATETIME          NULL,
    CONSTRAINT [PK_UserLocation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserLocation_AspNetUsers] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id])
);


GO
ALTER TABLE [dbo].[UserLocation] NOCHECK CONSTRAINT [FK_UserLocation_AspNetUsers];


GO

