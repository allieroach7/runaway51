// Draw the officer sprite
if (state == OFFICER_STATE.INCAPACITATED) {
    var _pulse = 0.5 + 0.5 * sin(stun_z_timer * 0.15);
    var _r = lerp(255, 100, _pulse);
    var _g = lerp(255, 100, _pulse);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, make_color_rgb(_r, _g, 255), 1);
} else {
    draw_self();
}

// State label
var _cx = (bbox_left + bbox_right) / 2;
var _label = "";
var _color = c_white;

switch (state) {
    case OFFICER_STATE.PATROL:
        _label = "Patrolling";
        _color = c_aqua;
        break;
    case OFFICER_STATE.SUSPICIOUS:
        _label = "Huh?!";
        _color = c_orange;
        break;
    case OFFICER_STATE.CHASE:
        _label = "STOP RIGHT THERE!";
        _color = c_red;
        break;
    case OFFICER_STATE.INCAPACITATED:
        var _sec = ceil(stun_timer / game_get_speed(gamespeed_fps));
        _label = "Stunned (" + string(_sec) + "s)";
        _color = c_yellow;
        break;
}

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_colour(_color);
draw_set_alpha(0.9);
draw_text(x, bbox_top - 10, _label);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_colour(c_white);