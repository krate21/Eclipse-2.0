-- CVX Script - Simplified Fix Version v9.8
print("🎮 =================================")
print("🎮 DIV SCRIPT - Simplified Fix Version xxx")
print("🎮 Created by Div")
print("🎮 Professional Game Assistant")
print("🎮 =================================")

-- Detect device type
local inputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local players = game:GetService("Players")

local isMobile = inputService.TouchEnabled
local isDesktop = inputService.MouseEnabled
local deviceType = isMobile and "📱 Mobile" or "🖥️ Desktop"
print("✅ Detected device: " .. deviceType)

-- Ensure the game is fully loaded
repeat task.wait() until game:IsLoaded()
print("✅ Game loaded")

-- Get player
local player = players.LocalPlayer
if not player then
    warn("❌ Unable to get player")
    return
end
print("✅ Player: " .. player.Name)

-- Wait for PlayerGui
local playerGui
local success, errorMsg = pcall(function()
    playerGui = player:WaitForChild("PlayerGui", 10)
end)

if not success or not playerGui then
    warn("❌ Unable to find PlayerGui, trying CoreGui")
    playerGui = game:GetService("CoreGui")
end
print("✅ UI container: " .. playerGui.Name)

-- Clean up old UI
for _, gui in ipairs(playerGui:GetChildren()) do
    if gui.Name:find("XuanCong") or gui.Name:find("CVX") then
        gui:Destroy()
        print("🗑️ Cleaned up old UI: " .. gui.Name)
    end
end

-- ========================
-- Create main UI ScreenGui
-- ========================
print("🔧 Creating main UI...")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CVX腳本_v9_8"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999
screenGui.IgnoreGuiInset = false

-- ========================
-- Luna Interface Suite style loading screen (no black background)
-- ========================
print("🎬 Show Luna Interface Suite loading screen...")

-- Main loading screen frame (created directly, without a black overlay)
local loadingFrame = Instance.new("Frame")
loadingFrame.Name = "LunaLoadingFrame"
loadingFrame.Size = UDim2.new(0, 450, 0, 180)
loadingFrame.Position = UDim2.new(0.5, -225, 0.5, -90)
loadingFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
loadingFrame.BackgroundTransparency = 0.05
loadingFrame.BorderSizePixel = 0
loadingFrame.ZIndex = 1001
loadingFrame.Parent = screenGui

-- Black border
local borderFrame = Instance.new("Frame")
borderFrame.Name = "Border"
borderFrame.Size = UDim2.new(1, 4, 1, 4)
borderFrame.Position = UDim2.new(0, -2, 0, -2)
borderFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
borderFrame.BorderSizePixel = 0
borderFrame.ZIndex = 1000
borderFrame.Parent = loadingFrame

-- Blue top border
local topBorder = Instance.new("Frame")
topBorder.Name = "TopBorder"
topBorder.Size = UDim2.new(1, 0, 0, 2)
topBorder.Position = UDim2.new(0, 0, 0, 0)
topBorder.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
topBorder.BorderSizePixel = 0
topBorder.ZIndex = 1002
topBorder.Parent = loadingFrame

-- Rounded corners
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 6)
frameCorner.Parent = loadingFrame

local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 8)
borderCorner.Parent = borderFrame

-- Luna Interface Suite title
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, 0, 0, 20)
titleLabel.Position = UDim2.new(0, 0, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Luna Interface Suite"
titleLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.ZIndex = 1002
titleLabel.Parent = loadingFrame

-- Author label
local authorLabel = Instance.new("TextLabel")
authorLabel.Name = "Author"
authorLabel.Size = UDim2.new(1, 0, 0, 14)
authorLabel.Position = UDim2.new(0, 0, 0, 28)
authorLabel.BackgroundTransparency = 1
authorLabel.Text = "by Nebula Softworks"
authorLabel.TextColor3 = Color3.fromRGB(150, 150, 180)
authorLabel.Font = Enum.Font.Gotham
authorLabel.TextSize = 10
authorLabel.TextXAlignment = Enum.TextXAlignment.Center
authorLabel.ZIndex = 1002
authorLabel.Parent = loadingFrame

-- Divider
local separator1 = Instance.new("Frame")
separator1.Name = "Separator1"
separator1.Size = UDim2.new(1, -40, 0, 1)
separator1.Position = UDim2.new(0, 20, 0, 50)
separator1.BackgroundColor3 = Color3.fromRGB(60, 80, 100)
separator1.BackgroundTransparency = 0.5
separator1.BorderSizePixel = 0
separator1.ZIndex = 1002
separator1.Parent = loadingFrame

-- System initialization label
local systemLabel = Instance.new("TextLabel")
systemLabel.Name = "SystemLabel"
systemLabel.Size = UDim2.new(1, -40, 0, 18)
systemLabel.Position = UDim2.new(0, 20, 0, 60)
systemLabel.BackgroundTransparency = 1
systemLabel.Text = "[ System initializing... ]"
systemLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
systemLabel.Font = Enum.Font.Gotham
systemLabel.TextSize = 11
systemLabel.TextXAlignment = Enum.TextXAlignment.Left
systemLabel.ZIndex = 1002
systemLabel.Parent = loadingFrame

-- Progress bar background
local progressBarBg = Instance.new("Frame")
progressBarBg.Name = "ProgressBarBg"
progressBarBg.Size = UDim2.new(1, -40, 0, 12)
progressBarBg.Position = UDim2.new(0, 20, 0, 85)
progressBarBg.BackgroundColor3 = Color3.fromRGB(30, 40, 50)
progressBarBg.BorderSizePixel = 0
progressBarBg.ZIndex = 1002
progressBarBg.Parent = loadingFrame

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 4)
barCorner.Parent = progressBarBg

