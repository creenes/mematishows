local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local ESP_UPDATE_RATE = 0.1 -- ESP'nin yenilenme hızı (saniye)

local function updateESP(player)
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") and character:FindFirstChild("Head") then
        local humanoid = character:FindFirstChild("Humanoid")
        local head = character:FindFirstChild("Head")

        -- Vurgulama (Highlight)
        local highlight = character:FindFirstChild("Highlight") or Instance.new("Highlight")
        highlight.Parent = character
        highlight.FillColor = Color3.new(1, 0, 0) -- Kırmızı vurgu

        -- İsim ve Can Bilgisi
        local nameLabel = head:FindFirstChild("NameLabel") or Instance.new("BillboardGui")
        nameLabel.Name = "NameLabel"
        nameLabel.Parent = head
        nameLabel.Adornee = head
        nameLabel.Size = UDim2.new(0, 200, 0, 50)
        nameLabel.StudsOffset = Vector3.new(0, 2, 0)

        local textLabel = nameLabel:FindFirstChild("TextLabel") or Instance.new("TextLabel")
        textLabel.Parent = nameLabel
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextScaled = true

        textLabel.Text = player.Name .. " (" .. humanoid.Health .. "/" .. humanoid.MaxHealth .. ")"

        humanoid.HealthChanged:Connect(function(health)
            textLabel.Text = player.Name .. " (" .. health .. "/" .. humanoid.MaxHealth .. ")"
        end)

        character.AncestryChanged:Connect(function(_, parent)
            if not parent then
                highlight:Destroy()
                nameLabel:Destroy()
            end
        end)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        updateESP(player)
    end)
end)

RunService.Heartbeat:Connect(function(deltaTime)
    for _, player in ipairs(Players:GetPlayers()) do
        updateESP(player)
    end
end)
