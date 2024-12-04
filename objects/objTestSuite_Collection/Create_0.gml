// Initialize Test Runner and Suite
var runner = new TestRunner("runner");
var suite = new TestSuite("suite");
runner.addTestSuite(suite);

// Test Case: Collision Count
var tc_007 = new TestCase("tc_007", function() {
	// Resource 1
	var imageIndex = 0;
	var resource1Count = 0;
	var resource2Count = 0;
	var resource3Count = 0;
	var resource4Count = 0;
	var resource5Count = 0;
	
	// Logic
	//[
	    if(imageIndex == 0) {
			resource1Count += 1;
		} else if(imageIndex == 1) {
			resource2Count += 1;
		} else if(imageIndex == 2) {
			resource3Count += 1;
		} else if(imageIndex == 3) {
			resource4Count += 1;
		} else if(imageIndex == 4) {
			resource5Count += 1;
		}
	//]

    // Assertions
	assertEqual(resource1Count, 1, "tc_007_error: On collision at index 0, resource 1 should be updated.");
	
	// Resource 2
	imageIndex = 1;
	resource1Count = 0;
	resource2Count = 0;
	resource3Count = 0;
	resource4Count = 0;
	resource5Count = 0;
	
	// Logic
	//[
	    if(imageIndex == 0) {
			resource1Count += 1;
		} else if(imageIndex == 1) {
			resource2Count += 1;
		} else if(imageIndex == 2) {
			resource3Count += 1;
		} else if(imageIndex == 3) {
			resource4Count += 1;
		} else if(imageIndex == 4) {
			resource5Count += 1;
		}
	//]

    // Assertions
	assertEqual(resource2Count, 1, "tc_007_error: On collision at index 1, resource 2 should be updated.");
	
	// Resource 3
	imageIndex = 2;
	resource1Count = 0;
	resource2Count = 0;
	resource3Count = 0;
	resource4Count = 0;
	resource5Count = 0;
	
	// Logic
	//[
	    if(imageIndex == 0) {
			resource1Count += 1;
		} else if(imageIndex == 1) {
			resource2Count += 1;
		} else if(imageIndex == 2) {
			resource3Count += 1;
		} else if(imageIndex == 3) {
			resource4Count += 1;
		} else if(imageIndex == 4) {
			resource5Count += 1;
		}
	//]

    // Assertions
	assertEqual(resource3Count, 1, "tc_007_error: On collision at index 2, resource 3 should be updated.");
	
	// Resource 4
	imageIndex = 3;
	resource1Count = 0;
	resource2Count = 0;
	resource3Count = 0;
	resource4Count = 0;
	resource5Count = 0;
	
	// Logic
	//[
	    if(imageIndex == 0) {
			resource1Count += 1;
		} else if(imageIndex == 1) {
			resource2Count += 1;
		} else if(imageIndex == 2) {
			resource3Count += 1;
		} else if(imageIndex == 3) {
			resource4Count += 1;
		} else if(imageIndex == 4) {
			resource5Count += 1;
		}
	//]

    // Assertions
	assertEqual(resource4Count, 1, "tc_007_error: On collision at index 3, resource 4 should be updated.");
	
	// Resource 5
	imageIndex = 4;
	resource1Count = 0;
	resource2Count = 0;
	resource3Count = 0;
	resource4Count = 0;
	resource5Count = 0;
	
	// Logic
	//[
	    if(imageIndex == 0) {
			resource1Count += 1;
		} else if(imageIndex == 1) {
			resource2Count += 1;
		} else if(imageIndex == 2) {
			resource3Count += 1;
		} else if(imageIndex == 3) {
			resource4Count += 1;
		} else if(imageIndex == 4) {
			resource5Count += 1;
		}
	//]

    // Assertions
	assertEqual(resource5Count, 1, "tc_007_error: On collision at index 4, resource 5 should be updated.");
});

// Add Test Case to Suite
suite.addTestCase(tc_007);

// Run Tests
runner.run();
