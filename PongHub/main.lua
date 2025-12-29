-- Load WindUI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- Window
local Window = WindUI:CreateWindow({
    Title = "PongHub",
    Icon = "zap",
    Author = "Pong",
    Folder = "PongHub",
    Theme = "Dark",
    Transparency = 0.15
})

-- Tabs
local Home = Window:CreateTab("Home", "home")
local GameTab = Window:CreateTab("Game", "gamepad")
local Settings = Window:CreateTab("Settings", "settings")

Home:CreateLabel("✅ Key verified by Luarmor")
Home:CreateLabel("🔍 Auto Detect Game System")

--------------------------------------------------
-- AUTO DETECT SYSTEM
--------------------------------------------------
local Games = {
    [121864768012064] = {
        Name = "Fish It",
        File = "fishit.lua",
        Icon = "fish"
    }
}

local Detected = Games[game.PlaceId]

if Detected then
    Home:CreateLabel("🎮 Detected: "..Detected.Name)

    GameTab:CreateButton({
        Name = "Load "..Detected.Name,
        Callback = function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/xapongg/PongHub/refs/heads/main/PongHub/games/"..Detected.File
            ))()
        end
    })

else
    Home:CreateLabel("❌ Game not supported")
    GameTab:CreateLabel("No scripts available")
end

--------------------------------------------------
-- SETTINGS
--------------------------------------------------
Settings:CreateButton({
    Name = "Unload PongHub",
    Callback = function()
        Window:Destroy()
    end
})