-- Progress bar foreground
local progressBar = Instance.new("Frame")
progressBar.Name = "ProgressBar"
progressBar.Size = UDim2.new(0, 0, 1, 0) -- Start at 0
progressBar.Position = UDim2.new(0, 0, 0, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
progressBar.BorderSizePixel = 0
progressBar.ZIndex = 1003
progressBar.Parent = progressBarBg

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0, 4)
progressCorner.Parent = progressBar

-- Loading percentage label
local percentLabel = Instance.new("TextLabel")
percentLabel.Name = "PercentLabel"
percentLabel.Size = UDim2.new(1, -40, 0, 16)
percentLabel.Position = UDim2.new(0, 20, 0, 100)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "Loading 0%"
percentLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
percentLabel.Font = Enum.Font.Gotham
percentLabel.TextSize = 10
percentLabel.TextXAlignment = Enum.TextXAlignment.Center
percentLabel.ZIndex = 1002
percentLabel.Parent = loadingFrame

-- Data reception label
local dataLabel = Instance.new("TextLabel")
dataLabel.Name = "DataLabel"
dataLabel.Size = UDim2.new(1, -40, 0, 14)
dataLabel.Position = UDim2.new(0, 20, 0, 120)
dataLabel.BackgroundTransparency = 1
dataLabel.Text = "Data received: 0 / Max"
dataLabel.TextColor3 = Color3.fromRGB(150, 200, 100)
dataLabel.Font = Enum.Font.Gotham
dataLabel.TextSize = 10
dataLabel.TextXAlignment = Enum.TextXAlignment.Center
dataLabel.ZIndex = 1002
dataLabel.Parent = loadingFrame

-- Divider 2
local separator2 = Instance.new("Frame")
separator2.Name = "Separator2"
separator2.Size = UDim2.new(1, -40, 0, 1)
separator2.Position = UDim2.new(0, 20, 0, 140)
separator2.BackgroundColor3 = Color3.fromRGB(60, 80, 100)
separator2.BackgroundTransparency = 0.5
separator2.BorderSizePixel = 0
separator2.ZIndex = 1002
separator2.Parent = loadingFrame

-- Mode display label
local modeLabel = Instance.new("TextLabel")
modeLabel.Name = "ModeLabel"
modeLabel.Size = UDim2.new(1, -40, 0, 12)
modeLabel.Position = UDim2.new(0, 20, 0, 145)
modeLabel.BackgroundTransparency = 1
modeLabel.Text = "Mode: Hidden / Clipping mode"
modeLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
modeLabel.Font = Enum.Font.Gotham
modeLabel.TextSize = 9
modeLabel.TextXAlignment = Enum.TextXAlignment.Left
modeLabel.ZIndex = 1002
modeLabel.Parent = loadingFrame

-- Status display label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, -40, 0, 12)
statusLabel.Position = UDim2.new(0, 20, 0, 160)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Safe zone - Player-versus-player disabled"
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 9
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.ZIndex = 1002
statusLabel.Parent = loadingFrame

-- Bottom hint
local hintLabel = Instance.new("TextLabel")
hintLabel.Name = "HintLabel"
hintLabel.Size = UDim2.new(1, -40, 0, 16)
hintLabel.Position = UDim2.new(0, 20, 0, 175)
hintLabel.BackgroundTransparency = 1
hintLabel.Text = "< Please wait, establishing orbital link... >"
hintLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
hintLabel.Font = Enum.Font.Gotham
hintLabel.TextSize = 9
hintLabel.TextXAlignment = Enum.TextXAlignment.Center
hintLabel.ZIndex = 1002
hintLabel.Parent = loadingFrame

-- ========================
-- Simplified but reliable loading animation
-- ========================
local dots = {"", ".", "..", "..."}
local dotIndex = 1
local progress = 0
local animationActive = true
local animationConnection

