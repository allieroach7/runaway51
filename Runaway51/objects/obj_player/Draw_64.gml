// Draw player lives
for (var i = 0; i < player_lives; i++) {
    draw_sprite(spr_player, 0, 20 + (i * 48), 20);
}

// Draw key counter
draw_set_color(c_yellow);
draw_set_alpha(1);
draw_text(200, 40, "Keys: " + string(keys_collected) + "/" + string(global.keys_needed));

// --- MINIMAP ---
var _map_w = 200;
var _map_h = 112;
var _map_x = display_get_gui_width() - _map_w - 10;
var _map_y = 10;

draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_rectangle(_map_x, _map_y, _map_x + _map_w, _map_y + _map_h, false);
draw_set_alpha(1);

draw_set_colour(c_white);
draw_rectangle(_map_x, _map_y, _map_x + _map_w, _map_y + _map_h, true);

var _sx = _map_w / room_width;
var _sy = _map_h / room_height;

// Player (green)
draw_set_colour(c_lime);
draw_circle(_map_x + (x * _sx), _map_y + (y * _sy), 3, false);

// Guards (red)
draw_set_colour(c_red);
with (obj_officer) {
    draw_circle(_map_x + (x * _sx), _map_y + (y * _sy), 2, false);
}

// Keys (yellow)
draw_set_colour(c_yellow);
with (obj_key) {
    draw_circle(_map_x + (x * _sx), _map_y + (y * _sy), 2, false);
}

// Level exit (white)
draw_set_colour(c_white);
with (obj_levelExit) {
    draw_circle(_map_x + (x * _sx), _map_y + (y * _sy), 3, false);
}

draw_set_alpha(1);
draw_set_colour(c_white);