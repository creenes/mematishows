-- esp

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local bodyParts = {
    character:FindFirstChild("Torso"),
    character:FindFirstChild("Left Arm"),
    character:FindFirstChild("Right Arm"),
    character:FindFirstChild("Left Leg"),
    character:FindFirstChild("Right Leg")
}

local face = character.Head:FindFirstChild("Face")

local hairs = {}
for _, child in ipairs(character:GetChildren()) do
    if child:IsA("Accessory") and string.lower(child.Name):find("hair") then
        table.insert(hairs, child)
    end
end

local highlightColor = Color3.new(1, 0, 0)
local highlightTransparency = 0.5

for _, part in ipairs(bodyParts) do
    if part then
        local highlight = Instance.new("Highlight")
        highlight.FillColor = highlightColor
        highlight.FillTransparency = highlightTransparency
        highlight.OutlineColor = highlightColor
        highlight.OutlineTransparency = 0
        highlight.Parent = part
    end
end

if face then
    local faceHighlight = Instance.new("Highlight")
    faceHighlight.FillColor = highlightColor
    faceHighlight.FillTransparency = 1
    faceHighlight.OutlineColor = highlightColor
    faceHighlight.OutlineTransparency = 1
    faceHighlight.Parent = face
end

for _, hair in ipairs(hairs) do
    local hairHighlight = Instance.new("Highlight")
    hairHighlight.FillColor = highlightColor
    hairHighlight.FillTransparency = 1
    hairHighlight.OutlineColor = highlightColor
    hairHighlight.OutlineTransparency = 1
    hairHighlight.Parent = hair
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
