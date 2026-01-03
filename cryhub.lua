local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://182436842"

local tracks = {}

RunService.Heartbeat:Connect(function()
	-- random burst
	for i = 1, math.random(5, 15) do
		local track = humanoid:LoadAnimation(animation)
		table.insert(tracks, track)

		track:Play()
		track:AdjustSpeed(math.random(-1000, 2000))
		track.TimePosition = math.random() * track.Length
	end

	-- randomly kill tracks
	for i = #tracks, 1, -1 do
		if math.random() < 0.4 then
			pcall(function()
				tracks[i]:Stop()
			end)
			table.remove(tracks, i)
		end
	end
end)
