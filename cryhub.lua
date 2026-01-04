local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")


local ids = {
    "rbxassetid://507766388", 
    "rbxassetid://507766666", 
    "rbxassetid://507766777", 
    "rbxassetid://913376220",
    "rbxassetid://1083214730"
}

local active = false
local currentIdIndex = 1


UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.K then
        active = not active
        warn("SPEED MODE ACTIVE:", active)
    end
end)


humanoid.AnimationPlayed:Connect(function(track)
    if active then 
        track:Stop(0)
        track:Destroy() 
    end
end)


RunService.Heartbeat:Connect(function()
    if active then
        
        currentIdIndex = (currentIdIndex % #ids) + 1
        local animation = Instance.new("Animation")
        animation.AnimationId = ids[currentIdIndex]

        
        for i = 1, 150 do 
            local track = animator:LoadAnimation(animation)
            track:Play()
        end
        
       
        animation:Destroy()
    end
end)
