// Collect the key
keys_collected += 1;

// Key collect particles
if (instance_exists(obj_particle_manager)) {
    part_particles_create(obj_particle_manager.key_ps, other.x, other.y, obj_particle_manager.key_pt, 20);
}

// Destroy the key instance
instance_destroy(other);

// Debug message
show_debug_message("Keys: " + string(keys_collected) + "/" + string(global.keys_needed));

// Play sound
audio_play_sound(snd_collect, 10, false);