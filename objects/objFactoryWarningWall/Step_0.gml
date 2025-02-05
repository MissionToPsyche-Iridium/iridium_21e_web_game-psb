// Increment timer
blink_timer++;

// Check if it's time to toggle
if (blink_timer >= blink_interval) {
    blink_timer = 0; // Reset timer
    blinking = !blinking; // Toggle state
    
    // Set image_blend based on the state
    if (blinking) {
        image_blend = warningColor; // Set to red
    } else {
        image_blend = originalColor; // Reset to normal color
    }
}