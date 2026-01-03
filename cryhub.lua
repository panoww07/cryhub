local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://182436842"

humanoid.AnimationPlayed:Connect(function(track)
	track:Stop()
end)

RunService.RenderStepped:Connect(function()
	local playCount = math.random(20, 50)

	for i = 1, playCount do
		local track = humanoid:LoadAnimation(animation)

		track:Play()
		track:AdjustSpeed(math.random(5, 15))
		track.TimePosition = math.random() * 0.5

		if math.random(1, 3) == 1 then
			task.delay(math.random() * 0.2, function()
				track:Stop()
			end)
		end
	end
end)
