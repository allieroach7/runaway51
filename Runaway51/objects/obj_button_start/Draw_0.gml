// Just draw the sprite (GameMaker handles it automatically)
draw_self();

// Draw text on top of the button
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(-1);
draw_set_color(is_hovered ? c_yellow : c_white);
draw_text(x + sprite_width/2, y + sprite_height/2, "START GAME");

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);