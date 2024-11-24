// If the game is paused, draw the overlay
if (paused) {
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false); // Background (semi-transparent overlay)
    draw_set_color(c_white);
    draw_text(display_get_width() / 2 - 50, display_get_height() / 2 - 20, "PAUSED");
    draw_text(display_get_width() / 2 - 60, display_get_height() / 2 + 20, "Press ESC to Resume");
    draw_text(display_get_width() / 2 - 70, display_get_height() / 2 + 40, "Press tab for Menu");
}
