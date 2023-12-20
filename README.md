# Dodge the Creeps

### Welcome to Dodge the Creeps!

This is a simple 2D game created using the Godot game engine. The objective of the game is to control the player character and avoid colliding with the randomly spawning monsters. The longer you survive, the higher your score!

## How to Play

* **Movement**: Use arrow keys or W, A, S, D keys to navigate the player character.
* **Start the Game**: Click the "Start" button to begin a new game.
* **Survival**: Dodge the monsters to increase your score.
* **Game Over**: The game ends when you collide with a monster. You can start a new game by clicking the "Start" button again.

## Code Overview

### Main

The Main script serves as the main control for the game. It includes functions to start a new game, initiate the game, handle game over events, and manage the score. The game features enemy spawning, point scoring, and timers to control various aspects.

### HUD

The HUD script handles the Heads-Up Display (HUD) elements, such as displaying messages, updating the score, and managing the game-over screen. It emits signals to communicate with the main script, indicating when the game should start.

### Player

The Player script controls the player character. It includes functionality for player movement, animation, and collision detection. The player's position is constrained within the screen boundaries.

### Enemy

The Enemy script manages the behavior of the monster characters. Each enemy has a random appearance, and they move at varying speeds. The enemy_visibility function is used to remove an enemy from the scene.

## How to Run

To play the game, navigate to the "executables" folder and download a version of the game. Run the executable, and enjoy dodging the creeps!

**Note**: This game was created by Mayrton Eduardo with the assistance of Godot documentation.

Feel free to explore and modify the code to enhance or customize the game further.

Have fun playing Dodge the Creeps! If you encounter any issues or have suggestions, please don't hesitate to reach out.
