// Initialize Test Runner and Suite
var runner = new TestRunner("runner");
var suite = new TestSuite("suite");
runner.addTestSuite(suite);

// Test Case: Walk
var tc_003 = new TestCase("tc_003", function() {
	// Mock inputs
	//[
		// Constants
		var constantSpeed = 5;
	
	    // Move Right
	    var moveSpd = [5, 10]; // Walking and running speeds
	    var runKey = 0; // Walking
	    var rightKey = 1;
	    var leftKey = 0;
		var face = 1;
	//]
	
	// Walking Logic
	//[
	    var moveDir = rightKey - leftKey;
	
		if moveDir != 0 {
			face = moveDir;
		}
	
	    var xspd = moveDir * moveSpd[runKey];
	//]

    // Assertions
	assertEqual(moveDir, 1, "tc_003_error: moveDir should be 1 when moving right at walking speed.");
	assertEqual(face, moveDir, "tc_003_error: face should be 1 when moving right at walking speed.");
    assertEqual(xspd, constantSpeed, "tc_003_error: xspd should be 5 when moving right at walking speed.");
	
	// Move Left
    moveSpd = [5, 10]; // Walking and running speeds
    runKey = 0; // Walking
    rightKey = 0;
    leftKey = 1;
	face = 1;
	
	// Logic
	//[
	    moveDir = rightKey - leftKey;
	
		if moveDir != 0 {
			face = moveDir;
		}
	
	    xspd = moveDir * moveSpd[runKey];
	//]

    // Assertions
	assertEqual(moveDir, -1, "tc_003_error: moveDir should be -1 when moving left at walking speed.");
	assertEqual(face, moveDir, "tc_003_error: face should be -1 when moving left at walking speed.");
    assertEqual(xspd, -1 * constantSpeed, "tc_003_error: xspd should be -5 when moving left at walking speed.");
	
	// Stand Still
    moveSpd = [5, 10]; // Walking and running speeds
    runKey = 0; // Walking
    rightKey = 0;
    leftKey = 0;
	face = 1;
	
	// Logic
	//[
	    moveDir = rightKey - leftKey;
	
		if moveDir != 0 {
			face = moveDir;
		}
	
	    xspd = moveDir * moveSpd[runKey];
	//]

    // Assertions
	assertEqual(moveDir, 0, "tc_003_error: moveDir should be 0 when standing still.");
	assertEqual(face, 1, "tc_003_error: face should be 1 when standing still.");
    assertEqual(xspd, 0, "tc_003_error: xspd should be 0 when standing still.");
});

// X Collision
var tc_004 = new TestCase("tc_004", function() {
	// Test Normal Collision
	var xPlaceMeeting = true;
	var xUpSlopePlaceMeeting = false;
	var xCeilingSlopePlaceMeeting = false;
	
	var _subPixel = .5;
	var yScootPlaceMeeting = false;
	var yScootCeilingPlaceMeeting = false;
	var xScootPlaceMeeting = false;
	var yMock = 0;
	var xMock = 0;
	var xSpeed = 5;
	
	// Logic
	//[
		if (xPlaceMeeting) {
			// Fist check if there is a slope to go up
			if (xUpSlopePlaceMeeting) {
				while (!yScootPlaceMeeting) {
					yMock -= _subPixel;
					yScootPlaceMeeting = true;
				}
			// Next, check for ceiling sloper, otherwise, regular collision
			} else {
				// Ceiling slopes
				if (xCeilingSlopePlaceMeeting) {
					while (!yScootCeilingPlaceMeeting) {
						yMock += _subPixel;
						yScootCeilingPlaceMeeting = true;
					}
				// Normal collision
				} else {
					// Scoot up to wall precisely
					var _pixelCheck = _subPixel * sign(xSpeed);
					while !xScootPlaceMeeting {
						xMock += _pixelCheck;	
						xScootPlaceMeeting = true;
					}

					// Set xspd to zero to "collide"
					xSpeed = 0;
				}
			}
		}
	//]
	
	// Assertions
	assertEqual(yMock, 0, "tc_004_error: y should not be changed on standard collision.");
	assertEqual(xSpeed, 0, "tc_004_error: speed should not be 0 on standard collision.");
    assertEqual(xMock, _pixelCheck, "tc_004_error: x position should have been scooted by one in test.");
	
	// Test Upwards Slope
	xPlaceMeeting = true;
	xUpSlopePlaceMeeting = true;
	xCeilingSlopePlaceMeeting = false;
	
	_subPixel = .5;
	yScootPlaceMeeting = false;
	yScootCeilingPlaceMeeting = false;
	xScootPlaceMeeting = false;
	yMock = 0;
	xMock = 0;
	xSpeed = 5;
	
	// Logic
	//[
		if (xPlaceMeeting) {
			// Fist check if there is a slope to go up
			if (xUpSlopePlaceMeeting) {
				while (!yScootPlaceMeeting) {
					yMock -= _subPixel;
					yScootPlaceMeeting = true;
				}
			// Next, check for ceiling sloper, otherwise, regular collision
			} else {
				// Ceiling slopes
				if (xCeilingSlopePlaceMeeting) {
					while (!yScootCeilingPlaceMeeting) {
						yMock += _subPixel;
						yScootCeilingPlaceMeeting = true;
					}
				// Normal collision
				} else {
					// Scoot up to wall precisely
					var _pixelCheck = _subPixel * sign(xSpeed);
					while !xScootPlaceMeeting {
						xMock += _pixelCheck;	
						xScootPlaceMeeting = true;
					}

					// Set xspd to zero to "collide"
					xSpeed = 0;
				}
			}
		}
	//]
	
	// Assertions
	assertEqual(yMock, -1 * _subPixel, "tc_004_error: y should be changed on upwards slope by subpixel.");
	assertEqual(xSpeed, 5, "tc_004_error: speed should not be 5 on upwards slope.");
    assertEqual(xMock, 0, "tc_004_error: x position should not be moved on upwards slope.");
});