-- Create side button (show immediately)
local sidebarButton = Instance.new("TextButton")
sidebarButton.Name = "SidebarButton"
sidebarButton.Size = UDim2.new(0, 40, 0, 40)
sidebarButton.Position = UDim2.new(0, 10, 0, 10)
sidebarButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
sidebarButton.BackgroundTransparency = 0.1
sidebarButton.BorderSizePixel = 0
sidebarButton.Text = "⚙️"
sidebarButton.TextColor3 = Color3.fromRGB(255, 255, 255)
sidebarButton.Font = Enum.Font.GothamBold
sidebarButton.TextSize = 16
sidebarButton.AutoButtonColor = true
sidebarButton.ZIndex = 1000
sidebarButton.Visible = true
sidebarButton.Parent = screenGui

-- Rounded corners
local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0, 8)
sidebarCorner.Parent = sidebarButton

-- Border
local sidebarStroke = Instance.new("UIStroke")
sidebarStroke.Color = Color3.fromRGB(0, 150, 255)
sidebarStroke.Thickness = 1.5
sidebarStroke.Parent = sidebarButton

-- Hover hint
local buttonHint = Instance.new("TextLabel")
buttonHint.Name = "ButtonHint"
buttonHint.Size = UDim2.new(0, 100, 0, 24)
buttonHint.Position = UDim2.new(0, 45, 0, 9)
buttonHint.BackgroundColor3 = Color3.fromRGB(20, 30, 45)
buttonHint.BackgroundTransparency = 0.1
buttonHint.Text = "Open CVX Script"
buttonHint.TextColor3 = Color3.fromRGB(220, 230, 255)
buttonHint.Font = Enum.Font.Gotham
buttonHint.TextSize = 10
buttonHint.TextXAlignment = Enum.TextXAlignment.Center
buttonHint.Visible = false
buttonHint.ZIndex = 999
buttonHint.Parent = screenGui

local hintCorner = Instance.new("UICorner")
hintCorner.CornerRadius = UDim.new(0, 5)
hintCorner.Parent = buttonHint

-- ========================
-- Side button dragging functionality
-- ========================
local dragging = false
local dragInput
local dragStart
local startPos

-- Start dragging
local function beginDrag(input)
    dragging = true
    dragStart = input.Position
    startPos = sidebarButton.Position
    
    -- Capture mouse movement
    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
            dragging = false
        end
    end)
end

-- Update drag position
local function updateDrag(input)
    if dragging then
        local delta = input.Position - dragStart
        sidebarButton.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
        
        -- Update hint position
        buttonHint.Position = UDim2.new(
            0, 
            sidebarButton.Position.X.Offset + 45,
            0, 
            sidebarButton.Position.Y.Offset + 9
        )
    end
end

-- Set up dragging for desktop devices
if not isMobile then
    sidebarButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            beginDrag(input)
            return
        end
    end)

    sidebarButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    inputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateDrag(input)
        end
    end)
else
    -- Set up touch dragging for mobile devices
    local touchStartPos
    local touchStartTime
    local isDraggingTouch = false
    
    sidebarButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            touchStartPos = input.Position
            touchStartTime = tick()
            isDraggingTouch = true
            
            -- Long-press detection (avoid conflicts with clicking)
            task.spawn(function()
                task.wait(0.3) -- Hold for 0.3 seconds to start dragging
                if isDraggingTouch then
                    beginDrag(input)
                end
            end)
        end
    end)
    
    sidebarButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    inputService.InputChanged:Connect(function(input)
        if input == dragInput and isDraggingTouch then
            -- Calculate touch movement distance
            local currentPos = input.Position
            local delta = (currentPos - touchStartPos).Magnitude
            
            -- Start dragging if movement exceeds 20 pixels
            if delta > 20 then
                beginDrag(input)
                updateDrag(input)
            end
        end
    end)
    
    sidebarButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            isDraggingTouch = false
            dragging = false
            
            -- Check whether it was a click (short press)
            local touchEndTime = tick()
            if touchEndTime - touchStartTime < 0.3 then
                toggleUI() -- Short press triggers click function
            end
        end
    end)
end

