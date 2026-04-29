// Fade in animation
if (alpha < 1) {
    alpha += fade_in_speed;
    if (alpha > 1) alpha = 1;
}

draw_set_alpha(alpha);

// Draw dark overlay
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Draw stars/particles effect (optional)
draw_set_color(c_white);
for (var i = 0; i < 50; i++) {
    draw_point(random(room_width), random(room_height));
}

// Draw "YOU ESCAPED!" title with pulse effect
pulse_timer++;
var _pulse = 0.7 + 0.3 * sin(pulse_timer * 0.05);
draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_yellow);

// Title with shadow effect
draw_set_color(c_black);
draw_text_transformed(room_width / 2 + 4, 54, win_text, _pulse, _pulse, 0);
draw_set_color(c_yellow);
draw_text_transformed(room_width / 2, 50, win_text, _pulse, _pulse, 0);

// Draw subtitle
draw_set_font(-1);
draw_set_color(c_white);
draw_text_ext(room_width / 2, 150, subtitle_text, 60, room_width - 200);

// Draw restart instruction
draw_set_color(c_gray);
draw_text_ext(room_width / 2, 250, restart_text, 60, room_width - 200);

// Reset drawing settings
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);