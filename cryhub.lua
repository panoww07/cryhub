local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://182436842"

-- DO NOT stop the same animation you're forcing
humanoid.AnimationPlayed:Connect(function(track)
	if track.Animation ~= animation then
		track:Stop()
	end
end)

RunService.Heartbeat:Connect(function()
	local playCount = math.random(10, 25)

	for i = 1, playCount do
		local track = humanoid:LoadAnimation(animation)
		track:Play()
		track:AdjustSpeed(math.random(6, 12))
	end

	task.wait(0.05) -- REQUIRED for executors
end)

