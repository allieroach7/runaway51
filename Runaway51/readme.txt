Runaway 51
Gold Standard Studios Team Members: Allison Roach, Jeevith Doddalingegowda Rama, Summer Lewin-Staley, Nathan Kufel

1. Game Instructions
Use the arrow keys to move.

Left/Right Arrow = move
Up Arrow = jump
Up/Down Arrow = climb ladders
Q = fire the alien beam to stun guards
R = restart the game
Collect the required keys, avoid guards, and reach the exit. You lose a life when a guard hits you. When your lives reach 0, the game goes to the Game Over screen.

2. Game Walkthrough
Tutorial (rm_tutorial): Collect 2 keys, learn movement and ladders, then reach the exit on the right side.
Level 1 (rm_level): Collect 6 keys, avoid the guards, use the ladder routes and upper platforms, then exit once the key counter is full.
Level 2 (rm_level2): Collect 6 keys, deal with the tighter guard layout and vertical route, then reach the exit to finish the game.
3. Cheat Codes
Q = fire the alien beam attack
1 = set player lives to 3
2 = collect all keys for the current level
3 = skip to the next room
4 = stun all guards
5 = instant win
6 = instant game over
7 = save the game to savegame.txt
8 = load the game from savegame.txt
9 = not used
R = restart the game from the beginning
4. Project Theme
Runaway 51 leans into an Area 51 escape theme by casting the player as a trapped alien breaking out of a secret facility. The title screen, jail and lab-style backgrounds, guard patrols, key-gated exits, stun beam, and red alert shader all reinforce the sense of a tense breakout. Each room increases pressure as the alien moves deeper through the base, collecting access keys while staying ahead of security.

Graduate-Level Features (ITCS 5230)
Smart AI : Guard uses a 4-state FSM (Patrol, Suspicious, Chase, Incapacitated) with detection cone, line of sight, and close-range hearing. (obj_officer)
Object Inheritance : obj_enemy_parent handles shared enemy gravity and physics. obj_officer inherits and adds patrol/chase behavior.
Views : Camera follows the player in gameplay rooms using camera_set_view_pos. (obj_player Step Event)
Shader : shd_alert applies red tint to player and dark border glow on screen when a guard is chasing. (obj_player Draw and Draw GUI Events)
Particles : Three particle effects — green burst on beam hit, red burst when player is hit, gold sparkle on key collect. (obj_particle_manager)
File Save/Load : Press 7 to save progress (room, lives, keys) to file. Press 8 to load. (obj_player Step Event)


6. Licensing Information
