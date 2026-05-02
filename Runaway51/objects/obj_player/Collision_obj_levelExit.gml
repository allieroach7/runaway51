// Level completion - triggers automatically on collision (no UP key needed)
if (keys_collected >= global.keys_needed) {
    // Check if this is the final level
	if (global.level == 3){
		
		// GAME COMPLETE - Win condition
        show_debug_message("YOU WIN! Game Complete!");
        
        // Go to win room
        room_goto(rm_win);
		
		
	}
   else if (global.level == 2) {
		
		// Advance to level 3
        show_debug_message("Level 2 Complete! Moving to Level 3");
        
        // Save player lives for next level
        global.player_lives = player_lives;
        
        // Reset keys for next level
        keys_collected = 0;
        
        // Update global level info
        global.level = 3;
        global.keys_needed = 6;
        
        // Go to level 3
        room_goto(rm_level2);
		audio_stop_sound(snd_level2)
		audio_play_sound(snd_level3,1,true)
		
    } 
    else if (global.level == 1) {
        // Advance to level 2
        show_debug_message("Level 1 Complete! Moving to Level 2");
        
        // Save player lives for next level
        global.player_lives = player_lives;
        
        // Reset keys for next level
        keys_collected = 0;
        
        // Update global level info
        global.level = 2;
        global.keys_needed = 6;
        
        // Go to level 2
        room_goto(rm_level);
		audio_stop_sound(snd_gameplay)
		audio_play_sound(snd_level2, 1, true)
    }
} else {
    // Not enough keys - show message but don't block movement
    var _needed = global.keys_needed - keys_collected;
    show_debug_message("Need " + string(_needed) + " more keys!");
    
}