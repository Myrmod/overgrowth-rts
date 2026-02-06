# Open RTS

![Open RTS](./media/screenshots/screenshot_1400x650.png "Open RTS")

Open Source real-time strategy game made with Godot 4.

## Purposes of this project

This game is not going to be a very advanced RTS that would compete with other games of this genre. Instead, it will focus on simplicity and clean design so that it can:
 - showcase Godot 4 capabilities in terms of developing RTS games
 - provide an open-source project template for creating RTS games
 - educate game creators on creating RTS game mechanics

## Features

 - [x] 1 species
 - [x] 2 resources
 - [x] terrain and air units
 - [x] deathmatch mode (human vs AI or AI vs AI)
 - [x] runtime player switching
 - [x] basic fog of war
 - [x] units disappearing in fog of war
 - [x] minimap
 - [x] swarm movement to position
 - [ ] swarm movement to unit
 - [x] simple UI
 - [ ] polished UI
 - [ ] sounds
 - [ ] music
 - [ ] VFX

## Godot compatibility

This project is compatible with Godot `4.6`.

## Screenshots

![Screenshot 1](./media/screenshots/screenshot_2_1920x1080.png "Screenshot 1")

![Screenshot 2](./media/screenshots/screenshot_3_1920x1080.png "Screenshot 2")

![Screenshot 3](./media/screenshots/screenshot_4_1920x1080.png "Screenshot 3")

## Contributing

Everyone is free to fix bugs or perform refactoring just by opening PR. As for features, please refer to existing issue or create one before starting implementation.

## Credits

### Core contributors
 - Myrmod

## FAQ

### How do replays work with the commands?
```
┌─────────────┐
│ Input / AI  │
└──────┬──────┘
       │  (create command)
       ▼
┌──────────────────┐
│   CommandBus     │  ← stores commands by tick
│ tick → [cmds]    │
└──────┬───────────┘
       │  (each tick)
       ▼
┌──────────────────┐
│      Match       │
│ _execute_command │
└──────┬───────────┘
       ▼
 Units / Buildings
```
