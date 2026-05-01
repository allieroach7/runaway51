// Gravity
if (!place_meeting(x, y + 1, obj_platform)) {
    vsp += grav;
    if (vsp > max_fall) vsp = max_fall;
} else {
    if (vsp > 0) vsp = 0;
}

if (place_meeting(x, y + vsp, obj_platform)) {
    while (!place_meeting(x, y + sign(vsp), obj_platform)) {
        y += sign(vsp);
    }
    vsp = 0;
} else {
    y += vsp;
}