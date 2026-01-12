local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Crear ScreenGui
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999999

-- Marco principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 130)
frame.Position = UDim2.new(0.7, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Botón cerrar (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(150,0,0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1,1,1)
closeButton.Parent = frame

-- Botón minimizar _
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -70, 0, 5)
minimizeButton.Text = "_"
minimizeButton.TextColor3 = Color3.new(1,1,1)
minimizeButton.BackgroundColor3 = Color3.fromRGB(70,70,70)
minimizeButton.Parent = frame

-- Botón velocidad
local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(0.8, 0, 0.3, 0)
speedButton.Position = UDim2.new(0.1, 0, 0.4, 0)
speedButton.Text = "Velocidad"
speedButton.TextColor3 = Color3.new(1,1,1)
speedButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
speedButton.Parent = frame

-- Input velocidad
local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(0.8, 0, 0.3, 0)
speedInput.Position = UDim2.new(0.1, 0, 0.7, 0)
speedInput.PlaceholderText = "Máximo 1000"
speedInput.Text = ""
speedInput.TextColor3 = Color3.new(1,1,1)
speedInput.BackgroundColor3 = Color3.fromRGB(50,50,50)
speedInput.Parent = frame

-- Círculo flotante (cuando se minimiza)
local ball = Instance.new("Frame")
ball.Size = UDim2.new(0,60,0,60)
ball.Position = UDim2.new(0.5,0,0.5,0)
ball.BackgroundColor3 = Color3.fromRGB(40,140,255)
ball.Visible = false
ball.Active = true
ball.Draggable = true
ball.Parent = gui

local uCorner = Instance.new("UICorner", ball)
uCorner.CornerRadius = UDim.new(1,0)

-- FUNCIONES
speedButton.MouseButton1Click:Connect(function()
	local sp = tonumber(speedInput.Text)
	if sp and sp > 0 and sp <= 1000 then
		humanoid.WalkSpeed = sp
	end
end)

closeButton.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

minimizeButton.MouseButton1Click:Connect(function()
	frame.Visible = false
	ball.Visible = true
end)

ball.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		frame.Visible = true
		ball.Visible = false
	end
end)