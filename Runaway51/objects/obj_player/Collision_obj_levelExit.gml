// Check if player has collected at least 2 keys
if (keys_collected >= 2) {
    // Level complete!
    show_debug_message("Level Complete! Keys collected: " + string(keys_collected));
    
    // Go to next room (will implement later)
    // room_goto_next();
    
    // Show a game end message
    show_message("You finished the level!");
	
	 //Restart current room (for testing)
    room_restart();
    

} else {
    // Show message that player needs more keys
    show_debug_message("Need " + string(2 - keys_collected) + " more keys!");
}