-- Configuration File for Blox Fruits Auto Farm
-- Customize these settings to match your preferences

return {
    -- ========== CORE FEATURES ==========
    AUTO_FARM = true,              -- Enable auto farming mode
    HUNT_BOUNTY = true,            -- Enable bounty hunting
    KILL_AURA = false,             -- Attack all enemies in range
    
    -- ========== ATTACK SETTINGS ==========
    AUTO_ATTACK = true,            -- Automatically click to attack
    AUTO_BLOCK = true,             -- Automatically block damage
    KILL_AURA_RANGE = 50,          -- Range for kill aura (in studs)
    
    -- ========== ITEM COLLECTION ==========
    GRAB_ITEMS = true,             -- Automatically grab dropped items
    ITEM_GRAB_RANGE = 60,          -- Range to grab items
    
    -- ========== PERFORMANCE ==========
    FARM_SPEED = 0.1,              -- Loop speed (lower = faster, higher = smoother)
    DEBUG = true,                  -- Show debug messages in console
    RESPAWN_PROTECTION = true,     -- Wait after respawn before resuming
    
    -- ========== KEYBINDS ==========
    STOP_KEY = Enum.KeyCode.F6,    -- Stop/pause script
    TOGGLE_ATTACK = Enum.KeyCode.F7,   -- Toggle auto attack
    TOGGLE_BLOCK = Enum.KeyCode.F8,    -- Toggle auto block
    TOGGLE_KILL_AURA = Enum.KeyCode.F9, -- Toggle kill aura
    
    -- ========== DETECTION RANGE ==========
    ENEMY_DETECTION_RANGE = 100,   -- How far to detect enemies
    BOUNTY_PRIORITY = true,        -- Prioritize bounty targets
    
    -- ========== ADVANCED ==========
    TARGET_LEVEL = 100,            -- Target farming level
    FARM_LOCATION = "Village",     -- Default farm location
    AUTO_TELEPORT = false,         -- Auto teleport to farm location
    USE_ABILITIES = false,         -- Use combat abilities (if available)
}
