// Fade in animation
if (alpha < 1) {
    alpha += fade_in_speed;
    if (alpha > 1) alpha = 1;
}

draw_set_alpha(alpha);

// Draw Title (bigger using text transformation)
draw_set_font(-1);  // Default font
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_lime);

// Scale title to be larger
var _title_scale = 2.5;
draw_text_transformed(room_width / 2, 50, title_text, _title_scale, _title_scale, 0);

// Draw Overview Text (normal size with word wrap)
draw_set_font(-1);  // Default font
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_ext(room_width / 2, 150, overview_text, 60, room_width - 100);

// Reset drawing settings
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);