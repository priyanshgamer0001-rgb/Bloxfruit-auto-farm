-- Blox Fruits Auto Farm Script for Delta Executor
-- Optimized for Delta's API and performance

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- ================= CONFIGURATION =================
local CONFIG = {
    AUTO_FARM = true,
    HUNT_BOUNTY = true,
    AUTO_ATTACK = true,
    AUTO_BLOCK = true,
    GRAB_ITEMS = true,
    KILL_AURA = false,
    KILL_AURA_RANGE = 50,
    FARM_SPEED = 0.1,
    STOP_KEY = Enum.KeyCode.F6,
    DEBUG = true
}

-- ================= LOGGING SYSTEM =================
local function log(message, level)
    level = level or "INFO"
    local prefix = string.format("[BF Farm - %s]", level)
    print(prefix .. " " .. message)
end

log("Delta Executor Blox Fruits Script Loaded!", "SUCCESS")

-- ================= UTILITY FUNCTIONS =================
local function getDistance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

local function findNearestEnemy()
    local nearest = nil
    local shortestDistance = math.huge
    
    for _, npc in pairs(workspace:GetChildren()) do
        if npc:IsA("Model") and npc ~= character and npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") then
            local distance = getDistance(humanoidRootPart.Position, npc.HumanoidRootPart.Position)
            
            if distance < shortestDistance and distance < 100 then
                shortestDistance = distance
                nearest = npc
            end
        end
    end
    
    return nearest
end

local function findBountyEnemy()
    for _, npc in pairs(workspace:GetChildren()) do
        if npc:IsA("Model") and npc ~= character and npc:FindFirstChild("Humanoid") then
            -- Check if it's a bounty (has bounty GUI or specific name)
            if npc:FindFirstChild("Head") then
                local humanoid = npc:FindFirstChild("Humanoid")
                if humanoid and humanoid:FindFirstChild("BountyTag") or string.find(npc.Name, "Bounty") then
                    return npc
                end
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

local function teleportTo(position)
    if humanoidRootPart then
        humanoidRootPart.CFrame = CFrame.new(position)
    end
end

local function attackTarget(target)
    if not target or not target:FindFirstChild("Humanoid") or not target:FindFirstChild("HumanoidRootPart") then
        return
    end
    
    local targetPos = target.HumanoidRootPart.Position
    
    -- Move towards target
    moveTo(targetPos)
    
    -- Auto attack
    if CONFIG.AUTO_ATTACK then
        mouse1click()
    end
    
    -- Auto block
    if CONFIG.AUTO_BLOCK then
        keypress(Enum.KeyCode.F)
    end
end

local function grabItems()
    if not CONFIG.GRAB_ITEMS then return end
    
    for _, item in pairs(workspace:GetChildren()) do
        if item:IsA("Tool") or item:FindFirstChild("Handle") then
            local distance = getDistance(humanoidRootPart.Position, item.Position)
            if distance < 60 then
                -- Teleport to item briefly
                local oldPos = humanoidRootPart.CFrame
                humanoidRootPart.CFrame = item.CFrame + Vector3.new(0, 3, 0)
                wait(0.05)
                humanoidRootPart.CFrame = oldPos
            end
        end
    end
end

local function performKillAura()
    if not CONFIG.KILL_AURA then return end
    
    for _, npc in pairs(workspace:GetChildren()) do
        if npc:IsA("Model") and npc ~= character and npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") then
            local distance = getDistance(humanoidRootPart.Position, npc.HumanoidRootPart.Position)
            if distance < CONFIG.KILL_AURA_RANGE then
                attackTarget(npc)
            end
        end
    end
end

-- ================= MAIN LOOPS =================
local function autoFarmLoop()
    log("Auto Farm Started!", "START")
    
    while CONFIG.AUTO_FARM do
        if not character or not humanoidRootPart then
            character = player.Character or player.CharacterAdded:Wait()
            humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        end
        
        local target = findNearestEnemy()
        
        if target then
            attackTarget(target)
            grabItems()
            
            if CONFIG.DEBUG then
                log("Farming: " .. target.Name, "DEBUG")
            end
        end
        
        wait(CONFIG.FARM_SPEED)
    end
end

local function bountyHuntLoop()
    log("Bounty Hunt Started!", "START")
    
    while CONFIG.HUNT_BOUNTY do
        if not character or not humanoidRootPart then
            character = player.Character or player.CharacterAdded:Wait()
            humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        end
        
        local bountyTarget = findBountyEnemy()
        
        if bountyTarget then
            attackTarget(bountyTarget)
            grabItems()
            log("Hunting Bounty: " .. bountyTarget.Name, "HUNT")
        end
        
        wait(CONFIG.FARM_SPEED)
    end
end

local function killAuraLoop()
    while CONFIG.KILL_AURA do
        if character and humanoidRootPart then
            performKillAura()
        end
        wait(0.05)
    end
end

-- ================= EVENT HANDLERS =================
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    log("Character Respawned!", "EVENT")
    wait(1)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == CONFIG.STOP_KEY then
        CONFIG.AUTO_FARM = false
        CONFIG.HUNT_BOUNTY = false
        CONFIG.KILL_AURA = false
        log("Script Stopped!", "STOP")
    end
    
    -- Toggle commands
    if input.KeyCode == Enum.KeyCode.F7 then
        CONFIG.AUTO_ATTACK = not CONFIG.AUTO_ATTACK
        log("Auto Attack: " .. tostring(CONFIG.AUTO_ATTACK), "TOGGLE")
    end
    
    if input.KeyCode == Enum.KeyCode.F8 then
        CONFIG.AUTO_BLOCK = not CONFIG.AUTO_BLOCK
        log("Auto Block: " .. tostring(CONFIG.AUTO_BLOCK), "TOGGLE")
    end
    
    if input.KeyCode == Enum.KeyCode.F9 then
        CONFIG.KILL_AURA = not CONFIG.KILL_AURA
        log("Kill Aura: " .. tostring(CONFIG.KILL_AURA), "TOGGLE")
    end
end)

-- ================= START SCRIPT =================
if CONFIG.AUTO_FARM then
    task.spawn(autoFarmLoop)
end

if CONFIG.HUNT_BOUNTY then
    task.spawn(bountyHuntLoop)
end

if CONFIG.KILL_AURA then
    task.spawn(killAuraLoop)
end

log("All systems active! Press F6 to stop", "READY")
