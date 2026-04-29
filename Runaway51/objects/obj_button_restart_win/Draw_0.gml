// Get button position
var button_x = room_width / 2 - button_width / 2;
var button_y = room_height - 150;

// Draw button background with hover effect
draw_set_alpha(is_hovered ? 0.9 : 0.7);
draw_set_color(c_black);
draw_rectangle(button_x, button_y, button_x + button_width, button_y + button_height, false);

// Draw button border
draw_set_alpha(1);
draw_set_color(is_hovered ? c_yellow : c_white);
draw_rectangle(button_x - 3, button_y - 3, button_x + button_width + 3, button_y + button_height + 3, true);

// Draw button text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(-1);
draw_set_color(is_hovered ? c_yellow : c_white);
draw_text(room_width / 2, button_y + button_height / 2, "RESTART GAME");

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1);