local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local enabled = true -- start ON

-- YOUR WHITELIST (shortened example, you can paste full list)
local whitelist = {
	507770677,
	507765644,
	180435571,
	180426354,
}

local whitelistSet = {}
for _, id in ipairs(whitelist) do
	whitelistSet[id] = true
end

local function isWhitelisted(id)
	return whitelistSet[id] == true
end

local function monitorCharacter(character)
	local humanoid = character:WaitForChild("Humanoid")

	RunService.Heartbeat:Connect(function()
		if not enabled then return end

		for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
			local anim = track.Animation
			if anim and anim.AnimationId then
				local id = tonumber(anim.AnimationId:match("%d+"))
				if id and not isWhitelisted(id) then
					track:Stop()
				end
			end
		end
	end)
end

if player.Character then
	monitorCharacter(player.Character)
end

player.CharacterAdded:Connect(monitorCharacter)

-- SIMPLE TOGGLE (chat command)
player.Chatted:Connect(function(msg)
	msg = msg:lower()
	if msg == "!start" then
		enabled = true
		warn("Animation blocker ENABLED")
	elseif msg == "!stop" then
		enabled = false
		warn("Animation blocker DISABLED")
	end
end)
