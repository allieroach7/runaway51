// Checks if touching ladder
var on_ladder = instance_place(x, y, obj_ladder);

// Ladder detection logic
if (on_ladder) {
    // If pressing up or down on a ladder
    if (keyboard_check(vk_up) || keyboard_check(vk_down)) {
        climbing = true;
        vspeed = 0;        // Stop vertical momentum
        gravity = 0;        // Disable gravity
    }
} else {
    // Not touching ladder
    climbing = false;
}

if (climbing) {
    // Climbing up
    if (keyboard_check(vk_up)) {
        y -= climb_speed;
    }
    
    // Climbing down  
    if (keyboard_check(vk_down)) {
        y += climb_speed;
    }
    
    // Detach when hitting ground
    if (instance_place(x, y + 1, obj_wall)) {
        climbing = false;
        sprite_index = spr_player;
    }
}

// PLAYER MOVEMENT 

	if (keyboard_check(vk_left)) {
        image_xscale = -1;
        if (!instance_place(x - move_speed, y, obj_wall)) {
            x -= move_speed;
        }
    }
    
    if (keyboard_check(vk_right)) {
        image_xscale = 1;
        if (!instance_place(x + move_speed, y, obj_wall)) {
            x += move_speed;
        }
    }
    
    // Jumping
    if (keyboard_check(vk_up)) {
        if (instance_place(x, y + 1, obj_wall)) {
            vspeed = jump_height;
        }
    }
    
    // Gravity
    if (instance_place(x, y + 1, obj_wall)) {
        gravity = 0;
    } else {
        gravity = 0.25;
    }
    
    // Speed limit
    if (vspeed > 12) vspeed = 12;
	