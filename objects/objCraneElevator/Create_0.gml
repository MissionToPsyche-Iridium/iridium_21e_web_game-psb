event_inherited();

// Movement parameters
move_amount = 350; // Distance to move down
move_speed = 2;   // Speed of movement
pause_time = 120;  // Pause duration in frames (60 frames = 1 second)

// State tracking
original_y = y;   // Store the original Y position
target_y = y + move_amount; // Target downward position
moving_down = true;
paused = false;

// Variable to track objHero reference
hero = noone;