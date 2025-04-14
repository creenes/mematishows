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

local Players = game:GetService("Players")

local function HighlightAllPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            local character = player.Character
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                local highlight = Instance.new("Highlight")
                highlight.Name = "PlayerHighlight"
                highlight.FillColor = Color3.new(1, 0, 0) -- Set highlight color
                highlight.OutlineColor = Color3.new(1, 0, 0)
                highlight.OutlineTransparency = 0
                highlight.Parent = character
            end
        end
    end
end

local function ClearHighlights()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            local character = player.Character
            local highlight = character:FindFirstChild("PlayerHighlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end

-- Update highlights when players join or leave
Players.PlayerAdded:Connect(function(player)
    if player.Character then
        local character = player.Character
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            local highlight = Instance.new("Highlight")
            highlight.Name = "PlayerHighlight"
            highlight.FillColor = Color3.new(1, 0, 0)
            highlight.OutlineColor = Color3.new(1, 0, 0)
            highlight.OutlineTransparency = 0
            highlight.Parent = character
        end
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        local character = player.Character
        local highlight = character:FindFirstChild("PlayerHighlight")
        if highlight then
            highlight:Destroy()
        end
    end
end)

-- Optional: Loop to continuously update highlights
while true do
    HighlightAllPlayers()
    wait(1) -- Adjust highlight update frequency
    ClearHighlights()
end
