local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://5937560570" 

local tracks = {}

for i = 1, 300 do
    local track = animator:LoadAnimation(animation)
    track.Priority = Enum.AnimationPriority.Action4
    tracks[i] = track
end

RunService.Heartbeat:Connect(function()
    
    local playCount = math.random(500, 800) 
    
    for i = 1, playCount do
        local track = tracks[math.random(1, #tracks)]
        
        
        track:Play(0.000001, 10, math.random(15, 150)) 
        
        
        track.TimePosition = math.random(0, 1000) / 100
        
        task.spawn(function()
            RunService.RenderStepped:Wait() 
            track:Stop(0)
        end)
    end
end)
