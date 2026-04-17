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
        restart_game();
    }
} else {
    is_hovered = false;
    is_pressed = false;
    window_set_cursor(cr_default);
}

// Keyboard shortcut
if (keyboard_check_pressed(ord("R"))) {
    restart_game();
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