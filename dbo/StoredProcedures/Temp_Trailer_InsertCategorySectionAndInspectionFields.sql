CREATE   PROCEDURE Temp_Trailer_InsertCategorySectionAndInspectionFields
    @CategoryID INT,
    @SectionName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewCategorySectionID INT;

    INSERT INTO CategorySections (CategoryID, SectionName, CreateDate, LastUpdated, UpdatedBy)
    VALUES (@CategoryID, @SectionName, GETDATE(), GETDATE(), 'Test SP');
    
    SET @NewCategorySectionID = SCOPE_IDENTITY();

    DELETE FROM CategoryInspectionFields WHERE CategorySectionId = @NewCategorySectionID;

    DECLARE @FieldName NVARCHAR(100);
    DECLARE @DisplayName NVARCHAR(100);
    DECLARE @FieldType NVARCHAR(50);
    DECLARE @ShowImage BIT;
    DECLARE @ShowDetail BIT;
    DECLARE @InspectionFieldID INT;

    DECLARE @FieldList TABLE (FieldName NVARCHAR(100), DisplayName NVARCHAR(100), FieldType NVARCHAR(50), ShowImage BIT, ShowDetail BIT);

    IF @SectionName = 'General Information'
    BEGIN
		INSERT INTO @FieldList VALUES 
			('color', 'Color', 'TEXT', 1, 1),
			('gvwr', 'GVWR', 'TEXT', 1, 1),
			('odometer', 'Odometer', 'TEXT', 1, 1),
			('numberOfAxles', 'Number of Axles', 'TEXT', 1, 1),
			('length', 'Length', 'TEXT', 1, 1),
			('bodyType', 'Body Type', 'TEXT', 1, 1),
			('axleConfiguration', 'Axle Configuration', 'TEXT', 1, 1),
			('annualInspectionDate', 'Annual Inspection Date', 'TEXT', 1, 1);

    END
    ELSE IF @SectionName = 'Frame/ ICC/ Floor/ Walls'
    BEGIN
        INSERT INTO @FieldList VALUES 
			('frame', 'Frame', 'TEXT', 1, 1),
			('iccBumper', 'ICC Bumper', 'TEXT', 1, 1),
			('floor', 'Floor', 'TEXT', 1, 1),
			('walls', 'Walls', 'TEXT', 1, 1),
			('windSkirts', 'Wind Skirts', 'TEXT', 1, 1),
			('skuffPlates', 'Skuff Plates', 'TEXT', 1, 1),
			('loadSecurement', 'Load Securement', 'TEXT', 1, 1),
			('reinforcementRails', 'Reinforcement Rails', 'TEXT', 1, 1);
    END
	ELSE IF @SectionName = 'Tires/ Wheels/ Brake'
    BEGIN
		INSERT INTO @FieldList VALUES 
			('tireSize', 'Tire Size', 'TEXT', 1, 1),
			('wheels', 'Wheels', 'TEXT', 1, 1),
			('psiSystem', 'PSI System', 'TEXT', 1, 1),
			('brakeSystemABS', 'Brake System / ABS', 'TEXT', 1, 1);
    END
	ELSE IF @SectionName = 'Axles & Suspension'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('gawrFront', 'GAWR Front', 'TEXT', 1, 1),
			('suspensionFront', 'Suspension Front', 'TEXT', 1, 1),
			('gawrRear', 'GAWR Rear', 'TEXT', 1, 1),
			('suspensionRear', 'Suspension Rear', 'TEXT', 1, 1),
			('suspensionMake', 'Suspension Make', 'TEXT', 1, 1),
			('axleConfiguration', 'Axle Configuration', 'TEXT', 1, 1),
			('adjustableAxle', 'Adjustable Axle', 'BOOLEAN', 1, 1);
	END
	ELSE IF @SectionName = 'Exterior'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('dryBox', 'Dry Box', 'BOOLEAN', 1, 1),
			('tank', 'Tank', 'BOOLEAN', 1, 1),
			('flatBed', 'Flat Bed', 'BOOLEAN', 1, 1),
			('refrigerated', 'Refrigerated', 'BOOLEAN', 1, 1);
	END
	ELSE IF @SectionName = 'Deck Material'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('steel', 'Steel', 'BOOLEAN', 1, 1),
			('aluminum', 'Aluminum', 'BOOLEAN', 1, 1),
			('wood', 'Wood', 'BOOLEAN', 1, 1),
			('otherDeckMaterial', 'Other', 'BOOLEAN', 1, 1);
	END
	ELSE IF @SectionName = 'Deck Condition'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('goodDeckCondition', 'Good', 'BOOLEAN', 1, 1),
			('fairDeckCondition', 'Fair', 'BOOLEAN', 1, 1),
			('poorDeckCondition', 'Poor', 'BOOLEAN', 1, 1),
			('excessiveWearDeckCondition', 'Excessive Wear', 'BOOLEAN', 1, 1),
			('damagedDeckCondition', 'Damaged', 'BOOLEAN', 1, 1);
	END
	ELSE IF @SectionName = 'Deck Type'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('propDeck', 'Prop Deck', 'BOOLEAN', 1, 1),
			('carHauler', 'Car hauler', 'BOOLEAN', 1, 1),
			('lowBoy', 'Low Boy', 'BOOLEAN', 1, 1),
			('otherDeckType', 'Other', 'BOOLEAN', 1, 1);
	END
	ELSE IF @SectionName = 'Reefer Equipment'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('operationalVideo', 'Operational Video', 'TEXT', 1, 1),
			('startsAndRuns', 'Starts & Runs', 'BOOLEAN', 1, 1),
			('hours', 'Hours', 'BOOLEAN', 1, 1),
			('blowsCold', 'Blows Cold', 'BOOLEAN', 1, 1);
	END
	ELSE IF @SectionName = 'Additional Info / Accessories'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('hydraulicSystem', 'Hydraulic System', 'BOOLEAN', 1, 1),
			('gpsSystem', 'GPS System', 'BOOLEAN', 1, 1),
			('airBlowGun', 'Air Blow Gun', 'BOOLEAN', 1, 1),
			('otherAccessories', 'Other', 'BOOLEAN', 1, 1);
	END
	ELSE IF @SectionName = 'Under Carriage'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('suspensionSpringsUc', 'Suspension Springs / Hangers', 'TEXT', 1, 1),
			('suspensionBushingsUc', 'Suspension Bushings', 'TEXT', 1, 1),
			('suspensionAirBagsUc', 'Suspension Air Bags', 'TEXT', 1, 1),
			('wheelTypeUc', 'Wheel Type', 'TEXT', 1, 1),
			('wheelConditionUc', 'Wheel Condition', 'TEXT', 1, 1),
			('wheelStudsUc', 'Wheel Studs', 'TEXT', 1, 1),
			('parkBrakeUc', 'Park Brake', 'TEXT', 1, 1),
			('limitedBrakeFunctionCheckUc', 'Limited Brake Function Check', 'BOOLEAN', 1, 1);
	END
	ELSE IF @SectionName = 'Brakes'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('left1Axle', 'Left #1 Axle', 'TEXT', 1, 1),
			('left2Axle', 'Left #2 Axle', 'TEXT', 1, 1),
			('right1Axle', 'Right #1 Axle', 'TEXT', 1, 1),
			('right2Axle', 'Right #2 Axle', 'TEXT', 1, 1);
	END
	ELSE IF @SectionName = 'Additional Brake Information'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('additionalBrakeInformation', 'Additional Brake Information', 'TEXT', 1, 1);

	END
	ELSE IF @SectionName = 'Tires & Wheels'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('left1OuterWheels', 'Left #1 Outer Wheels', 'TEXT', 1, 1),
			('left1InnerWheels', 'Left #1 Inner Wheels', 'TEXT', 1, 1),
			('left2OuterWheels', 'Left #2 Outer Wheels', 'TEXT', 1, 1),
			('left2InnerWheels', 'Left #2 Inner Wheels', 'TEXT', 1, 1),
			('right1OuterWheels', 'Right #1 Outer Wheels', 'TEXT', 1, 1),
			('right1InnerWheels', 'Right #1 Inner Wheels', 'TEXT', 1, 1),
			('right2OuterWheels', 'Right #2 Outer Wheels', 'TEXT', 1, 1),
			('right2InnerWheels', 'Right #2 Inner Wheels', 'TEXT', 1, 1);
	END
	ELSE IF @SectionName = 'Additional Tire & Wheel Information'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('additionalTireWheelInformation', 'Additional Tire & Wheel Information', 'TEXT', 1, 1);
	END
	ELSE IF @SectionName = 'Lighting and Electrical Information'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('electricalSystem', 'Electrical System', 'TEXT', 1, 1),
			('numberOfBatteries', 'How Many Batteries', 'TEXT', 1, 1),
			('batteryTesting', 'Battery Testing', 'TEXT', 1, 1),
			('batteryCharging', 'Battery Charging', 'TEXT', 1, 1),
			('dotLightingRequirementsMet', 'DOT Lighting Requirements Met?', 'BOOLEAN', 1, 1),
			('retroReflectiveRequirementsMet', 'Retro-Reflective Requirements Met?', 'BOOLEAN', 1, 1),
			('electricalNotes', 'Notes', 'TEXT', 1, 1);
	END
	ELSE IF @SectionName = 'Reefer Engine Inspection'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('engineOilCheck', 'Engine Oil Check?', 'BOOLEAN', 1, 1),
			('engineBlowBy', 'Engine Blow-By?', 'BOOLEAN', 1, 1),
			('fluidOrAirLeaks', 'Any Fluid Or Air Leaks', 'BOOLEAN', 1, 1),
			('engineStarts', 'Engine Starts?', 'BOOLEAN', 1, 1),
			('jumpStartRequired', 'Jump Start Required?', 'BOOLEAN', 1, 1),
			('gauges', 'Gauges', 'TEXT', 1, 1),
			('warningLights', 'Warning Lights', 'TEXT', 1, 1),
			('airConditioning', 'Air Conditioning', 'BOOLEAN', 1, 1);
	END
	ELSE IF @SectionName = 'After-Treatment (DEF Filters & Regen Info)'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('afterTreatmentSystemFaults', 'After Treatment System Faults?', 'TEXT', 1, 1),
			('dpfSootLevel', 'DPF Soot Level', 'TEXT', 1, 1),
			('dpfDerate', 'DPF Derate', 'TEXT', 1, 1),
			('dpfLampCommand', 'DPF Lamp Command', 'TEXT', 1, 1),
			('regenNeededIndication', 'Regen Needed Indication?', 'BOOLEAN', 1, 1),
			('emissionsComTest', 'Emissions Component Testing', 'TEXT', 1, 1),
			('dpfSystemNotes', 'DPF System Notes', 'TEXT', 1, 1);
	END
	ELSE IF @SectionName = 'Wear and Tear Details'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('wearAndTearDetails', 'Details', 'TEXT', 1, 1);
	END
	ELSE IF @SectionName = 'Photo Requirements'
	BEGIN
		INSERT INTO @FieldList VALUES 
			('fullLeftSideImage', 'Full Left Side Image', 'IMAGE', 1, 1),
			('fullRightSideImage', 'Full Right Side Image', 'IMAGE', 1, 1);
	END

    -- Process the field list
    DECLARE FieldCursor CURSOR FOR 
        SELECT FieldName, DisplayName, FieldType, ShowImage, ShowDetail 
        FROM @FieldList;

    OPEN FieldCursor;
    FETCH NEXT FROM FieldCursor INTO @FieldName, @DisplayName, @FieldType, @ShowImage, @ShowDetail;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Get or create InspectionFieldID
        EXEC dbo.GetOrCreateInspectionField 
            @FieldName, @DisplayName, @FieldType, @ShowImage, @ShowDetail, @InspectionFieldID OUTPUT;

        -- Insert into CategoryInspectionFields
        INSERT INTO CategoryInspectionFields (CategorySectionID, InspectionFieldID) 
        VALUES (@NewCategorySectionID, @InspectionFieldID);

        FETCH NEXT FROM FieldCursor INTO @FieldName, @DisplayName, @FieldType, @ShowImage, @ShowDetail;
    END

    CLOSE FieldCursor;
    DEALLOCATE FieldCursor;
END;

GO

