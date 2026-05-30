# Installation Guide - Blox Fruits Auto Farm

## Prerequisites
- Roblox account
- Delta Executor or compatible Roblox executor
- Blox Fruits game open and loaded

## Step-by-Step Installation

### For Delta Executor Users (Recommended)

1. **Download Delta Executor**
   - Visit the official Delta Executor website
   - Download the latest version
   - Extract to a folder

2. **Open the Script File**
   - Copy the code from `delta_executor.lua`
   - Open Delta Executor
   - Paste the script into the script box

3. **Execute the Script**
   - Make sure you're in Blox Fruits game
   - Click the "Execute" or "Run" button
   - You should see confirmation messages in console

4. **Verify It's Running**
   - Check the Roblox command output (F9 key)
   - You should see: `[BF Farm - SUCCESS] Delta Executor Blox Fruits Script Loaded!`

### For Other Executors

1. **Copy the Generic Script**
   - Use code from `generic.lua` if Delta Executor doesn't work
   - Follow the same execution steps

2. **Paste & Execute**
   - Paste into your executor
   - Run the script

## Using the Script

### Basic Usage
- Script starts automatically farming when executed
- Monitor console for activity messages

### Hotkeys
| Key | Function |
|-----|----------|
| F6 | Stop/Pause script |
| F7 | Toggle Auto Attack |
| F8 | Toggle Auto Block |
| F9 | Toggle Kill Aura |

### Initial Configuration
Before running, you may want to edit `CONFIG` in the script:

```lua
local CONFIG = {
    AUTO_FARM = true,           -- Set to false to disable farming
    HUNT_BOUNTY = true,        -- Set to false to disable bounty hunting
    KILL_AURA = false,         -- Set to true to enable kill aura
    FARM_SPEED = 0.1,          -- Adjust farming speed (0.05-0.5)
}
```

## Troubleshooting

### Script Not Executing
- **Solution:** Check if Delta Executor is running in Admin mode
- Make sure Blox Fruits game is fully loaded
- Try restarting the executor

### Script Executes But Nothing Happens
- Check if you're actually in Blox Fruits game
- Verify character is spawned (not in menu)
- Check console (F9) for error messages
- Try disabling all features except AUTO_FARM

### Getting Kicked/Banned
- Roblox detected automation
- Consider using:
  - Lower FARM_SPEED (slower = less detectable)
  - Alternate account for testing
  - Variable delays in attacks
  
### Game Lag or Performance Issues
- Increase FARM_SPEED value (0.2, 0.3, etc.)
- Disable GRAB_ITEMS
- Disable KILL_AURA
- Close other applications

## Safety Tips

⚠️ **Important Safety Recommendations:**

1. **Use Alt Account**
   - Test on secondary account first
   - Main account safety is priority

2. **Disable Anti-Cheat Detection**
   - Enable Debug mode to monitor script behavior
   - Watch console for unusual activity

3. **Randomize Behavior**
   - Don't farm 24/7
   - Mix farming locations
   - Vary farming speed

4. **Regular Breaks**
   - Don't farm continuously for hours
   - Take breaks between sessions

## Common Issues & Fixes

### Issue: "humanoidRootPart is nil"
**Fix:** Wait for character to fully load before executing script

### Issue: Script stops after a few minutes
**Fix:** Add respawn handling delay, check if you're getting disconnected

### Issue: Enemies don't die
**Fix:** 
- Check AUTO_ATTACK is enabled (F7)
- Verify character has weapon equipped
- Check enemy health

### Issue: Script freezes game
**Fix:** 
- Increase FARM_SPEED value
- Disable GRAB_ITEMS feature
- Reduce KILL_AURA_RANGE

## Advanced Configuration

Edit the CONFIG table for advanced settings:

```lua
CONFIG.FARM_SPEED = 0.05        -- Faster farming (may cause lag)
CONFIG.KILL_AURA_RANGE = 75     -- Bigger attack range
CONFIG.AUTO_BLOCK = false       -- Disable auto blocking
CONFIG.DEBUG = false            -- Disable debug messages
```

## Need More Help?

- Check the README.md for feature explanations
- Review the source code comments
- Create an issue on GitHub
- Check related Roblox scripting communities

---

**Last Updated:** May 2026  
**Version:** 1.0