-- Start loading animation
task.spawn(function()
    local startTime = tick()
    
    animationConnection = runService.RenderStepped:Connect(function()
        if not animationActive then
            animationConnection:Disconnect()
            return
        end
        
        -- Calculate progress (complete in 3 seconds)
        local elapsed = tick() - startTime
        progress = math.min(elapsed / 3 * 100, 100)
        
        -- Update progress bar
        progressBar.Size = UDim2.new(progress / 100, 0, 1, 0)
        percentLabel.Text = "Loading " .. math.floor(progress) .. "%"
        
        -- Update data
        local dataValue = math.floor(99 * (progress / 100))
        dataLabel.Text = "Data received: " .. dataValue .. " / Max"
        
        -- Update hint animation
        dotIndex = dotIndex + 1
        if dotIndex > #dots then dotIndex = 1 end
        hintLabel.Text = "< Please wait, establishing orbital link" .. dots[dotIndex] .. " >"
        
        -- Completion check
        if progress >= 100 then
            animationActive = false
            
            -- Show completion status
            percentLabel.Text = "Loading 100%"
            dataLabel.Text = "Data received: 99 / Max"
            hintLabel.Text = "< Orbital link established >"
            progressBar.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
            
            -- Wait 1 second to show completion status
            task.wait(1)
            
            -- Fade out loading screen
            local fadeOut = tweenService:Create(loadingFrame, TweenInfo.new(0.5), {
                BackgroundTransparency = 1
            })
            
            -- Fade out all text at the same time
            local fadeOutTitle = tweenService:Create(titleLabel, TweenInfo.new(0.5), {
                TextTransparency = 1
            })
            
            local fadeOutAuthor = tweenService:Create(authorLabel, TweenInfo.new(0.5), {
                TextTransparency = 1
            })
            
            local fadeOutSystem = tweenService:Create(systemLabel, TweenInfo.new(0.5), {
                TextTransparency = 1
            })
            
            local fadeOutPercent = tweenService:Create(percentLabel, TweenInfo.new(0.5), {
                TextTransparency = 1
            })
            
            local fadeOutData = tweenService:Create(dataLabel, TweenInfo.new(0.5), {
                TextTransparency = 1
            })
            
            local fadeOutHint = tweenService:Create(hintLabel, TweenInfo.new(0.5), {
                TextTransparency = 1
            })
            
            local fadeOutMode = tweenService:Create(modeLabel, TweenInfo.new(0.5), {
                TextTransparency = 1
            })
            
            local fadeOutStatus = tweenService:Create(statusLabel, TweenInfo.new(0.5), {
                TextTransparency = 1
            })
            
            -- Play all fade-out animations
            fadeOut:Play()
            fadeOutTitle:Play()
            fadeOutAuthor:Play()
            fadeOutSystem:Play()
            fadeOutPercent:Play()
            fadeOutData:Play()
            fadeOutHint:Play()
            fadeOutMode:Play()
            fadeOutStatus:Play()
            
            -- Wait for fade-out to complete
            fadeOut.Completed:Wait()
            
            -- Safely remove
            if loadingFrame and loadingFrame.Parent then
                loadingFrame:Destroy()
                print("✅ Luna Interface Suite Loading screen complete")
            end
            
            animationConnection:Disconnect()
        end
    end)
end)

-- Safety mechanism: force-remove loading screen after 5 seconds
task.spawn(function()
    task.wait(5)
    
    if loadingFrame and loadingFrame.Parent then
        print("⚠️ Safety mechanism: force-removing loading screen")
        
        animationActive = false
        if animationConnection then
            animationConnection:Disconnect()
        end
        
        loadingFrame:Destroy()
        print("✅ Loading screen was force-removed")
    end
end)

-- ========================
-- Create main frame (show when clicked)
-- ========================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 480, 0, 280)
mainFrame.Position = UDim2.new(0.5, -240, 0.5, -140)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
mainFrame.BackgroundTransparency = 0.05
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Parent = screenGui

-- Black background border
local bgFrame = Instance.new("Frame")
bgFrame.Name = "BackgroundFrame"
bgFrame.Size = UDim2.new(1, 4, 1, 4)
bgFrame.Position = UDim2.new(0, -2, 0, -2)
bgFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bgFrame.BorderSizePixel = 0
bgFrame.ZIndex = -1
bgFrame.Parent = mainFrame

-- Rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = mainFrame

local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(0, 8)
bgCorner.Parent = bgFrame

-- Blue border
local borderFrame = Instance.new("Frame")
borderFrame.Name = "Border"
borderFrame.Size = UDim2.new(1, 0, 0, 2)
borderFrame.Position = UDim2.new(0, 0, 0, 0)
borderFrame.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
borderFrame.BorderSizePixel = 0
borderFrame.ZIndex = 2
borderFrame.Parent = mainFrame

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 32)
titleBar.Position = UDim2.new(0, 0, 0, 2)
titleBar.BackgroundTransparency = 1
titleBar.Parent = mainFrame

-- Title text
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -80, 1, 0)
titleLabel.Position = UDim2.new(0, 12, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "DIV Script xxx"
titleLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 13
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 24, 0, 24)
closeButton.Position = UDim2.new(1, -28, 0, 4)
closeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
closeButton.BackgroundTransparency = 0.3
closeButton.BorderSizePixel = 0
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.AutoButtonColor = true
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 4)
closeCorner.Parent = closeButton

