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
                if highlight then highlight:Destroy() end
                if nameLabel then nameLabel:Destroy() end
            end
        end)
    end
end

local function onCharacterAdded(character)
    local player = Players:GetPlayerFromCharacter(character)
    if player then
        updateESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(onCharacterAdded)
    if player.Character then
        onCharacterAdded(player.Character)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        onCharacterAdded(player.Character)
    end
end

_G.HeadSize = 20
_G.Disabled = false -- Eğer devre dışı bırakmak istemiyorsanız 'false' olarak ayarlayın

RunService.RenderStepped:Connect(function()
    if not _G.Disabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name ~= Players.LocalPlayer.Name and player.Character and player.Character:FindFirstChild("Head") then
                pcall(function()
                    player.Character.Head.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                    player.Character.Head.Transparency = 1
                    player.Character.Head.BrickColor = BrickColor.new("Red")
                    player.Character.Head.Material = "Neon"
                    player.Character.Head.CanCollide = false
                    player.Character.Head.Massless = true
                end)
            end
        end
    end
end)
