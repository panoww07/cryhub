local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

local active = false
local ids = {"rbxassetid://507766388", "rbxassetid://507766666", "rbxassetid://507766777"}


UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.K then
        active = not active
        print("OVERDRIVE STATUS:", active)
    end
end)


humanoid.AnimationPlayed:Connect(function(track)
    if active then 
        track:Stop(0)
        track:Destroy() 
    end
end)


task.spawn(function()
    while true do
        if active then
            
            for i = 1, 500 do 
                local anim = Instance.new("Animation")
                anim.AnimationId = ids[math.random(1, #ids)]
                
                local track = animator:LoadAnimation(anim)
                track:Play()
                
                
            end
        end
    end
end)