// Go down slopes
var tc_005 = new TestCase("tc_005", function() {
	// Test Downward Slope
	var ySpeed = 0;
	var yPosition = 0;
	var pixelDownSlopePositionMeeting = false;
	var pixelDownSlopeXSpeedPositionMeeting = true;
	var pixelDownSlopeSubPosMeeting = false;
	var _subPixel = 0.5;
	
	// Logic
	//[
		// Go down slopes
		if ySpeed >= 0 && !pixelDownSlopePositionMeeting && pixelDownSlopeXSpeedPositionMeeting {
			while !pixelDownSlopeSubPosMeeting {
				yPosition += _subPixel;	
				pixelDownSlopeSubPosMeeting = true;
			}
		}
	//]
	
	// Assertions
	assertEqual(yPosition, _subPixel, "tc_005_error: y should be heading towards the subpixel (in the downward) when going down a slope.");
});

// Image Index Update
var tc_006 = new TestCase("tc_006", function() {
	// Test Stand Still
	var xSpeed = 0;
	var sprIndex = 0;
	var onGround = true;
	
	// Logic
	//[
		if abs(xSpeed) > 0 {
			sprIndex = 1;
		}
	
		// Not Moving
		if xSpeed == 0 {
			sprIndex = 0;
		}
	
		// In the air
		if !onGround {
			sprIndex = 2;	
		}
	//]
	
	// Assertions
	assertEqual(sprIndex, 0, "tc_006_error: sprite index should be 0 when standing still");
	
	// Test Walking
	xSpeed = 1;
	sprIndex = 0;
	onGround = true;
	
	// Logic
	//[
		if abs(xSpeed) > 0 {
			sprIndex = 1;
		}
	
		// Not Moving
		if xSpeed == 0 {
			sprIndex = 0;
		}
	
		// In the air
		if !onGround {
			sprIndex = 2;	
		}
	//]
	
	// Assertions
	assertEqual(sprIndex, 1, "tc_006_error: sprite index should be 1 when walking");
	
	// Test Walking
	xSpeed = 0;
	sprIndex = 0;
	onGround = false;
	
	// Logic
	//[
		if abs(xSpeed) > 0 {
			sprIndex = 1;
		}
	
		// Not Moving
		if xSpeed == 0 {
			sprIndex = 0;
		}
	
		// In the air
		if !onGround {
			sprIndex = 2;	
		}
	//]
	
	// Assertions
	assertEqual(sprIndex, 2, "tc_006_error: sprite index should be 2 when jumping");
});

// Add Test Case to Suite
suite.addTestCase(tc_003);
suite.addTestCase(tc_004);
suite.addTestCase(tc_005);
suite.addTestCase(tc_006);

// Run Tests
runner.run();