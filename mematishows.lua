-- esp

local oyuncu = oyun.Oyuncular.YerelOyuncu
local karakter = oyuncu.Karakter veya oyuncu.KarakterEklendi:Bekle()

local vücutParçaları = {
    karakter:Bulunan("Gövde"),
    karakter:Bulunan("Sol Kol"),
    karakter:Bulunan("Sağ Kol"),
    karakter:Bulunan("Sol Bacak"),
    karakter:Bulunan("Sağ Bacak")
}

local yüz = karakter.Kafa:Bulunan("Yüz")

local saçlar = {}
for _, çocuk in ipairs(karakter:ÇocuklarıAl()) do
    if çocuk:IsA("Accessory") and çocuk.Adı:lower():find("saç") then
        table.insert(saçlar, çocuk)
    end
end

local vurgulamaRengi = Color3.new(1, 0, 0)
local vurgulamaSaydamlığı = 0.5

for _, parça in ipairs(vücutParçaları) do
    if parça then
        local vurgulama = Instance.new("Highlight")
        vurgulama.FillColor = vurgulamaRengi
        vurgulama.FillTransparency = vurgulamaSaydamlığı
        vurgulama.OutlineColor = vurgulamaRengi
        vurgulama.OutlineTransparency = 0
        vurgulama.Parent = parça
    end
end

if yüz then
    local yüzVurgulama = Instance.new("Highlight")
    yüzVurgulama.FillColor = vurgulamaRengi
    yüzVurgulama.FillTransparency = 1
    yüzVurgulama.OutlineColor = vurgulamaRengi
    yüzVurgulama.OutlineTransparency = 1
    yüzVurgulama.Parent = yüz
end

for _, saç in ipairs(saçlar) do
    local saçVurgulama = Instance.new("Highlight")
    saçVurgulama.FillColor = vurgulamaRengi
    saçVurgulama.FillTransparency = 1
    saçVurgulama.OutlineColor = vurgulamaRengi
    saçVurgulama.OutlineTransparency = 1
    saçVurgulama.Parent = saç
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
