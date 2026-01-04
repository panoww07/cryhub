local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://5937560570"
humanoid.AnimationPlayed:Connect(function(track)
track:Stop()
end)
RunService.Heartbeat:Connect(function()
local playCount = math.random(500, 800)

for i = 1, playCount do
local track = humanoid:LoadAnimation(animation)
track:Play()
end
end)
