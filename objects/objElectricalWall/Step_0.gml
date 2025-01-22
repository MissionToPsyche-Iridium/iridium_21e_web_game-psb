// Increment timer
blink_timer++;

// Check if it's time to toggle
if (blink_timer >= blink_interval) {
	blink_timer = 0;
    blink_interval = random_range(40, 80); // Reset timer
    blinking_red = !blinking_red; // Toggle state
    
    // Set image_blend based on the state
    if (blinking_red) {
        image_blend = make_color_rgb(153, 153, 0); // Set to yellow
    } else {
        image_blend = make_color_rgb(51, 51, 51); // Reset to normal color
    }
}