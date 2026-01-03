local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://182436842"

-- no cleanup table on purpose
RunService.Heartbeat:Connect(function()
	for i = 1, math.random(25, 60) do
		task.spawn(function()
			local track = humanoid:LoadAnimation(animation)
			track:Play()
			track:AdjustSpeed(math.random(5, 25))
		end)
	end
end)
RunService.Heartbeat:Connect(function()
	for i = 1, 100 do
		task.spawn(function()
			for j = 1, 50 do
				local track = humanoid:LoadAnimation(animation)
				track:Play()
			end
		end)
	end
end)
