// Alert shader
if (alert_intensity > 0) {
    shader_set(shd_alert);
    shader_set_uniform_f(u_alert_intensity, alert_intensity);
}

// Draw the player sprite normally
draw_self();

if (alert_intensity > 0) {
    shader_reset();
}

// Draw key counter
draw_set_color(c_yellow);
draw_set_alpha(1);
draw_text(x - 30, y - 75, "Keys: " + string(keys_collected) + "/" + string(global.keys_needed));

// Draw player lives
for (var i = 0; i < player_lives; i++) {
    draw_sprite(spr_player, 0, 64 + (i * 48), 64);
}