-- Divider
local separator = Instance.new("Frame")
separator.Name = "Separator"
separator.Size = UDim2.new(1, -24, 0, 1)
separator.Position = UDim2.new(0, 12, 0, 36)
separator.BackgroundColor3 = Color3.fromRGB(60, 80, 100)
separator.BackgroundTransparency = 0.5
separator.BorderSizePixel = 0
separator.Parent = mainFrame

-- ========================
-- Create function buttons (display by category)
-- ========================
print("🎯 Creating function buttons...")

-- Scripts section (left side)
local scriptsPanel = Instance.new("Frame")
scriptsPanel.Name = "ScriptsPanel"
scriptsPanel.Size = UDim2.new(0.5, -4, 0, 120)
scriptsPanel.Position = UDim2.new(0, 12, 0, 60) -- Move down 15px
scriptsPanel.BackgroundTransparency = 1
scriptsPanel.Parent = mainFrame

-- Scripts section title
local scriptsTitle = Instance.new("TextLabel")
scriptsTitle.Name = "ScriptsTitle"
scriptsTitle.Size = UDim2.new(1, 0, 0, 20)
scriptsTitle.Position = UDim2.new(0, 0, 0, -25)
scriptsTitle.BackgroundTransparency = 1
scriptsTitle.Text = "📜 Scripts"
scriptsTitle.TextColor3 = Color3.fromRGB(200, 200, 255)
scriptsTitle.Font = Enum.Font.GothamBold
scriptsTitle.TextSize = 11
scriptsTitle.TextXAlignment = Enum.TextXAlignment.Left
scriptsTitle.Parent = scriptsPanel

-- Functions section (right side)
local functionsPanel = Instance.new("Frame")
functionsPanel.Name = "FunctionsPanel"
functionsPanel.Size = UDim2.new(0.5, -4, 0, 220)
functionsPanel.Position = UDim2.new(0.5, 0, 0, 60) -- Move down 15px
functionsPanel.BackgroundTransparency = 1
functionsPanel.Parent = mainFrame

-- Functions section title
local functionsTitle = Instance.new("TextLabel")
functionsTitle.Name = "FunctionsTitle"
functionsTitle.Size = UDim2.new(1, 0, 0, 20)
functionsTitle.Position = UDim2.new(0, 0, 0, -25)
functionsTitle.BackgroundTransparency = 1
functionsTitle.Text = "⚙️ Functions"
functionsTitle.TextColor3 = Color3.fromRGB(200, 200, 255)
functionsTitle.Font = Enum.Font.GothamBold
functionsTitle.TextSize = 11
functionsTitle.TextXAlignment = Enum.TextXAlignment.Left
functionsTitle.Parent = functionsPanel

-- Button creation function
local function createHorizontalButton(text, icon, xPos, yPos, color, panel)
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Name = text .. "Frame"
    buttonFrame.Size = UDim2.new(1, -8, 0, 32)
    buttonFrame.Position = UDim2.new(0, xPos, 0, yPos)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.Parent = panel
    
    local button = Instance.new("TextButton")
    button.Name = text
    button.Size = UDim2.new(1, 0, 1, 0)
    button.Position = UDim2.new(0, 0, 0, 0)
    button.BackgroundColor3 = Color3.fromRGB(30, 40, 55)
    button.BackgroundTransparency = 0.3
    button.BorderSizePixel = 0
    button.Text = ""
    button.AutoButtonColor = true
    button.Active = true
    button.Parent = buttonFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button
    
    -- Icon
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Name = "Icon"
    iconLabel.Size = UDim2.new(0, 24, 0, 24)
    iconLabel.Position = UDim2.new(0, 8, 0, 4)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextColor3 = color
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextSize = 14
    iconLabel.TextXAlignment = Enum.TextXAlignment.Center
    iconLabel.Parent = buttonFrame
    
    -- Text
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Text"
    textLabel.Size = UDim2.new(1, -40, 1, 0)
    textLabel.Position = UDim2.new(0, 36, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 12
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.Parent = buttonFrame
    
    -- Status indicator
    local statusIndicator = Instance.new("Frame")
    statusIndicator.Name = "StatusIndicator"
    statusIndicator.Size = UDim2.new(0, 8, 0, 8)
    statusIndicator.Position = UDim2.new(1, -14, 0.5, -4)
    statusIndicator.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
    statusIndicator.BackgroundTransparency = 0.3
    statusIndicator.BorderSizePixel = 0
    statusIndicator.Parent = buttonFrame
    
    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(1, 0)
    statusCorner.Parent = statusIndicator
    
    -- Hover effect
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(30, 40, 55)
    end)
    
    return button, statusIndicator, textLabel, iconLabel
end

