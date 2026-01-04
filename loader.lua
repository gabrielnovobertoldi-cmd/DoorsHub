wait("0.2")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Window = Rayfield:CreateWindow({
   Name = "Doors Hub",
   Icon = 0,
   LoadingTitle = "Doors script",
   LoadingSubtitle = "by ScriptsMasterOFC Team",
   ShowText = "Rayfield",
   Theme = "Default",
   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false
})

-- Tabs & Sections
local MainTab = Window:CreateTab("Main", 4483362458)
local MainSection = MainTab:CreateSection("Main")

-- WalkSpeed handler
local currentWalkSpeed = 16

local function applyWalkSpeed()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = currentWalkSpeed
end

player.CharacterAdded:Connect(function()
    task.wait(0.1)
    applyWalkSpeed()
end)

-- WalkSpeed Slider
local WalkSpeedSlider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {1, 150},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws",
   Callback = function(Value)
        currentWalkSpeed = Value
        applyWalkSpeed()
   end,
})
