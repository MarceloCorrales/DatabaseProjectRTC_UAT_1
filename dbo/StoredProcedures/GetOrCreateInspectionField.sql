CREATE PROCEDURE dbo.GetOrCreateInspectionField
    @FieldName NVARCHAR(100),
    @DisplayName NVARCHAR(100),
    @FieldType NVARCHAR(50),
    @ShowImage BIT,
    @ShowDetail BIT,
    @InspectionFieldID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT @InspectionFieldID = Id 
    FROM InspectionFields 
    WHERE FieldName = @FieldName;

    IF @InspectionFieldID IS NULL
    BEGIN
        INSERT INTO InspectionFields (FieldName, DisplayName, FieldType, ShowImage, ShowDetail) 
        VALUES (@FieldName, @DisplayName, @FieldType, @ShowImage, @ShowDetail);

        SET @InspectionFieldID = SCOPE_IDENTITY();
    END
END;

GO

