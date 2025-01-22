// Increment the timer
fluctuation_timer++;

// Check if it's time to randomize the image_speed
if (fluctuation_timer >= fluctuation_interval) {
    fluctuation_timer = 0; // Reset timer

    // Set image_speed to a random value between 0.025 and 0.05
    image_speed = random_range(0.025, 0.05);
}