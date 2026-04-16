// Simple turn-around on wall collision

// Move out of the wall
while (place_meeting(x, y, obj_wall)) {
    x -= sign(facing);
}

// Reverse direction
facing *= -1;
image_xscale = facing;

// Stop horizontal speed
hspeed = 0;

// If using path movement, reverse the path
if (state == OFFICER_STATE.PATROL) {
    path_speed = -path_speed;
}