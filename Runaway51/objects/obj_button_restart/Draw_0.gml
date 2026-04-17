// Set alpha based on state
var _alpha = normal_alpha;
if (is_pressed) {
    _alpha = press_alpha;
} else if (is_hovered) {
    _alpha = hover_alpha;
}

draw_set_alpha(_alpha);
draw_self();
draw_set_alpha(1);

// Draw text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (is_hovered) {
    draw_set_colour(c_yellow);
} else {
    draw_set_colour(c_white);
}

draw_text(x, y, "RESTART");

// Reset drawing settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);