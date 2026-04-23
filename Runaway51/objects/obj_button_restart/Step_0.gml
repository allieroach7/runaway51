// Get mouse position
var _mouse_x = mouse_x;
var _mouse_y = mouse_y;

// Check hover
if (position_meeting(_mouse_x, _mouse_y, id)) {
    is_hovered = true;
    window_set_cursor(cr_handpoint);
    
    // Check click
    if (mouse_check_button_pressed(mb_left)) {
        is_pressed = true;
	// Reset global variables to level 1
	global.level = 1;
	global.keys_needed = 2;
	global.player_lives = 3;
        restart_game();
    }
} else {
    is_hovered = false;
    is_pressed = false;
    window_set_cursor(cr_default);
}

// Keyboard shortcut (R key) - completely resets game
if (keyboard_check_pressed(ord("R"))) {
    if (instance_exists(obj_player)) {
        with (obj_player) {
            player_lives = 3;
            keys_collected = 0;
        }
    }
    global.level = 1;
    global.keys_needed = 2;
    global.player_lives = 3;
    room_goto(rm_tutorial);
}

// Update scale based on state
if (is_pressed) {
    image_xscale = press_scale;
    image_yscale = press_scale;
} else if (is_hovered) {
    image_xscale = hover_scale;
    image_yscale = hover_scale;
} else {
    image_xscale = normal_scale;
    image_yscale = normal_scale;
}