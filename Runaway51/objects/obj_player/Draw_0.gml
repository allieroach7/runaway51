// Draw the player sprite normally
draw_self();

// Draw key counter
draw_set_color(c_yellow);
draw_set_alpha(1);
draw_text(x - 30, y - 75, "Keys: " + string(keys_collected) + "/"+ string(global.keys_needed));

// Draw player lives
for (var i = 0; i < player_lives; i++) {
    draw_sprite(spr_player, 0, 64 + (i * 48), 64);
}