-- Script section buttons (left side)
local piScriptBtn, piStatus, piText, piIcon = createHorizontalButton("Pi Script", "🅿️", 0, 0, Color3.fromRGB(220, 150, 50), scriptsPanel)
local xaBtn, xaStatus, xaText, xaIcon = createHorizontalButton("XA Script", "🌟", 0, 40, Color3.fromRGB(220, 120, 50), scriptsPanel)

-- Function section buttons (right side)
local fastAttackBtn, fastAttackStatus, fastAttackText, fastAttackIcon = createHorizontalButton("Fast Attack", "⚡", 0, 0, Color3.fromRGB(0, 150, 220), functionsPanel)
local flightBtn, flightStatus, flightText, flightIcon = createHorizontalButton("Fly Script", "✈️", 0, 40, Color3.fromRGB(100, 200, 100), functionsPanel)
local fpsBoostBtn, fpsStatus, fpsText, fpsIcon = createHorizontalButton("FPS Optimization", "🖥️", 0, 80, Color3.fromRGB(180, 100, 220), functionsPanel)
local autoV4Btn, autoV4Status, autoV4Text, autoV4Icon = createHorizontalButton("Auto V4", "🌀", 0, 120, Color3.fromRGB(150, 80, 200), functionsPanel)

-- Author information
local authorLabel = Instance.new("TextLabel")
authorLabel.Name = "AuthorLabel"
authorLabel.Size = UDim2.new(1, -24, 0, 20)
authorLabel.Position = UDim2.new(0, 12, 0, 245)
authorLabel.BackgroundTransparency = 1
authorLabel.Text = "👑 Created by xxx | DIV Script xxx"
authorLabel.TextColor3 = Color3.fromRGB(150, 150, 180)
authorLabel.Font = Enum.Font.Gotham
authorLabel.TextSize = 10
authorLabel.TextXAlignment = Enum.TextXAlignment.Center
authorLabel.Parent = mainFrame

print("✅ UI creation complete")

-- ========================
-- UI show/hide function
-- ========================
local isUIVisible = false

local function toggleUI()
    isUIVisible = not isUIVisible
    
    if isUIVisible then
        mainFrame.Visible = true
        sidebarButton.Text = "📂"
        sidebarButton.BackgroundColor3 = Color3.fromRGB(0, 120, 220)
        buttonHint.Text = "Close CVX Script"
        
        mainFrame.BackgroundTransparency = 1
        
        local fadeIn = tweenService:Create(mainFrame, TweenInfo.new(0.3), {
            BackgroundTransparency = 0.05
        })
        fadeIn:Play()
    else
        sidebarButton.Text = "⚙️"
        sidebarButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
        buttonHint.Text = "Open CVX Script"
        
        local fadeOut = tweenService:Create(mainFrame, TweenInfo.new(0.2), {
            BackgroundTransparency = 1
        })
        fadeOut:Play()
        
        fadeOut.Completed:Wait()
        mainFrame.Visible = false
    end
end

-- ========================
-- Event handling
-- ========================
print("🔧 Setting up event handling...")

-- Hover effect
sidebarButton.MouseEnter:Connect(function()
    buttonHint.Visible = true
    sidebarStroke.Color = Color3.fromRGB(0, 180, 255)
    sidebarButton.BackgroundColor3 = Color3.fromRGB(0, 120, 220)
end)

sidebarButton.MouseLeave:Connect(function()
    buttonHint.Visible = false
    sidebarStroke.Color = Color3.fromRGB(0, 150, 255)
    sidebarButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
end)

-- Side button click (desktop devices only)
if not isMobile then
    sidebarButton.MouseButton1Click:Connect(function()
        toggleUI()
    end)
end

-- Close button
closeButton.MouseButton1Click:Connect(function()
    toggleUI()
end)

-- ========================
-- Fast Attack function
-- ========================
local fastAttackActive = false
local fastAttackConnection = nil

