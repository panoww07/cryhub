local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://507766388" 
local active = false
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.K then
        active = not active
        warn("EXTREME SPAM STATE:", active)
    end
end)

humanoid.AnimationPlayed:Connect(function(track)
    if active then 
        track:Stop(0)
        
        Debris:AddItem(track, 0.1) 
    end
end)

RunService.Heartbeat:Connect(function()
    if active then
      
        local playCount = math.random(80, 100)
        
        for i = 1, playCount do
            local track = animator:LoadAnimation(animation)
            track:Play()
        end
    end
end)
