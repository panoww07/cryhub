local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local active = false


local confusionIds = {
    "rbxassetid://507766388", -
    "rbxassetid://180435509", 
    "rbxassetid://125750702", 
    "rbxassetid://333349950", 
    "rbxassetid://35654637"   
}

UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.K then
        active = not active
        warn("Confusion Mode:", active)
    end
end)

RunService.Heartbeat:Connect(function()
    if not active then return end

    local char = player.Character
    local animator = char and char:FindFirstChildOfClass("Humanoid") and char.Humanoid:FindFirstChildOfClass("Animator")

    if animator then
        
        for i = 1, 30 do 
            local anim = Instance.new("Animation")
            anim.AnimationId = confusionIds[math.random(1, #confusionIds)]
            
            local track = animator:LoadAnimation(anim)
            
            
            track:Play(0.1, math.random(1, 10), math.random(5, 20))
            
            
            track:Stop(0)
            track:Destroy()
            anim:Destroy()
        end
    end
end)
