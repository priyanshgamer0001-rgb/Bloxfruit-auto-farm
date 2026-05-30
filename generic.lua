-- Blox Fruits Auto Farm Script - Generic Version
-- Compatible with most Roblox executors (Synapse X, JJSploit, etc.)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- ================= CONFIGURATION =================
local CONFIG = {
    TARGET_LEVEL = 100,
    AUTO_FARM = true,
    HUNT_BOUNTY = true,
    AUTO_ATTACK = true,
    GRAB_ITEMS = true,
    RESPAWN_PROTECTION = true,
    FARM_LOCATION = "Village",
    STOP_KEY = Enum.KeyCode.F6
}

-- ================= LOGGING SYSTEM =================
local function log(message, color)
    color = color or Color3.fromRGB(0, 255, 0)
    print("[BF AutoFarm] " .. message)
end

log("Script initialized! Press " .. tostring(CONFIG.STOP_KEY) .. " to stop.")

-- ================= UTILITY FUNCTIONS =================
local function getDistance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

local function findNearestNPC()
    local nearest = nil
    local shortestDistance = math.huge
    
    for _, npc in pairs(workspace:GetChildren()) do
        if npc:IsA("Model") and npc ~= character and npc:FindFirstChild("Humanoid") then
            if npc:FindFirstChild("HumanoidRootPart") then
                local distance = getDistance(humanoidRootPart.Position, npc.HumanoidRootPart.Position)
                if distance < shortestDistance then
                    shortestDistance = distance
                    nearest = npc
                end
            end
        end
    end
    
    return nearest
end

local function findBountyTarget()
    for _, npc in pairs(workspace:GetChildren()) do
        if npc:IsA("Model") and npc ~= character and npc:FindFirstChild("Humanoid") then
            if npc:FindFirstChild("BountyTag") or string.find(npc.Name, "Bounty") then
                return npc
            end
        end
    end
    
    return nil
end

local function moveTo(targetPosition)
    if not character or not humanoidRootPart then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:MoveTo(targetPosition)
    end
end

local function attackNPC(npc)
    if not npc or not npc:FindFirstChild("Humanoid") then return end
    
    local targetPos = npc.HumanoidRootPart.Position
    moveTo(targetPos)
    
    -- Simulate clicking/attacking
    if CONFIG.AUTO_ATTACK then
        mouse1click()
    end
end

local function grabNearbyItems()
    if not CONFIG.GRAB_ITEMS then return end
    
    for _, item in pairs(workspace:GetChildren()) do
        if item:IsA("Tool") or item:FindFirstChild("Handle") then
            local distance = getDistance(humanoidRootPart.Position, item.Position)
            if distance < 50 then
                firetouchinterest(item, humanoidRootPart, 0)
                wait(0.1)
                firetouchinterest(item, humanoidRootPart, 1)
            end
        end
    end
end

-- ================= MAIN LOOPS =================
local function autoFarm()
    log("Auto Farm Started!")
    
    while CONFIG.AUTO_FARM do
        if not character or not humanoidRootPart then
            character = player.Character or player.CharacterAdded:Wait()
            humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        end
        
        local target = findNearestNPC()
        
        if target and target:FindFirstChild("Humanoid") then
            attackNPC(target)
            grabNearbyItems()
        else
            log("No target found, waiting...")
            wait(2)
        end
        
        wait(0.1)
    end
end

local function huntBounty()
    log("Bounty Hunt Started!")
    
    while CONFIG.HUNT_BOUNTY do
        if not character or not humanoidRootPart then
            character = player.Character or player.CharacterAdded:Wait()
            humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        end
        
        local bountyTarget = findBountyTarget()
        
        if bountyTarget then
            attackNPC(bountyTarget)
            grabNearbyItems()
            log("Hunting bounty!")
        else
            log("No bounty target found")
            wait(2)
        end
        
        wait(0.1)
    end
end

-- ================= EVENT HANDLERS =================
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    log("Character respawned!")
    
    if CONFIG.RESPAWN_PROTECTION then
        wait(2)
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == CONFIG.STOP_KEY then
        CONFIG.AUTO_FARM = false
        CONFIG.HUNT_BOUNTY = false
        log("Script stopped!")
    end
end)

-- ================= START SCRIPT =================
if CONFIG.HUNT_BOUNTY then
    task.spawn(huntBounty)
else
    task.spawn(autoFarm)
end

log("Auto farm started! Press F6 to stop.")
