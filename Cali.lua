local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer:WaitForChild("Backpack")
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local remote = ReplicatedStorage:WaitForChild("DailySpin"):WaitForChild("GiveGun")
local arguments = { "10,000$" }

local endTime = tick() + 60

while tick() < endTime do
    remote:FireServer(unpack(arguments))

    local success = false
    for _ = 1, 50 do
        local item = Backpack:FindFirstChild("10,000$")
        if item then
            success = true
            break
        end
        task.wait(0.1)
    end

    if success then
        local tool = Backpack:FindFirstChild("10,000$")
        if tool then
            tool.Parent = Character
            task.wait(0.2)

            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            task.wait(0.1)
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end
    end

    task.wait(0.01)
end
