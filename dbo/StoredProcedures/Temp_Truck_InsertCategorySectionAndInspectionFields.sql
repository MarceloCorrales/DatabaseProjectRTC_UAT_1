CREATE PROCEDURE Temp_Truck_InsertCategorySectionAndInspectionFields
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

    IF @SectionName = 'Equipment Details'
    BEGIN
		INSERT INTO @FieldList VALUES 
            ('cabType', 'Cab Type', 'TEXT', 1, 1),
            ('interiorCondition', 'Interior Condition', 'TEXT', 1, 1),
            ('airRideCab', 'Air Ride Cab', 'BOOLEAN', 1, 1),
            ('doubleFrame', 'Double Frame', 'BOOLEAN', 1, 1),
            ('fuelTankCapacity', 'Fuel Tank Capacity', 'TEXT', 1, 1),
            ('wetKit', 'Wet Kit', 'BOOLEAN', 1, 1),
            ('pintleHitch', 'Pintle Hitch', 'BOOLEAN', 1, 1),
            ('winch', 'Winch', 'BOOLEAN', 1, 1),
            ('equipDetailSpecialFunction', 'Special Function', 'TEXT', 1, 1),
            ('otherEquipmentDetail', 'Other', 'TEXT', 1, 1);
    END
    ELSE IF @SectionName = 'Engine'
    BEGIN
        INSERT INTO @FieldList VALUES 
            ('engineMake', 'Engine Make', 'TEXT', 1, 1),
            ('engineModel', 'Engine Model', 'TEXT', 1, 1),
            ('fuelType', 'Fuel Type', 'TEXT', 1, 1),
            ('engineHorsepower', 'Engine Horsepower', 'TEXT', 1, 1),
            ('engineBrake', 'Engine Brake', 'TEXT', 1, 1),
            ('fuelSystem', 'Fuel System', 'TEXT', 1, 1),
            ('radiator', 'Radiator', 'TEXT', 1, 1),
            ('engineSerialNumber', 'Engine Serial Number', 'TEXT', 1, 1),
            ('oilLeaks', 'Oil Leaks', 'TEXT', 1, 1),
            ('fuelLeaks', 'Fuel Leaks', 'TEXT', 1, 1),
            ('coolingSystemLeaks', 'Cooling System Leaks', 'TEXT', 1, 1),
            ('engineLeftSideImage', 'Engine - Left Side Image', 'IMAGE', 1, 1),
            ('engineRightSideImage', 'Engine - Right Side Image', 'IMAGE', 1, 1),
            ('engineFunctionCheck', 'Engine Function Check', 'TEXT', 1, 1),
            ('engineOther', 'Other', 'TEXT', 1, 1),
            ('engineOilCheck', 'Engine Oil Check', 'BOOLEAN', 1, 1),
            ('engineBlowBy', 'Engine Blow-By', 'BOOLEAN', 1, 1),
            ('coolantCheck', 'Coolant Check', 'BOOLEAN', 1, 1),
            ('wipersWashersWork', 'Wipers/Washers Work', 'BOOLEAN', 1, 1),
            ('hornsOperational', 'Horn(s) Operational', 'BOOLEAN', 1, 1),
            ('defrostFan', 'Defrost/Fan', 'BOOLEAN', 1, 1),
            ('fluidOrAirLeaks', 'Any Fluid Or Air Leaks', 'BOOLEAN', 1, 1),
            ('engineStarts', 'Engine Starts', 'BOOLEAN', 1, 1),
            ('jumpStartRequired', 'Jump Start Required', 'BOOLEAN', 1, 1),
            ('dashGaugesWork', 'Dash Gauges Work', 'BOOLEAN', 1, 1),
            ('dashWarningLights', 'Dash Warning Lights', 'BOOLEAN', 1, 1),
            ('airConditioning', 'Air Conditioning', 'BOOLEAN', 1, 1),
            ('generalOperationalNotes', 'General Operational and Mechanical Notes', 'TEXT', 1, 1);
    END
	ELSE IF @SectionName = 'Drivetrain'
    BEGIN
        INSERT INTO @FieldList VALUES 
            ('transmissonMake', 'Transmission Make', 'TEXT', 1, 1),
            ('transmissonModel', 'Transmission Model', 'TEXT', 1, 1),
            ('transmissonSerial', 'Serial #', 'TEXT', 1, 1),
            ('transmissonOther', 'Transmission Other', 'TEXT', 1, 1),
            ('wheelBase', 'Wheel Base', 'TEXT', 1, 1),
            ('gvwr', 'GVWR', 'TEXT', 1, 1),
            ('frontAxleCapacity', 'Front Axle Capacity', 'TEXT', 1, 1),
            ('rearAxleCapacity', 'Rear Axle Capacity', 'TEXT', 1, 1),
            ('suspensionR', 'Suspension (R)', 'TEXT', 1, 1),
            ('gearRatio', 'Gear Ratio', 'TEXT', 1, 1),
            ('drivenWheels', 'Driven Wheels', 'TEXT', 1, 1),
            ('otherSuspension', 'Other', 'TEXT', 1, 1);
            
    END
	ELSE IF @SectionName = 'Appearance'
    BEGIN
        INSERT INTO @FieldList VALUES 
            ('paintFinishColor', 'Paint Finish / Color', 'TEXT', 1, 1);
    END
	ELSE IF @SectionName = 'Seating'
    BEGIN
        INSERT INTO @FieldList VALUES 
            ('driverSeatAirRide', 'Driver Seat Air Ride', 'BOOLEAN', 1, 1),
            ('passengerSeatAirRide', 'Passenger Seat Air Ride', 'BOOLEAN', 1, 1),
            ('ripsTearsWear', 'Rips/Tears/Excessive Wear', 'BOOLEAN', 1, 1),
            ('otherSeating', 'Other', 'BOOLEAN', 1, 1);
    END
	ELSE IF @SectionName = 'Sleeper'
    BEGIN
        INSERT INTO @FieldList VALUES 
            ('singleBunk', 'Single Bunk', 'BOOLEAN', 1, 1),
            ('doubleBunk', 'Double Bunk', 'BOOLEAN', 1, 1),
            ('refrigerator', 'Refrigerator', 'BOOLEAN', 1, 1),
            ('microwave', 'Microwave', 'BOOLEAN', 1, 1),
            ('inverter110V', '110V Inverter', 'BOOLEAN', 1, 1),
            ('apu', 'APU', 'BOOLEAN', 1, 1),
            ('mattress', 'Mattress', 'BOOLEAN', 1, 1),
            ('otherSleeper', 'Other', 'BOOLEAN', 1, 1),
            ('notes', 'Notes', 'TEXT', 1, 1);
    END
	ELSE IF @SectionName = 'Special Function'
    BEGIN
        INSERT INTO @FieldList VALUES 
			('cabAndDriverNotes', 'Notes', 'TEXT', 1, 1);
    END
	ELSE IF @SectionName = 'Under Carriage'
    BEGIN
        INSERT INTO @FieldList VALUES 
			('suspensionSpringsUc', 'Suspension Springs / Hangers', 'TEXT', 1, 1),
			('suspensionBushingsUc', 'Suspension Bushings', 'TEXT', 1, 1),
			('suspensionAirBagsUc', 'Suspension Air Bags', 'TEXT', 1, 1),
			('left1Uc', 'Left #1', 'TEXT', 1, 1),
			('left2OuterUc', 'Left #2 Outer', 'TEXT', 1, 1),
			('left2InnerUc', 'Left #2 Inner', 'TEXT', 1, 1),
			('left3OuterUc', 'Left #3 Outer', 'TEXT', 1, 1),
			('left3InnerUc', 'Left #3 Inner', 'TEXT', 1, 1),
			('right1Uc', 'Right #1', 'TEXT', 1, 1),
			('right2OuterUc', 'Right #2 Outer', 'TEXT', 1, 1),
			('right2InnerUc', 'Right #2 Inner', 'TEXT', 1, 1),
			('right3OuterUc', 'Right #3 Outer', 'TEXT', 1, 1),
			('right3InnerUc', 'Right #3 Inner', 'TEXT', 1, 1),
			('wheelTypeUc', 'Wheel Type', 'TEXT', 1, 1),
			('wheelConditionUc', 'Wheel Condition', 'TEXT', 1, 1),
			('wheelStudsUc', 'Wheel Studs', 'TEXT', 1, 1),
			('parkBrakeUc', 'Park Brake', 'TEXT', 1, 1),
			('limitedBrakeFunctionCheckUc', 'Limited Brake Function Check', 'BOOLEAN', 1, 1),
			('tireSizeFrontTires', 'Tire Size Front Tires', 'TEXT', 1, 1),
			('tireSizeCenterTires', 'Tire Size Center Tires', 'TEXT', 1, 1),
			('tireSizeRearTires', 'Tire Size Rear Tires', 'TEXT', 1, 1),
			('liftAxle', 'Lift Axle', 'TEXT', 1, 1),
			('liftAxleTires', 'Lift Axle Tires', 'IMAGE', 1, 1);
    END
	ELSE IF @SectionName = 'Brakes'
    BEGIN
        INSERT INTO @FieldList VALUES 
			('left1Axle', 'Left #1 Axle', 'TEXT', 1, 1),
			('left2Axle', 'Left #2 Axle', 'TEXT', 1, 1),
			('left3Axle', 'Left #3 Axle', 'TEXT', 1, 1),
			('right1Axle', 'Right #1 Axle', 'TEXT', 1, 1),
			('right2Axle', 'Right #2 Axle', 'TEXT', 1, 1),
			('right3Axle', 'Right #3 Axle', 'TEXT', 1, 1),
			('additionalBrakeInformation', 'Additional Brake Information', 'TEXT', 1, 1);
    END
	ELSE IF @SectionName = 'Lighting & Electrical System'
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
	ELSE IF @SectionName = 'After Treatment (DEF Filters & Regen Info)'
    BEGIN
        INSERT INTO @FieldList VALUES 
			('afterTreatmentSystemFaults', 'After Treatment System Faults?', 'BOOLEAN', 1, 1),
			('dpfSootLevel', 'DPF Soot Level', 'TEXT', 1, 1),
			('dpfLampCommand', 'DPF Lamp Command', 'TEXT', 1, 1),
			('regenNeededIndication', 'Regen Needed Indication?', 'BOOLEAN', 1, 1),
			('dpfDerate', 'DPF Derate', 'TEXT', 1, 1),
			('emissionsComTest', 'Emissions Component Testing', 'TEXT', 1, 1),
			('dpfSystemNotes', 'DPF System Notes', 'TEXT', 1, 1);
    END
	ELSE IF @SectionName = 'Wear & Tear Details'
    BEGIN
        INSERT INTO @FieldList VALUES 
			('notesWearTear1', 'Notes', 'TEXT', 1, 1),
			('notesWearTear2', 'Notes', 'TEXT', 1, 1),
			('notesWearTear3', 'Notes', 'TEXT', 1, 1),
			('notesWearTear4', 'Notes', 'TEXT', 1, 1),
			('notesWearTear5', 'Notes', 'TEXT', 1, 1);
    END
	ELSE IF @SectionName = 'Photo Requirements'
    BEGIN
        INSERT INTO @FieldList VALUES 
			('fullDriversSideImage', 'Full Drivers Side Image', 'IMAGE', 1, 1),
			('fullPassengersSideImage', 'Full Passengers Side Image', 'IMAGE', 1, 1);
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