local function toggleFastAttack()
    fastAttackActive = not fastAttackActive
    
    if fastAttackActive then
        fastAttackBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
        fastAttackStatus.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        fastAttackIcon.Text = "✅"
        fastAttackText.Text = "Fast Attack [ON]"
        
        print("⚡ Fast Attack started")
        
        -- Set Fast Attack flag
        _G.FastAttack = true
        
        -- Start Fast Attack
        fastAttackConnection = task.spawn(function()
            if _G.FastAttack then
                local _ENV = (getgenv or getrenv or getfenv)()

                local function SafeWaitForChild(parent, childName)
                    local success, result = pcall(function()
                        return parent:WaitForChild(childName)
                    end)
                    if not success or not result then
                        warn("noooooo: " .. childName)
                    end
                    return result
                end

                local function WaitChilds(path, ...)
                    local last = path
                    for _, child in {...} do
                        last = last:FindFirstChild(child) or SafeWaitForChild(last, child)
                        if not last then break end
                    end
                    return last
                end

                local VirtualInputManager = game:GetService("VirtualInputManager")
                local CollectionService = game:GetService("CollectionService")
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local TeleportService = game:GetService("TeleportService")
                local RunService = game:GetService("RunService")
                local Players = game:GetService("Players")
                local Player = Players.LocalPlayer

                if not Player then
                    warn("Local player not found.")
                    return
                end

                local Remotes = SafeWaitForChild(ReplicatedStorage, "Remotes")
                if not Remotes then return end

                local Validator = SafeWaitForChild(Remotes, "Validator")
                local CommF = SafeWaitForChild(Remotes, "CommF_")
                local CommE = SafeWaitForChild(Remotes, "CommE")

                local ChestModels = SafeWaitForChild(workspace, "ChestModels")
                local WorldOrigin = SafeWaitForChild(workspace, "_WorldOrigin")
                local Characters = SafeWaitForChild(workspace, "Characters")
                local Enemies = SafeWaitForChild(workspace, "Enemies")
                local Map = SafeWaitForChild(workspace, "Map")

                local EnemySpawns = SafeWaitForChild(WorldOrigin, "EnemySpawns")
                local Locations = SafeWaitForChild(WorldOrigin, "Locations")

                local RenderStepped = RunService.RenderStepped
                local Heartbeat = RunService.Heartbeat
                local Stepped = RunService.Stepped

                local Modules = SafeWaitForChild(ReplicatedStorage, "Modules")
                local Net = SafeWaitForChild(Modules, "Net")

                local sethiddenproperty = sethiddenproperty or function(...) return ... end
                local setupvalue = setupvalue or (debug and debug.setupvalue)
                local getupvalue = getupvalue or (debug and debug.getupvalue)

                local Settings = {
                    AutoClick = true,
                    ClickDelay = 0.3
                }

                local Module = {}

                Module.FastAttack = (function()
                    if _ENV.rz_FastAttack then
                        return _ENV.rz_FastAttack
                    end

                    local FastAttack = {
                        Distance = 10000,
                        attackMobs = true,
                        attackPlayers = true,
                        Equipped = nil
                    }

                    local RegisterAttack = SafeWaitForChild(Net, "RE/RegisterAttack")
                    local RegisterHit = SafeWaitForChild(Net, "RE/RegisterHit")

                    local function IsAlive(character)
                    return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
                    end

                    local function ProcessEnemies(OthersEnemies, Folder)
                        local BasePart = nil
                        for _, Enemy in Folder:GetChildren() do
                            local Head = Enemy:FindFirstChild("Head")
                            if Head and IsAlive(Enemy) and Player:DistanceFromCharacter(Head.Position) < FastAttack.Distance then
                                if Enemy ~= Player.Character then
                                    table.insert(OthersEnemies, { Enemy, Head })
                                    BasePart = Head
                                end
                            end
                        end
                        return BasePart
                    end

                    function FastAttack:Attack(BasePart, OthersEnemies)
                        if not BasePart or #OthersEnemies == 0 then return end
                        RegisterAttack:FireServer(Settings.ClickDelay or 0)
                        RegisterHit:FireServer(BasePart, OthersEnemies)
                    end

                    function FastAttack:AttackNearest()
                        local OthersEnemies = {}
                        local Part1 = ProcessEnemies(OthersEnemies, Enemies)
                        local Part2 = ProcessEnemies(OthersEnemies, Characters)
                        if #OthersEnemies > 0 then
                            self:Attack(Part1 or Part2, OthersEnemies)
                        else
                            task.wait(0)
                        end
                    end

                    function FastAttack:BladeHits()
                        local Equipped = IsAlive(Player.Character) and Player.Character:FindFirstChildOfClass("Tool")
                        if Equipped and Equipped.ToolTip ~= "Gun" then
                            self:AttackNearest()
                        else
                            task.wait(0)
                        end
                    end

                    task.spawn(function()
                        while task.wait(Settings.ClickDelay) do
                            if not _G.FastAttack then  -- Check whether it should stop
                                break
                            end
                            if Settings.AutoClick then
                                FastAttack:BladeHits()
                            end
                        end
                    end)

                    _ENV.rz_FastAttack = FastAttack
                    return FastAttack
                end)()
            end
        end)
        
    else
        fastAttackBtn.BackgroundColor3 = Color3.fromRGB(30, 40, 55)
        fastAttackStatus.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
        fastAttackIcon.Text = "⚡"
        fastAttackText.Text = "Fast Attack"
        
        print("🛑 Fast Attack stopped")
        
        -- Stop Fast Attack
        _G.FastAttack = false
        
        -- Stop if there is a connection
        if fastAttackConnection then
            pcall(function()
                task.cancel(fastAttackConnection)
                fastAttackConnection = nil
            end)
        end
        
        -- Clean up environment variables
        if getgenv then
            getgenv().rz_FastAttack = nil
        end
    end
