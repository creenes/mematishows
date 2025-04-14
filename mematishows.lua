local Players = game:GetService("Players")

local function CreateESP(player)
    -- Verdiğiniz kod buraya yerleştirildi
    local function starts(String, Start)
        return string.sub(String, 1, string.len(Start)) == Start
    end

    local headSize = 25
    local workspace = game:GetService("Workspace")

    local workspaceChildren = workspace:GetChildren()
    for i = 1, #workspaceChildren do
        local child = workspaceChildren[i]
        if (starts(child.Name, "PseudoCharacter")) then
            if (child:FindFirstChild("Hitboxes")) then
                local hitbox_mouse = child.Hitboxes.Mouse:GetChildren()
                local hitbox_touch = child.Hitboxes.Touch:GetChildren()

                for _, hit in ipairs(hitbox_mouse) do
                    if hit.Name == "Head" then
                        hit.Size = Vector3.new(headSize, headSize, headSize)
                    end
                end

                for _, hit in ipairs(hitbox_touch) do
                    if hit.Name == "Head" then
                        hit.Size = Vector3.new(headSize, headSize, headSize)
                    end
                end
            end
        end
    end
    -- Verdiğiniz kodun sonu

    -- ESP kodunuz buraya geliyor
    if not player.Character or not player.Character:FindFirstChild("Humanoid") then return end

    local character = player.Character
    local humanoid = character:FindFirstChild("Humanoid")

    -- Mevcut ESP öğelerini kaldır
    RemoveESP(player)

    -- Oyuncu adını gösteren etiket
    local nameLabel = Instance.new("BillboardGui")
    nameLabel.Name = "NameLabel"
    nameLabel.Adornee = character.Head
    nameLabel.Size = UDim2.new(0, 200, 0, 50)
    nameLabel.StudsOffset = Vector3.new(0, 2, 0)
    nameLabel.Parent = character

    local nameText = Instance.new("TextLabel")
    nameText.Size = UDim2.new(1, 0, 1, 0)
    nameText.BackgroundTransparency = 1
    nameText.TextColor3 = Color3.new(1, 1, 1)
    nameText.TextScaled = true
    nameText.Text = player.Name
    nameText.Parent = nameLabel

    -- Sağlık çubuğu
    local healthBar = Instance.new("BillboardGui")
    healthBar.Name = "HealthBar"
    healthBar.Adornee = character.Head
    healthBar.Size = UDim2.new(0, 100, 0, 10)
    healthBar.StudsOffset = Vector3.new(0, 1.5, 0)
    healthBar.Parent = character

    local healthBackground = Instance.new("Frame")
    healthBackground.Size = UDim2.new(1, 0, 1, 0)
    healthBackground.BackgroundColor3 = Color3.new(0, 0, 0)
    healthBackground.BackgroundTransparency = 0.5
    healthBackground.Parent = healthBar

    local healthFill = Instance.new("Frame")
    healthFill.Size = UDim2.new(0, 0, 1, 0)
    healthFill.BackgroundColor3 = Color3.new(0, 1, 0)
    healthFill.Parent = healthBackground

    -- Sağlık göstergesini tam sayı olarak güncelle
    local function UpdateESP()
        if not player.Character or not player.Character:FindFirstChild("Humanoid") or
           not character:FindFirstChild("NameLabel") or not character:FindFirstChild("HealthBar") then
            return
        end

        local currentHealth = math.floor(humanoid.Health) -- Sağlığı tam sayıya yuvarla
        local maxHealth = humanoid.MaxHealth

        healthFill.Size = UDim2.new(currentHealth / maxHealth, 0, 1, 0)
        healthFill.BackgroundColor3 = Color3.new(1 - (currentHealth / maxHealth), currentHealth / maxHealth, 0)
    end

    -- Sağlık değiştiğinde ESP'yi güncelle
    humanoid.Changed:Connect(function(property)
        if property == "Health" then
            UpdateESP()
        end
    end)

    UpdateESP() -- Başlangıçta ESP'yi güncelle

    -- Oyuncuyu vurgula
    local highlight = Instance.new("Highlight")
    highlight.Name = "PlayerHighlight"
    highlight.FillColor = Color3.new(1, 0, 0)
    highlight.OutlineColor = Color3.new(1, 0, 0)
    highlight.OutlineTransparency = 0
    highlight.Parent = character
end

local function RemoveESP(player)
    if player.Character then
        local nameLabel = player.Character:FindFirstChild("NameLabel")
        local healthBar = player.Character:FindFirstChild("HealthBar")
        local highlight = player.Character:FindFirstChild("PlayerHighlight")

        if nameLabel then nameLabel:Destroy() end
        if healthBar then healthBar:Destroy() end
        if highlight then highlight:Destroy() end
    end
end

-- Oyuncu katıldığında veya ayrıldığında tüm kodu yeniden başlat
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        CreateESP(player)
    end)
end)

Players.PlayerRemoving:Connect(RemoveESP)

-- Başlangıçta mevcut oyuncular için ESP oluştur
for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        CreateESP(player)
    end
end
