local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://97216011555871"
humanoid.AnimationPlayed:Connect(function(track)
track:Stop()
end)
RunService.Heartbeat:Connect(function()
local playCount = math.random(30, 40)

for i = 1, playCount do
local track = humanoid:LoadAnimation(animation)
track:Play()
end
end)


StartButton.Text = "Start Lagging"
StartButton.MouseButton1Click:Connect(function()
    -- lag логика
end)
local isRunning = false

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = ContentFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0.5, -50, 0.75, 0)
StatusLabel.Size = UDim2.new(0, 100, 0, 20)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 12
StatusLabel.Text = "Status: OFF"
StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center

local function StartLag()
    if isRunning then return end
    isRunning = true

    StartButton.Text = "Stop Lagging"
    StatusLabel.Text = "Status: ON"
    StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 80)

    -- ТУК си остава твоята lag логика
end
local function StopLag()
    if not isRunning then return end
    isRunning = false

    StartButton.Text = "Start Lagging"
    StatusLabel.Text = "Status: OFF"
    StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)

    -- ТУК спираш connections / animations / tasks
end
StartButton.MouseButton1Click:Connect(function()
    if isRunning then
        StopLag()
    else
        StartLag()
    end
end)
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
