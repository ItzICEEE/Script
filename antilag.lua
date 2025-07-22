-- Netless Anti-Lag GUI by ItzICEEE
-- © ItzICEEE

local CoreGui = game:GetService("CoreGui")
pcall(function() CoreGui:FindFirstChild("AntiLagUI"):Destroy() end)

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "AntiLagUI"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 300, 0, 160)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -80)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderColor3 = Color3.fromRGB(0, 170, 255)
mainFrame.BorderSizePixel = 3
mainFrame.Name = "MainFrame"
mainFrame.Active = true
mainFrame.Draggable = true

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, -35, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Netless Anti-Lag"
title.TextColor3 = Color3.fromRGB(0, 170, 255)
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Center

local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.Text = "X"
closeBtn.BackgroundTransparency = 1
closeBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18

local boostBtn = Instance.new("TextButton", mainFrame)
boostBtn.Size = UDim2.new(0.85, 0, 0, 60)
boostBtn.Position = UDim2.new(0.075, 0, 0.35, 0)
boostBtn.Text = "Boost ⚡"
boostBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
boostBtn.Font = Enum.Font.GothamBold
boostBtn.TextSize = 28
boostBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
boostBtn.BorderSizePixel = 0

local credit = Instance.new("TextLabel", mainFrame)
credit.Size = UDim2.new(1, 0, 0, 25)
credit.Position = UDim2.new(0, 0, 1, -25)
credit.Text = "By: ItzICEEE"
credit.TextColor3 = Color3.fromRGB(180, 180, 180)
credit.Font = Enum.Font.Gotham
credit.BackgroundTransparency = 1
credit.TextSize = 14

-- Minimized frame
local mini = Instance.new("TextButton", gui)
mini.Size = UDim2.new(0, 180, 0, 35)
mini.Position = UDim2.new(0.5, -90, 0.5, -20)
mini.Text = "Netless Anti-Lag"
mini.BackgroundColor3 = Color3.fromRGB(30,30,30)
mini.BorderColor3 = Color3.fromRGB(0, 170, 255)
mini.BorderSizePixel = 3
mini.TextColor3 = Color3.fromRGB(0, 170, 255)
mini.Font = Enum.Font.GothamBold
mini.TextSize = 16
mini.Visible = false
mini.Active = true
mini.Draggable = true

-- Toggle
closeBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	mini.Visible = true
end)

mini.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
	mini.Visible = false
end)

-- Boost button
boostBtn.MouseButton1Click:Connect(function()
	local function simplifyPart(part)
		if part:IsA("BasePart") then
			part.Material = Enum.Material.SmoothPlastic
			part.Reflectance = 0
		elseif part:IsA("MeshPart") then
			part.TextureID = ""
			part.Material = Enum.Material.SmoothPlastic
			part.Reflectance = 0
		elseif part:IsA("Decal") or part:IsA("Texture") or part:IsA("SurfaceAppearance") then
			part:Destroy()
		end
	end

	for _, obj in ipairs(workspace:GetDescendants()) do
		simplifyPart(obj)
	end

	-- Lighting
	local lighting = game:GetService("Lighting")
	lighting.GlobalShadows = false
	lighting.FogEnd = 1e10
	lighting.Brightness = 1
	for _, v in ipairs(lighting:GetChildren()) do
		if v:IsA("Sky") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") then
			v:Destroy()
		end
	end

	-- Terrain optimization
	local terrain = workspace:FindFirstChildOfClass("Terrain")
	if terrain then
		terrain.WaterWaveSize = 0
		terrain.WaterWaveSpeed = 0
		terrain.WaterReflectance = 0
		terrain.WaterTransparency = 1
		terrain.MaterialColors = Enum.MaterialColorMode.Default
	end

	boostBtn.Text = "Boosted!"
end)