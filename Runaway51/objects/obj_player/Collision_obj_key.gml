// Collect the key
keys_collected += 1;

// Destroy the key instance
instance_destroy(other);

// Debug message
show_debug_message("Keys: " + string(keys_collected) + "/" + string(global.keys_needed));

// Optional: Play sound
// audio_play_sound(snd_key_collect, 10, false);