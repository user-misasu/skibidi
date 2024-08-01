local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, -20)
title.Text = "KEY SYSTEM"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.new(0, 0, 0)
title.Parent = frame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        dragInput = nil
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, 0, 0.5, 0)
keyInput.Position = UDim2.new(0, 0, 0, 0)
keyInput.Text = "ENTER THE KEY"
keyInput.TextColor3 = Color3.new(0, 0, 0)
keyInput.BackgroundTransparency = 0.5
keyInput.BackgroundColor3 = Color3.new(1, 1, 1)
keyInput.TextWrapped = true
keyInput.Parent = frame

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0.5, 0, 0.5, 0)
submitButton.Position = UDim2.new(0, 0, 0.5, 0)
submitButton.Text = "SUBMIT"
submitButton.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -20, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.5, 0, 0.5, 0)
getKeyButton.Position = UDim2.new(0.5, 0, 0.5, 0)
getKeyButton.Text = "Buy Key: https://discord.gg/BVKVN4887R"
getKeyButton.Parent = frame    

submitButton.MouseButton1Click:Connect(function()
    local enteredKey = keyInput.Text
    if enteredKey == "Keyformyscriptreallyproe123456789" then
        screenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/user-misasu/ChangingAnimation/main/Latest.lua"))()
    end
end)

getKeyButton.MouseButton1Click:Connect(function()
    setclipboard("X")
end)