end

-- ========================
-- Script loading function
-- ========================
local function loadScript(name, url, button, status, text, icon)
    print("📥 Loading: " .. name)
    
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    
    if success then
        print("✅ " .. name .. " loaded successfully")
        if button and status then
            button.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
            status.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        end
    else
        print("❌ " .. name .. " failed to load")
        if button and status then
            button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
            status.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        end
    end
end

-- Button events
piScriptBtn.MouseButton1Click:Connect(function()
    loadScript("Pi Script", "https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua", 
               piScriptBtn, piStatus, piText, piIcon)
end)

xaBtn.MouseButton1Click:Connect(function()
    loadScript("XA Script", "https://raw.gitcode.com/Xingtaiduan/Scripts/raw/main/Loader.lua", 
               xaBtn, xaStatus, xaText, xaIcon)
end)

flightBtn.MouseButton1Click:Connect(function()
    loadScript("Fly Script", "https://raw.githubusercontent.com/krate21/Eclipse-2.0/refs/heads/main/Fly.lua", 
               flightBtn, flightStatus, flightText, flightIcon)
end)

fpsBoostBtn.MouseButton1Click:Connect(function()
    loadScript("FPS Optimization", "https://raw.githubusercontent.com/kexuan001/rjrym/refs/heads/main/fpsboost", 
               fpsBoostBtn, fpsStatus, fpsText, fpsIcon)
end)

fastAttackBtn.MouseButton1Click:Connect(toggleFastAttack)

-- ========================
-- Auto V4 function (new code you provided)
-- ========================
local autoV4Active = false
local autoV4Connection = nil

local function callAwakeningRemote()
    local Backpack = player:FindFirstChild("Backpack")
    if not Backpack then 
        warn("Backpack not found")
        return false
    end
    
    local Awakening = Backpack:FindFirstChild("Awakening")
    if not Awakening then 
        warn("Awakening not found")
        return false
    end
    
    local RemoteFunc = Awakening:FindFirstChild("RemoteFunction")
    if not RemoteFunc or not RemoteFunc:IsA("RemoteFunction") then 
        warn("RemoteFunction not found or type error")
        return false
    end
    
    local success, err = pcall(function()
        RemoteFunc:InvokeServer(true)
    end)
    if not success then
        warn("Auto V4 call failed: ", err)
        return false
    end
    
    return true
end

local function toggleAutoV4()
    autoV4Active = not autoV4Active
    
    if autoV4Active then
        autoV4Btn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
        autoV4Status.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        autoV4Icon.Text = "✅"
        autoV4Text.Text = "Auto V4 [ON]"
        
        print("🌀 Auto V4 started")
        
        -- Start Auto V4 loop
        autoV4Connection = task.spawn(function()
            while autoV4Active do
                -- Call the Awakening RemoteFunction
                local success = callAwakeningRemote()
                if success then
                    print("✅ Successfully called V4 awakening")
                end
                
                -- Wait a while before trying again (avoid excessive frequency)
                task.wait(5) -- Try every 5 seconds
            end
        end)
        
    else
        autoV4Btn.BackgroundColor3 = Color3.fromRGB(30, 40, 55)
        autoV4Status.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
        autoV4Icon.Text = "🌀"
        autoV4Text.Text = "Auto V4"
        
        print("🛑 Auto V4 stopped")
        
        -- Stop the Auto V4 loop
        if autoV4Connection then
            pcall(function()
                task.cancel(autoV4Connection)
                autoV4Connection = nil
            end)
        end
    end
end

autoV4Btn.MouseButton1Click:Connect(toggleAutoV4)

-- Press ESC to close the main UI
if not isMobile then
    inputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.Escape then
            if isUIVisible then
                toggleUI()
            end
        end
    end)
end

-- ========================
-- Initialization complete
-- ========================
print("🎮 =================================")
print("🎮 DIV Script xxx - Loading complete")
print("🎮 Device: " .. deviceType)
print("🎮 Features:")
print("🎮   ✅ Luna Interface Suite loading screen (no black background)")
print("🎮   ✅ Scripts/Functions sections displayed by category (moved down 15px)")
print("🎮   ✅ Fast Attack function (new code)")
print("🎮   ✅ Auto V4 function (local call, every 5 seconds)")
print("🎮   ✅ Side button can be dragged")
print("🎮   ✅ Modern horizontal UI")
print("🎮   ✅ Multiple script loading")
print("🎮 =================================")

print("🚀 Script loading complete!")
print("💡 There is a blue ⚙️ button in the top-left corner of the screen")
print("💡 Hold the ⚙️ button to drag it anywhere")
