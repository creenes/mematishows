-- esp

local Players = game:GetService("Players")

local function highlightPlayer(player)
    local character = player.Character or player.CharacterAdded:Wait()
    if character then
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.FillColor = Color3.new(1, 0, 0) -- Vurgu rengini ayarla
        highlight.OutlineColor = Color3.new(1, 1, 1) -- Çerçeve rengini ayarla
        highlight.OutlineTransparency = 0 -- Çerçeve saydamlığını ayarla
    end
end

local function removeHighlight(player)
    local character = player.Character
    if character then
        local highlight = character:FindFirstChild("Highlight")
        if highlight then
            highlight:Destroy()
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    highlightPlayer(player)
    player.CharacterAdded:Connect(function(character)
        highlightPlayer(player)
    end)

    player.CharacterRemoving:Connect(function(character)
        removeHighlight(player)
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    removeHighlight(player)
end)

for _, player in ipairs(Players:GetPlayers()) do
    highlightPlayer(player)
end

-- esp bitti sırada silent aim
-- slent aim

function starts(String,Start)
 
   return string.sub(String,1,string.len(Start))==Start
 
end
 
 
 
local headSize = 25
 
 
 
local workspace = game:GetService("Workspace")
 
 
 
 
 
while wait(1) do
 
    local workspaceChildren = workspace:GetChildren();
 
    for i = 1, #workspaceChildren do
 
        local child = workspaceChildren[i]
 
        if(starts(child.Name, "PseudoCharacter")) then
 
            if(child:FindFirstChild("Hitboxes")) then
 
	        local hitbox_mouse = child.Hitboxes.Mouse:GetChildren();
 
            local hitbox_touch = child.Hitboxes.Touch:GetChildren();
 
	        for i, child in ipairs(hitbox_mouse) do
 
	            if child.Name == "Head" then
 
	                local s = child.Size
 
	                local f = headSize
 
	                child.Size = Vector3.new(f, f, f)
 
	            end
 
	        end
 
	        for i, child in ipairs(hitbox_touch) do
 
	            if child.Name == "Head" then
 
                    local s = child.Size
 
                    local f = headSize
 
                    child.Size = Vector3.new(f, f, f)
 
	        end
 
	        end
 
	    end
 
	    end
 
end
 
end

-- silent bitti
