
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local active = false


local confusionIds = {
    "rbxassetid://507766388", 
    "rbxassetid://180435509", 
    "rbxassetid://333349950"
}


UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.K then
        active = not active
        warn("OVERDRIVE STATE:", active)
    end
end)


task.spawn(function()
    while true do
        if active then
            local char = player.Character
            local animator = char and char:FindFirstChildOfClass("Humanoid") and char.Humanoid:FindFirstChildOfClass("Animator")

            if animator then
                
                for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                    track:Stop(0)
                    track:Destroy()
                end

                
                for i = 1, 45 do -- 
                    local anim = Instance.new("Animation")
                    anim.AnimationId = confusionIds[math.random(1, #confusionIds)]
                    
                    local track = animator:LoadAnimation(anim)
                    
                    
                    
                    track:Play(0, 10, 100) 
                    
                    
                    task.spawn(function()
                        task.wait()
                        track:Destroy()
                        anim:Destroy()
                    end)
                end
            end
        end
        task.wait(0.03) 
    end
end)
