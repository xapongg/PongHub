-- Load WindUI
local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/source.lua"
))()

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
                "https://raw.githubusercontent.com/USERNAME/PongHub/main/games/"..Detected.File
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
