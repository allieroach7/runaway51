// Move beam using our own variable only
x += beam_speed * beam_dir;

life_timer--;

if (life_timer <= 0 || x < 0 || x > room_width) {
    instance_destroy();
}

if (place_meeting(x, y, obj_wall)) {
    instance_destroy();
}

show_debug_message("Beam dir: " + string(beam_dir) + " | x movement: " + string(beam_speed * beam_dir));

x += beam_speed * beam_dir;

life_timer--;

if (life_timer <= 0 || x < 0 || x > room_width) {
    instance_destroy();
}

if (place_meeting(x, y, obj_wall)) {
    instance_destroy();
}