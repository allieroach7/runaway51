// --- ALERT BORDER EFFECT ---
if (alert_intensity > 0) {
    var _w = display_get_gui_width();
    var _h = display_get_gui_height();
    var _border = 60;
    var _alpha = alert_intensity * 0.6;
    
    draw_set_colour(c_dkgray);
    draw_set_alpha(_alpha);
    
    // Top border
    draw_rectangle(0, 0, _w, _border, false);
    // Bottom border
    draw_rectangle(0, _h - _border, _w, _h, false);
    // Left border
    draw_rectangle(0, 0, _border, _h, false);
    // Right border
    draw_rectangle(_w - _border, 0, _w, _h, false);
    
    // Inner red glow
    draw_set_colour(c_red);
    draw_set_alpha(_alpha * 0.5);
    
    // Top inner
    draw_rectangle(0, _border, _w, _border + 30, false);
    // Bottom inner
    draw_rectangle(0, _h - _border - 30, _w, _h - _border, false);
    // Left inner
    draw_rectangle(_border, 0, _border + 30, _h, false);
    // Right inner
    draw_rectangle(_w - _border - 30, 0, _w - _border, _h, false);
    
    draw_set_alpha(1);
    draw_set_colour(c_white);
}
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