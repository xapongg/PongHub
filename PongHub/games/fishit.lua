-- PongHub | Fish It
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

-- UI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "PongHub - Fish It",
    Icon = "fish",
    Folder = "PongHub/FishIt"
})

-- Tabs
local Farm = Window:CreateTab("Farm", "zap")
local Teleport = Window:CreateTab("Teleport", "map")
local Misc = Window:CreateTab("Misc", "settings")

--------------------------------------------------
-- STATES
--------------------------------------------------
local State = {
    AutoFish = false,
    AutoSell = false,
    AntiAFK = true
}

--------------------------------------------------
-- AUTO FISH (HOOK TEMPLATE)
--------------------------------------------------
Farm:CreateToggle({
    Name = "Auto Fish",
    Callback = function(v)
        State.AutoFish = v
    end
})

task.spawn(function()
    while task.wait(0.4) do
        if State.AutoFish then
            -- TODO:
            -- fire cast
            -- detect bite
            -- reel fish
        end
    end
end)

--------------------------------------------------
-- AUTO SELL
--------------------------------------------------
Farm:CreateToggle({
    Name = "Auto Sell",
    Callback = function(v)
        State.AutoSell = v
    end
})

task.spawn(function()
    while task.wait(2) do
        if State.AutoSell then
            -- TODO:
            -- sell fish
        end
    end
end)

--------------------------------------------------
-- TELEPORT
--------------------------------------------------
local Spots = {
    ["Spawn"] = CFrame.new(0,5,0),
    ["Dock"] = CFrame.new(120,5,60),
    ["Ocean"] = CFrame.new(500,10,-300)
}

for name, cf in pairs(Spots) do
    Teleport:CreateButton({
        Name = name,
        Callback = function()
            if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                LP.Character.HumanoidRootPart.CFrame = cf
            end
        end
    })
end

--------------------------------------------------
-- ANTI AFK
--------------------------------------------------
Misc:CreateToggle({
    Name = "Anti AFK",
    Default = true,
    Callback = function(v)
        State.AntiAFK = v
    end
})

LP.Idled:Connect(function()
    if State.AntiAFK then
        local vu = game:GetService("VirtualUser")
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end
end)

--------------------------------------------------
-- NOTIFY
--------------------------------------------------
WindUI:Notify({
    Title = "PongHub",
    Content = "Fish It loaded successfully 🐟",
    Duration = 4
})

