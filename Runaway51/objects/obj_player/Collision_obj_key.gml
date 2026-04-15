// Collect the key
keys_collected += 1;

// Destroy the key instance
instance_destroy(other);

// Future code for key sound effect
// audio_play_sound(snd_key_collect, 10, false);

// Shows a debug message
show_debug_message("Keys collected: " + string(keys_collected));