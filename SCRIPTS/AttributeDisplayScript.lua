local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

-- Function to create a GUI for displaying attributes
local function createAttributeDisplay(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local attributes = character:GetAttributes()
    
    -- Create a ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AttributeDisplay"
    screenGui.Parent = player:WaitForChild("PlayerGui")

    -- Function to update the GUI
    local function updateGui()
        -- Clear existing children
        for _, child in screenGui:GetChildren() do
            child:Destroy()
        end

        -- Create a TextLabel for each attribute
        local yOffset = 0
        for attributeName, attributeValue in attributes do
            if typeof(attributeValue) == "string" then
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(0, 200, 0, 50)
                textLabel.Position = UDim2.new(0, 0, 0, yOffset)
                textLabel.Text = attributeName .. ": " .. attributeValue
                textLabel.Parent = screenGui
                yOffset = yOffset + 50
            elseif typeof(attributeValue) == "number" then
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(0, 200, 0, 50)
                frame.Position = UDim2.new(0, 0, 0, yOffset)
                frame.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
                frame.Parent = screenGui

                local bar = Instance.new("Frame")
                bar.Size = UDim2.new(attributeValue / 100, 0, 1, 0)  -- Assuming the value is out of 100
                bar.BackgroundColor3 = Color3.new(0, 1, 0)
                bar.Parent = frame

                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Text = attributeName
                textLabel.BackgroundTransparency = 1
                textLabel.Parent = frame

                yOffset = yOffset + 50
            end
        end
    end

    -- Initial GUI update
    updateGui()

    -- Connect attribute changed event
    character.AttributeChanged:Connect(function(attributeName)
        attributes = character:GetAttributes()
        updateGui()
    end)
end

-- Bind to PlayerAdded event
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createAttributeDisplay(player)
    end)
end)

-- Iterate through all existing players
for _, player in Players:GetPlayers() do
    player.CharacterAdded:Connect(function()
        createAttributeDisplay(player)
    end)
end