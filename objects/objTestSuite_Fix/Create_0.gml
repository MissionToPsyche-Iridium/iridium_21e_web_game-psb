// Initialize Test Runner and Suite
var runner = new TestRunner("runner");
var suite = new TestSuite("suite");
runner.addTestSuite(suite);

// Test Case: Collision Count
var tc_008 = new TestCase("tc_008", function() {
	// Successful Fix
	var isFixed = 0;
	var posMeeting = true;
	var clickButton = true;
	var resourceCount = 1;
	var imageIndex = 0;
	
	// Logic
	//[
	    if(isFixed == 0) {
			// Check if obj_hero overlaps obj_computer
			if (posMeeting) {
			    // Check if the E key is pressed
			    if (clickButton) {
			        // Check if the player has at least 1 of resource_1
			        if (resourceCount > 0) {
			            // Change the sprite frame to frame 1
			            imageIndex = 1;

			            // Optionally reduce the resource count
			            resourceCount -= 1;
				
						isFixed = 1;
			        }
			    }
			}
		}
	//]

    // Assertions
	assertEqual(isFixed, 1, "tc_008_error: Should show fixed.");
	assertEqual(resourceCount, 0, "tc_008_error: Should subtract resource.");
	assertEqual(imageIndex, 1, "tc_008_error: Image index should show fixed.");
});

// Add Test Case to Suite
suite.addTestCase(tc_008);

// Run Tests
runner.run();
