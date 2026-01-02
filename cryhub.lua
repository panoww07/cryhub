-- CryHub Loader Script (Start / Stop)

local RunService = game:GetService("RunService")

local running = false
local conn

local function startLag()
    if running then return end
    running = true

    conn = RunService.Heartbeat:Connect(function()
        for i = 1, 1000 do
            math.random()
        end
    end)

    -- индикатор
    local g = Instance.new("ScreenGui", game.CoreGui)
    g.Name = "CryHubUI"
    local t = Instance.new("TextLabel", g)
    t.Size = UDim2.fromScale(1, 0.1)
    t.TextScaled = true
    t.Text = "CRYHUB RUNNING"
    t.BackgroundColor3 = Color3.new(0, 0, 0)
    t.TextColor3 = Color3.new(1, 1, 1)

    warn("[CryHub] STARTED")
end

local function stopLag()
    running = false
    if conn then conn:Disconnect() conn = nil end

    if game.CoreGui:FindFirstChild("CryHubUI") then
        game.CoreGui.CryHubUI:Destroy()
    end

    warn("[CryHub] STOPPED")
end

getgenv().CryHub_Start = startLag
getgenv().CryHub_Stop = stopLag

-- auto start
startLag()
