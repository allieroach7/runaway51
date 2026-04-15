
draw_self();

// If player is near and doesn't have enough keys, show message
var player = instance_nearest(x, y, obj_player);
if (point_distance(x, y, player.x, player.y) < 50 && player.keys_collected < 2) {
    draw_set_color(c_white);
    draw_set_alpha(0.8);
    draw_text(x, y - 20, "Need " + string(2 - player.keys_collected) + " more keys!");
}