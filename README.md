# Blox Fruits Auto Farm Script

A powerful Lua automation script for Blox Fruits in Roblox, optimized for **Delta Executor**.

## Features

✅ **Auto Farm** - Automatically attacks nearest enemies to gain experience  
✅ **Bounty Hunt** - Targets and hunts bounty NPCs for rewards  
✅ **Kill Aura** - Attacks all enemies within a specified range  
✅ **Auto Attack** - Automatically clicks to attack targets  
✅ **Auto Block** - Automatically blocks incoming damage  
✅ **Item Grabbing** - Auto-collects dropped items  
✅ **Respawn Handling** - Continues farming after respawn  
✅ **Toggle Commands** - Easy on/off controls for each feature  

## Installation

### Using Delta Executor:
1. Download **Delta Executor** from the official source
2. Open Delta Executor
3. Load `delta_executor.lua` script
4. Click **Execute**
5. Use hotkeys to control features

### Script Files:
- `delta_executor.lua` - Main Delta Executor optimized script
- `generic.lua` - Generic script for other executors
- `config.lua` - Configuration file

## Controls

| Key | Action |
|-----|--------|
| **F6** | Stop Script |
| **F7** | Toggle Auto Attack |
| **F8** | Toggle Auto Block |
| **F9** | Toggle Kill Aura |

## Configuration

Edit the `CONFIG` section in the script to customize:

```lua
local CONFIG = {
    AUTO_FARM = true,           -- Enable auto farming
    HUNT_BOUNTY = true,         -- Enable bounty hunting
    AUTO_ATTACK = true,         -- Auto click to attack
    AUTO_BLOCK = true,          -- Auto block damage
    GRAB_ITEMS = true,          -- Pick up dropped items
    KILL_AURA = false,          -- Attack all nearby enemies
    KILL_AURA_RANGE = 50,       -- Range for kill aura
    FARM_SPEED = 0.1,           -- Speed of farming loop
    STOP_KEY = Enum.KeyCode.F6, -- Key to stop script
    DEBUG = true                -- Show debug messages
}
```

## Requirements

- ✅ Roblox Game
- ✅ Delta Executor (or compatible Roblox executor)
- ✅ Blox Fruits Game
- ✅ At least Level 1 character

## WARNING ⚠️

**Disclaimer:** This script is for educational purposes only. Use at your own risk:
- May violate Roblox Terms of Service
- Can result in account suspension or ban
- Use on secondary accounts recommended
- Roblox actively detects automation

## Features in Detail

### Auto Farm
- Automatically finds and attacks nearest enemies
- Moves towards targets and attacks continuously
- Great for leveling up quickly

### Bounty Hunt
- Detects and hunts bounty target NPCs
- Prioritizes bounty enemies over regular ones
- Auto-grabs bounty rewards

### Kill Aura
- Attacks all enemies within specified range
- Useful for mob grinding
- Configurable range (default: 50 studs)

### Item Grabbing
- Automatically collects dropped items
- Useful for looting after fights
- Works with dropped tools and items

## Troubleshooting

**Script not running?**
- Make sure Delta Executor is running
- Check if game is fully loaded
- Verify you're in Blox Fruits game

**Getting kicked?**
- Roblox detected automation
- Try reducing FARM_SPEED
- Use on alternate account

**Enemies not dying?**
- Check if AUTO_ATTACK is enabled
- Verify your character's combat level
- Check if you have proper weapons equipped

## Updates & Support

For updates and support:
- Check GitHub releases
- Report issues in Issues section
- Pull requests welcome!

## License

MIT License - Feel free to modify and redistribute

## Credits

Created for Blox Fruits community  
Compatible with Delta Executor

---

**Last Updated:** May 2026  
**Version:** 1.0  
**Status:** Active & Maintained
