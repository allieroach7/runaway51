// Draw the player sprite normally
draw_self();

// Draw key counter
draw_set_color(c_yellow);
draw_set_alpha(1);
draw_text(x - 30, y - 75, "Keys: " + string(keys_collected) + "/2");