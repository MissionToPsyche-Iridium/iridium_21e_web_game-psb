timer += 1; // Increase timer every step

if (timer >= delay) { // Every 3 seconds
    dialogue_index += 1; // Move to next dialogue
    timer = 0; // Reset timer

    // If all dialogue is read, destroy the instance
    if (dialogue_index >= array_length(dialogue)) {
        instance_destroy(); // Remove this dialogue box from the game
    }
}