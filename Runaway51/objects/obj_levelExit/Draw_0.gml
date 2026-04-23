// Draw the exit sprite
draw_self();
// Shows key count
if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    
    if (_dist < 100) {
        var _keys_needed = global.keys_needed;
        var _keys_have = obj_player.keys_collected;
        
        draw_set_alpha(0.8);
        draw_set_halign(fa_center);
        
        if (_keys_have >= _keys_needed) {
            draw_set_colour(c_lime);
            draw_text(x, y - 20, "EXIT");
        } else {
            draw_set_colour(c_red);
            draw_text(x, y - 20, string(_keys_needed - _keys_have) + " KEYS NEEDED");
        }
        
        draw_set_halign(fa_left);
        draw_set_alpha(1);
        draw_set_colour(c_white);
    }
}