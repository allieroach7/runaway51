# Runaway 51
**Gold Standard Studios**
**Team Members:** Allison Roach, Jeevith Doddalingegowda Rama, Summer Lewin-Staley, Nathan Kufel

## 1. Game Instructions
Use the arrow keys to move.
* **Left/Right Arrow** = move
* **Up Arrow** = jump
* **Up/Down Arrow** = climb ladders
* **Q** = fire the alien beam to stun guards
* **R** = restart the game

Collect the required keys, avoid guards, and reach the exit. You lose a life when a guard hits you. When your lives reach 0, the game goes to the Game Over screen.

## 2. Game Walkthrough
* **Tutorial (`rm_tutorial`):** Collect 2 keys, learn movement and ladders, then reach the exit on the right side.
* **Level 1 (`rm_level`):** Collect 6 keys, avoid the guards, use the ladder routes and upper platforms, then exit once the key counter is full.
* **Level 2 (`rm_level2`):** Collect 6 keys, deal with the tighter guard layout and vertical route, then reach the exit to finish the game.

## 3. Cheat Codes
* **Q** = fire the alien beam attack
* **1** = set player lives to 3
* **2** = collect all keys for the current level
* **3** = skip to the next room
* **4** = stun all guards
* **5** = instant win
* **6** = instant game over
* **7** = save the game to `savegame.txt`
* **8** = load the game from `savegame.txt`
* **9** = not used
* **R** = restart the game from the beginning

## 4. Project Theme
Runaway 51 leans into an Area 51 escape theme by casting the player as a trapped alien breaking out of a secret facility. The title screen, jail and lab-style backgrounds, guard patrols, key-gated exits, stun beam, and red alert shader all reinforce the sense of a tense breakout. Each room increases pressure as the alien moves deeper through the base, collecting access keys while staying ahead of security.

## 5. Graduate-Level Features (ITCS 5230)
* **Smart AI (3 points):** Implemented in `objects/obj_officer/Create_0.gml` and `objects/obj_officer/Step_0.gml`. The officer uses an `OFFICER_STATE` enum with `PATROL`, `SUSPICIOUS`, `CHASE`, and `INCAPACITATED` states, plus detection ranges and timers. Patrol helper logic is supported by `scripts/update_patrol_boundaries/update_patrol_boundaries.gml` and `scripts/recreate_patrol_path_at_current_position/recreate_patrol_path_at_current_position.gml`.
* **Object Inheritance (3 points):** `objects/obj_officer/obj_officer.yy` inherits from `objects/obj_enemy_parent/obj_enemy_parent.yy`. Shared enemy motion is initialized in `objects/obj_enemy_parent/Create_0.gml` and `objects/obj_enemy_parent/Step_0.gml`, and the officer calls `event_inherited()`.
* **Views (2 points):** Camera follow logic is in `objects/obj_player/Step_0.gml`. When views are enabled, the camera is moved with `camera_set_view_pos()` to follow the player during gameplay rooms.
* **Shader (4 points):** The alert shader is defined in `shaders/shd_alert/shd_alert.fsh` and `shaders/shd_alert/shd_alert.vsh`. It is applied in `objects/obj_player/Draw_0.gml`, with the border glow drawn in `objects/obj_player/Draw_64.gml` when a guard is chasing.
* **Advanced Feature 1 - Particles:** Particle systems are created in `objects/obj_particle_manager/Create_0.gml` and cleaned up in `objects/obj_particle_manager/CleanUp_0.gml`. Beam hit particles, player hit particles, and key collect particles are triggered from `objects/obj_officer/Collision_obj_beam.gml`, `objects/obj_player/Step_0.gml`, and `objects/obj_player/Collision_obj_key.gml`.
* **Advanced Feature 2 - File Save/Load:** Save and load are implemented in `objects/obj_player/Step_0.gml` using `file_text_open_write()`, `file_text_open_read()`, and `savegame.txt`. The save data stores the room, player lives, collected keys, and key requirement.

## 6. Licensing Information
