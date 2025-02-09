if(global.craneFix == 0) {
	image_speed = 0;
} else {
	// Reverse direction when reaching the first or last frame
	if (image_index >= image_number - 1) {
	    image_speed = -0.10; // Reverse animation backward
	} else if (image_index <= 1) {
	    image_speed = 0.10;  // Reverse animation forward
	}
}