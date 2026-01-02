-- CryHub Start / Stop (STABLE VERSION)

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local running = false
local connection

-- START
local function startLag()
    if running then return end
    running = true

    connection = RunService.Heartbeat:Connect(function()
        -- прост, но работещ lag
        for i = 1, 500 do
            math.random()
        end
    end)

    warn("[CryHub] STARTED")
end

-- STOP
local function stopLag()
    if not running then return end
    running = false

    if connection then
        connection:Disconnect()
        connection = nil
    end

    warn("[CryHub] STOPPED")
end

-- глобални функции
getgenv().CryHub_Start = startLag
getgenv().CryHub_Stop = stopLag

-- auto start (махни ако не искаш)
startLag()
