--this is the one and only 'Egg RNG', Peak 2024 send off frfr??????????
--By @Solivion
--Disclaimer: this script completely generates random egg names from random mixup, it was never meant to correlate to any terms in any language whatsoever, please add filter for possible bad words

local Debris: Debris = game:FindFirstChildOfClass('Debris')

--this unique name maker thing from Chat-GPT
local randomPrefixes = {"Zor", "Lux", "Fen", "Vor", 'pho', 'pher', "Ark", 'flux', 'pha', 'pol', "Zyn", "Gra", "Kil", "Mur", "Tan", "Xa", "laz", "Beo", "El", "Qua", 'Kir', 'Cur', 'Bhur'}
local randomSyllables = {"li", "no", "sha", "ra", "mi", "to", "ze", "ka", "me", "do", "ri", "ti", "la", "vi", 'que', 'ax', "go"}
local randomSuffixes = {"lon", "ra", "xis", "tor", "nik", "sil", "dra", "mon", "tak", "mir", "vok", "zan", "nok", 'vion', 'lyth', 'acz', 'nor', 'xo', "tas", "lox"}

type RegisterTypes = ('Touch' | 'Tool' | 'None')
type EggTypeInfo = {
	Name: string,
	Texture: (string | BrickColor | Color3),
	Mesh: (Instance | string),  -- Either an Asset ID or an instance (MeshPart or special mesh)
	Rarity: number,
	RegisterType: RegisterTypes
}
type EggInfo = {
	Collected: boolean,
	AnchorType: ('Anchored' | 'Unanchored'),
	Name: string,
	RegisterType: RegisterTypes,
	EggType: number,
	Event: RBXScriptConnection?  -- Storing event for disconnecting later
}

local CheckedMaximumRarity = 0;
local Dataset: {[BasePart?]: EggInfo} = {}
local Eggpedia: {[number?]: EggTypeInfo} = {}
local Storage: {[number?]: {[number?]: number}} = {}  -- Table to store player inventories
local ChatCon: {[Player?] : RBXScriptConnection} = {}
local Players = game:FindFirstChildOfClass("Players")

--Stuff
local registerTypes: {RegisterTypes} = {'Touch', 'Tool', 'None'}
local eggNames: {string} = {"Egg", 'Thingamabob', 'Silly Egg', 'Egg 2', 'Random Egg Thing', 'Name', 'Placeholder', '???', 'Cool Egg'}
local textures: {(string | BrickColor | Color3)} = {}
for r = 1,255,10 do
	for g = 1,255,10 do
		for b = 1,255,10 do
			table.insert(textures, Color3.fromRGB(r,g,b))
		end
	end
end
local uniqueNames = {}
function GenerateName()
	local name
	repeat
		name = ""
		local componentCount = math.random(2, 4)  -- Number of components in the name (2-4 parts)

		for _ = 1, componentCount do
			local componentType = math.random(1, 3)
			if componentType == 1 then
				name = name .. randomPrefixes[math.random(#randomPrefixes)]
			elseif componentType == 2 then
				name = name .. randomSyllables[math.random(#randomSyllables)]
			else
				name = name .. randomSuffixes[math.random(#randomSuffixes)]
			end
		end
	until not uniqueNames[name]  -- Ensure uniqueness

	uniqueNames[name] = true
	return name
end
function ProperCase(name)
	return name:sub(1, 1):upper() .. name:sub(2):lower()
end
for i = 1,1000 do
	local Name = ProperCase(GenerateName() or 'ERROR')..' Egg'
	if not table.find(eggNames, Name) then
		table.insert(eggNames, Name)
	end
end
uniqueNames = {}
local meshes: {(string | SpecialMesh | MeshPart)} = {"rbxassetid://1527559", nil}
local latestapply: number = 0
local NoneLeft = math.round(25)

function GenerateRandomEggs(numEggs: number): {number}
	if not numEggs or typeof(numEggs) ~= 'number' or numEggs < 1 then numEggs = 1 end
	local Sofar: {number} = {}
	local ToolAmount = math.floor(numEggs/4)
	
	for i = 1, numEggs do
		if #eggNames <= 0 then warn('Ran out of Egg names') break end
		if #textures <= 0 then warn('Ran out of Egg textures') break end
		local eggName = #eggNames > 0 and eggNames[math.random(1, #eggNames)] or 'NULL'
		local texture = #textures > 0 and textures[math.random(1, #textures)] or Color3.new(math.random(),math.random(),math.random) or BrickColor.random() or nil
		local mesh = #meshes > 0 and meshes[math.random(1, #meshes)] or nil
		local rarity = math.random(1, 10)  -- Rarity between 1 and 5
		local registerType = #registerTypes > 0 and registerTypes[math.random(1, #registerTypes)] or 'Touch'
		local indice = latestapply + 1
		if registerType == 'None' then NoneLeft -= 1 if NoneLeft <= 0 and table.find(registerTypes, 'None') then table.remove(registerTypes, table.find(registerTypes, 'None')) end end
		if registerType == 'Tool' then ToolAmount -= 1 if ToolAmount <= 0 and table.find(registerTypes, 'Tool') then table.remove(registerTypes, table.find(registerTypes, 'Tool')) end end
		if Eggpedia[indice] then
			repeat
				indice += 1
				if not Eggpedia[indice] then break end
			until not Eggpedia[indice]
		end
		if table.find(eggNames, eggName) then	table.remove(eggNames, table.find(eggNames, eggName)) end
		if table.find(textures, texture) then	table.remove(textures, table.find(textures, texture)) end
		-- Add egg to Eggpedia
		Eggpedia[indice] = {
			Name = eggName,
			Texture = texture,
			Mesh = mesh,
			Rarity = rarity,
			RegisterType = registerType
		}

		-- Update maximum rarity if this egg has a higher rarity
		if rarity > CheckedMaximumRarity then
			CheckedMaximumRarity = rarity
		end
		latestapply = indice
		table.insert(Sofar, indice)
	end
	return Sofar
end

-- Function to determine which egg to spawn based on rarity
function GetRandomEggBasedOnRarity(): number?
	local totalWeight = 0
	local eggWeights = {}

	-- Calculate weights based on rarity
	for id, eggData in pairs(Eggpedia) do
		if eggData.Rarity then
			local weight = CheckedMaximumRarity - eggData.Rarity + 1
			totalWeight = totalWeight + weight
			table.insert(eggWeights, {id = id, weight = totalWeight})
		end
	end

	-- Generate a random number and select the egg
	local randomWeight = math.random(1, totalWeight)
	for _, eggWeight in ipairs(eggWeights) do
		if randomWeight <= eggWeight.weight then
			return eggWeight.id  -- Return the selected egg ID
		end
	end
	return nil  -- If no egg is selected, return nil
end

for i,v in ipairs(Eggpedia) do
	if v and v.Rarity and v.Rarity > CheckedMaximumRarity then
		CheckedMaximumRarity = v.Rarity
	end
end

-- Function to register egg data
function Register_Data(Egg: BasePart, Data: EggInfo, Overwrite: boolean?)
	if not Egg or not (typeof(Egg) == 'Instance') then warn('[[Egg requires a "BasePart" argument]]') return {} end
	if not Overwrite and Dataset[Egg] then warn('[[Egg already registered]]') return end
	if not Data then Data = {} end
	Data.Collected = Data.Collected or false
	Data.AnchorType = (Data.AnchorType == 'Anchored' or Data.AnchorType == 'Unanchored') and Data.AnchorType or 'Unanchored'
	Data.RegisterType = (Data.RegisterType == 'Touch' or Data.RegisterType == 'Tool' or Data.RegisterType == 'None') and Data.RegisterType or 'None'
	Dataset[Egg] = Data
	return Data
end

function DefaultSM(Parent: Instance, Texture: string, Mesh: string): SpecialMesh
	-- Default mesh if none specified
	if not Parent then Parent = workspace end
	local spMesh = Instance.new("SpecialMesh")
	spMesh.Parent = Parent
	if not Mesh or typeof(Mesh) ~= 'string' then
		spMesh.MeshType = Enum.MeshType.Sphere
	else
		spMesh.MeshId = Mesh
	end
	if Texture and typeof(Texture) == "string" then
		spMesh.TextureId = Texture
	end
	return spMesh
end
-- Function to create an egg
function CreateEgg(Parent: Instance?, EggType: number, Anchored: boolean?): BasePart
	if not EggType then return end
	local EggData = Eggpedia[EggType]
	if not EggData then warn("Invalid Egg Type") return end
	-- Create the basic part (egg body)
	local Part = Instance.new('Part', Parent or workspace)
	Part.Name = EggData.Name
	Part.Anchored = Anchored or false

	local TextureID = EggData.Texture or ""
	if EggData.Texture and TextureID and (typeof(TextureID) == 'Color3' or typeof(TextureID) == 'BrickColor') then
		if typeof(TextureID) == 'BrickColor'  then
			Part.BrickColor = TextureID
		elseif typeof(TextureID) == 'Color3' then
			Part.Color = TextureID
		end
	end
	
	if typeof(EggData.Mesh) == "string" then
		DefaultSM(Part, EggData.Texture or "", EggData.Mesh)
	elseif typeof(EggData.Mesh) == "Instance" then
		local Mesh = EggData.Mesh:Clone()
		if Mesh:IsA("BasePart") then
			if Part then Mesh.Parent = Part.Parent Part:Destroy() end
			Part = Mesh
		elseif Mesh:IsA("SpecialMesh") then
			Mesh.Parent = Part
			Mesh.TextureID = EggData.Texture or Mesh.TextureID or ""  -- Use texture if provided, otherwise use default
		else -- unrelated
			EggData.Mesh = nil
			Mesh:Destroy()
			DefaultSM(Part)
		end
	else
		DefaultSM(Part)
	end

	Register_Data(Part, {
		Collected = false,
		AnchorType = Anchored and 'Anchored' or 'Unanchored',
		RegisterType = EggData.RegisterType or 'None',
		Name = Part.Name or 'LOREM IPSUM',
		EggType = EggType or 0,
		Event = nil  -- Initially no event is connected
	})

	return Part
end

local Parameter = RaycastParams.new()
Parameter.IgnoreWater = true
Parameter.FilterType = Enum.RaycastFilterType.Include
Parameter.RespectCanCollide = true
Parameter.FilterDescendantsInstances = {}
if workspace:FindFirstChild('Map') then
	Parameter:AddToFilter(workspace:FindFirstChild('Map'))
end
if workspace:FindFirstChildOfClass('Terrain') then
	Parameter:AddToFilter(workspace:FindFirstChildOfClass('Terrain'))
end

-- Function to spawn an egg at a specified position
function SpawnEgg(Parent: Instance,Position: Vector3?, EggType: number)
	local Egg = CreateEgg(workspace, EggType or 0, false)
	if not Egg then return end
	Egg.Position = Position or Vector3.new(0, 10, 0)
	Egg.Parent = Parent or workspace
	local destroy
	destroy = Egg.Destroying:Once(function()
		if Egg and Dataset[Egg] and Dataset[Egg].Event then Dataset[Egg].Event:Disconnect() end
		Dataset[Egg] = nil
		if destroy then destroy:Disconnect() end
	end)

	if Eggpedia[EggType] and Eggpedia[EggType].RegisterType ~= 'None' then
		Debris:AddItem(Egg, 600)
		SetupEggCollection(Egg, Dataset[Egg].RegisterType)
	else
		local Cast = workspace:Blockcast(Egg.CFrame, Egg.Size, Vector3.new(0,-100,0), Parameter)
		if Egg and Cast and Cast.Instance and (not Cast.Instance:FindFirstAncestorWhichIsA("Model") or not not Cast.Instance:FindFirstAncestorWhichIsA("Model"):FindFirstChildOfClass('Humanoid')) then
			Egg.Parent = workspace
			Egg.Anchored = true
			Egg.CFrame = CFrame.new(Cast.Position, Cast.Position + Cast.Normal) * CFrame.Angles(math.rad(-90),math.random(),0)
		end
		if Egg and Dataset[Egg] and Dataset[Egg].Event then Dataset[Egg].Event:Disconnect() end
		Dataset[Egg] = nil
		if destroy then destroy:Disconnect() end
	end
end

-- Function to handle egg collection
function CollectEgg(Player, Egg)
	if not Player or not Egg then return end
	local EggData = Dataset[Egg]
	if EggData and not EggData.Collected then
		EggData.Collected = true
		if not Storage[Player.UserId] then Storage[Player.UserId] = {} end
		Storage[Player.UserId][EggData.EggType] = (Storage[Player.UserId][EggData.EggType] and Storage[Player.UserId][EggData.EggType] + 1) or 1

		-- Display collection UI
		ShowCollectedUI(Player, EggData)

		-- Disconnect the event for this egg (if it exists)
		if EggData.Event then
			EggData.Event:Disconnect()
			EggData.Event = nil
		end

		-- Clear Data
		if Egg and Dataset[Egg] then
			Dataset[Egg] = nil
		end
		Debris:AddItem(Egg, .25)
	end
end

-- Setting up a simple UI for when an egg is collected
function CreateUI(PlayerGui: PlayerGui?): (ScreenGui , BindableEvent)
	if not PlayerGui then return end
	local CollectedUI: ScreenGui?, TriggerEvent: BindableEvent?
	if not PlayerGui:FindFirstChild('__EASTER') then
		CollectedUI = Instance.new("ScreenGui", PlayerGui)
		CollectedUI.Name = '__EASTER'
		local LastTween: Tween
		local Message = Instance.new("TextLabel", CollectedUI)
		Message.Size = UDim2.new(0.3, 0, 0.1, 0)
		Message.Position = UDim2.new(0.35, 0, 0.1, 0)
		Message.Text = "SOLIVION WAS HERE"
		Message.BackgroundColor3 = Color3.new(0, 0, 0)
		Message.TextScaled = true
		local UICORNER = Instance.new('UICorner', Message)
		UICORNER.CornerRadius = UDim.new(1,0)
		game:FindFirstChildOfClass('TweenService'):Create(UICORNER, TweenInfo.new(.5), {CornerRadius = UDim.new(0.25,0)}):Play()
		TriggerEvent = Instance.new('BindableEvent', CollectedUI)
		TriggerEvent.Name = '__UIREQUEST'
		local Connection: RBXScriptConnection
		Connection = TriggerEvent.Event:Connect(function(SentFrom: Script, Data: EggInfo)
			if (not Message or not CollectedUI or not PlayerGui) and Connection then
				Connection:Disconnect()
				return
			end
			if SentFrom == script and Data and Data.Name and Data.EggType and Eggpedia[Data.EggType] then
				if LastTween then LastTween:Cancel() end
				local Rarity: number? = Eggpedia[Data.EggType].Rarity or 0
				local Output = math.clamp(Rarity/CheckedMaximumRarity, 0, 1)
				if PlayerGui and PlayerGui:FindFirstChild('__INVENTORIES') and PlayerGui:FindFirstChild('__INVENTORIES'):FindFirstChildOfClass('BindableEvent') then
					PlayerGui:FindFirstChild('__INVENTORIES'):FindFirstChildOfClass('BindableEvent'):Fire(Data.EggType)
				end
				if Message then
					local Additional = 15 * (Rarity/CheckedMaximumRarity)
					local Saved = Message.Rotation
					if Saved ~= 0 then
						Message.Rotation = -(Saved) + (Saved >=0 and -Additional or Additional)
					else
						Message.Rotation = (math.random() > .5 and -Additional or Additional)
					end
					Message.Transparency = 0
					Message.TextColor3 = Color3.new(1,1,1)
					Message.Text = "You collected: " .. Data.Name
					Message.BackgroundColor3 = Color3.new(Output, 0, 1 - Output)
					Message.BorderSizePixel = Message.BorderSizePixel + ((Rarity/CheckedMaximumRarity) * Message.AbsoluteSize.Magnitude)
					local ThisLastTween = game:FindFirstChildOfClass('TweenService'):Create(Message, TweenInfo.new(Message.BorderSizePixel/25), {Transparency = 1, BorderSizePixel = 0, Rotation = 0, TextColor3 = Color3.new(0,0,0), BackgroundColor3 = Color3.new(1,1,1)})
					LastTween = ThisLastTween
					if LastTween == ThisLastTween then
						LastTween:Play()
						task.delay(LastTween.TweenInfo.Time, function()
							if LastTween == ThisLastTween and CollectedUI then
								CollectedUI:Destroy()
							end
						end)
					end
				end
			end
		end)
	else
		CollectedUI = PlayerGui:FindFirstChild('__EASTER')
		if CollectedUI:FindFirstChildOfClass('BindableEvent') then
			TriggerEvent = CollectedUI:FindFirstChildOfClass('BindableEvent')
		end
	end
	return CollectedUI, TriggerEvent
end

function ShowCollectedUI(Player: Player, EggData: EggInfo)
	if not Player or not EggData then return end
	local VariantNumber = EggData.EggType
	if not Eggpedia[VariantNumber] then
		return
	end
	local PlayerGui: PlayerGui? = Player:FindFirstChildOfClass("PlayerGui")
	if PlayerGui and EggData then
		local UI, Event = CreateUI(PlayerGui)
		if UI and Event then
			Event:Fire(script, EggData)
		end
	end
end

function Inventory(PlrGUI: PlayerGui, Player: Player)
	if PlrGUI and Player then
		local UIEvent
		if not PlrGUI:FindFirstChild("__INVENTORIES") then
			local ScreenUI: ScreenGui = Instance.new("ScreenGui")
			local ScreenUIFrame: ScrollingFrame = Instance.new("ScrollingFrame")
			local ScrollingFrame: UIListLayout = Instance.new("UIListLayout")
			local UICornerScrollingFrame: UICorner = Instance.new("UICorner")
			local UIGradientScrollingFrame: UIGradient = Instance.new("UIGradient")
			local BindedEvent: BindableEvent = Instance.new("BindableEvent")
			local Disclaimer: TextLabel = Instance.new('TextLabel')
			ScreenUI.Parent = PlrGUI
			ScreenUI.Name = '__INVENTORIES'
			Disclaimer.Parent = ScreenUI
			Disclaimer.TextWrapped = true
			Disclaimer.BackgroundTransparency = 1
			Disclaimer.TextStrokeTransparency = 1
			Disclaimer.TextColor3 = Color3.new(1,0,0)
			Disclaimer.TextTransparency = 1
			Disclaimer.Position = UDim2.fromScale(-.25,.5)
			Disclaimer.Size = UDim2.fromScale(.25, .075)
			Disclaimer.Text = [[Egg names are never meant to be correlated to any terms, They're randomly generated]]
			Disclaimer.TextWrapped = true
			ScreenUIFrame.Position = UDim2.fromScale(-.25,0)
			ScreenUIFrame.Size = UDim2.fromScale(0,.5)
			ScreenUIFrame.Parent = ScreenUI
			ScreenUIFrame.BackgroundTransparency = 1
			ScreenUIFrame.CanvasSize = UDim2.fromScale(.1,0.3) + UDim2.fromOffset(0,55 * math.clamp(#ScreenUIFrame:GetChildren() - 2, 0, math.huge))
			ScreenUIFrame.VerticalScrollBarInset = Enum.ScrollBarInset.None
			ScreenUIFrame.ScrollBarThickness = .25
			ScreenUIFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
			ScrollingFrame.Parent = ScreenUIFrame
			ScrollingFrame.Padding = UDim.new(0,5)
			ScrollingFrame.Wraps = true
			ScrollingFrame.SortOrder = Enum.SortOrder.LayoutOrder
			UIGradientScrollingFrame.Parent = Disclaimer
			UIGradientScrollingFrame.Transparency = NumberSequence.new(0,1)
			UIGradientScrollingFrame.Offset = Vector2.new(-1,0)
			game:FindFirstChildOfClass('TweenService'):Create(Disclaimer, TweenInfo.new(1.25), {Position = UDim2.fromScale(.05,.5), TextStrokeTransparency = 0, TextTransparency = 0}):Play()
			game:FindFirstChildOfClass('TweenService'):Create(ScreenUIFrame, TweenInfo.new(1), {Size = UDim2.fromScale(.25,.5), Position = UDim2.fromScale(.05,0), BackgroundTransparency = .5 , BackgroundColor3 = Color3.new(0.133333, 0.133333, 0.133333)}):Play()
			game:FindFirstChildOfClass('TweenService'):Create(UIGradientScrollingFrame, TweenInfo.new(1), {Offset = Vector2.new(1,0)}):Play()
			UICornerScrollingFrame.Parent = ScreenUIFrame
			BindedEvent.Parent = ScreenUI
			local function CreateNewLabel(i: number): Frame?
				local EggType = i
				local EggData = Eggpedia[EggType]
				if EggType and EggData and ScreenUIFrame then
					local EntryFrame: Frame?
					if ScreenUIFrame and ScreenUIFrame:FindFirstChild("OBJECT_"..EggData.Name.."_ENTRY") then
						EntryFrame = ScreenUIFrame:FindFirstChild("OBJECT_"..EggData.Name.."_ENTRY")
						if EntryFrame then
							EntryFrame.BackgroundColor3 = Color3.new(1,1,1)
							EntryFrame.Size = UDim2.new(1, 0, 0, 100)
							game:FindFirstChildOfClass("TweenService"):Create(EntryFrame, TweenInfo.new(1), {BackgroundColor3 = (EggData.Texture and typeof(EggData.Texture) == 'Color3' and EggData.Texture) or Color3.new(100,100,100), Size = UDim2.new(1, 0, 0, 50)}):Play()
							if EntryFrame:FindFirstChild('__AMOUNT') then
								EntryFrame:FindFirstChild('__AMOUNT').Text = tostring(Storage[Player.UserId][i] and Storage[Player.UserId][i] > 1 and Storage[Player.UserId][i] or '')..'	'
							end
						end
					else
						EntryFrame = Instance.new("Frame")
						EntryFrame.Size = UDim2.new(1, 0, 0, 0)
						EntryFrame.BackgroundColor3 = Color3.new(0,0,0)
						game:FindFirstChildOfClass("TweenService"):Create(EntryFrame, TweenInfo.new(1), {Size = UDim2.new(1, 0, 0, 50), BackgroundColor3 = (EggData.Texture and typeof(EggData.Texture) == 'Color3' and EggData.Texture) or Color3.new(100,100,100)}):Play()
						EntryFrame.Parent = ScreenUIFrame
						EntryFrame.Name = "OBJECT_"..EggData.Name.."_ENTRY"

						local Corner = Instance.new("UICorner", EntryFrame)
						Corner.CornerRadius = UDim.new(0.5,0)

						local Gradient = Instance.new('UIGradient', EntryFrame)
						Gradient.Offset = Vector2.new(0,5)
						if (EntryFrame.BackgroundColor3.R + EntryFrame.BackgroundColor3.B + EntryFrame.BackgroundColor3.B) < 1.5 then
							Gradient.Color = ColorSequence.new(Color3.new(0,0,0), Color3.new(1,1,1))
						else
							Gradient.Color = ColorSequence.new(Color3.new(1,1,1), Color3.new(0,0,0))
						end
						Gradient.Rotation = 90
						game:FindFirstChildOfClass("TweenService"):Create(Gradient, TweenInfo.new(1), {Offset = Vector2.new(0,0)}):Play()

						local EggName = Instance.new("TextLabel")
						EggName.Size = UDim2.new(1, 0, 0.25, 0)
						EggName.Position = UDim2.new(0, 0, 0.5, 5)
						EggName.Text = '		Variant ID:'..tostring(i)
						EggName.TextColor3 = Color3.fromRGB(255, 255, 255)
						EggName.TextScaled = true
						EggName.BackgroundTransparency = 1
						EggName.Parent = EntryFrame
						EggName.TextXAlignment = Enum.TextXAlignment.Left

						local EggRetrievedDate = Instance.new("TextLabel")
						EggRetrievedDate.Size = UDim2.new(1, 0, 0.5, 0)
						EggRetrievedDate.Position = UDim2.new(0, 0, 0, 5)
						EggRetrievedDate.Text = '	'..(EggData.Name or "Unknown Egg").. '	'
						EggRetrievedDate.TextColor3 = Color3.fromRGB(255, 255, 255)
						EggRetrievedDate.TextScaled = true
						EggRetrievedDate.BackgroundTransparency = 1
						EggRetrievedDate.Parent = EntryFrame
						EggRetrievedDate.TextXAlignment = Enum.TextXAlignment.Left

						local EggRarity = Instance.new("TextLabel")
						EggRarity.Size = UDim2.new(1, 0, 0.4, 0)
						EggRarity.Position = UDim2.new(0, 0, 0.55, 0)
						EggRarity.Text = "Rarity: " .. tostring(EggData.Rarity or "N/A") .. '	'
						EggRarity.TextColor3 = Color3.new(EggData.Rarity/CheckedMaximumRarity,0, 1 - EggData.Rarity/CheckedMaximumRarity)
						EggRarity.TextStrokeColor3 = Color3.new(1 - EggRarity.TextColor3.R, 0, 1 - EggRarity.TextColor3.B)
						EggRarity.TextStrokeTransparency = 0
						EggRarity.TextScaled = true
						EggRarity.BackgroundTransparency = 1
						EggRarity.Parent = EntryFrame
						EggRarity.TextXAlignment = Enum.TextXAlignment.Right

						local EggAmount = Instance.new("TextLabel")
						local color = EggData.Rarity/CheckedMaximumRarity
						EggAmount.Name = '__AMOUNT'
						EggAmount.Size = UDim2.new(1, 0, 0.45, 0)
						EggAmount.Position = UDim2.new(0, 0, 0.1, 0)
						EggAmount.Text = tostring(Storage[Player.UserId][i] and Storage[Player.UserId][i] > 1 and Storage[Player.UserId][i] or '')..'	'
						EggAmount.TextColor3 = Color3.new(color,color,color)
						EggAmount.TextStrokeColor3 = Color3.new(1 - color, 1 - color, 1 - color)
						EggAmount.TextScaled = true
						EggAmount.TextStrokeTransparency = 0
						EggAmount.BackgroundTransparency = 1
						EggAmount.Parent = EntryFrame
						EggAmount.TextXAlignment = Enum.TextXAlignment.Right

						if ScreenUIFrame then
							ScreenUIFrame.CanvasSize = ScreenUIFrame.CanvasSize + UDim2.fromOffset(0,55)
						end
					end
					if EntryFrame then
						EntryFrame.LayoutOrder = EggData.Rarity
					end
					return EntryFrame
				end
			end
			if Player and Storage[Player.UserId] then
				for i,v in pairs(Storage[Player.UserId]) do
					--create entries for eggpedia
					if i and Eggpedia[i] then
						CreateNewLabel(i)
					end
				end
			end
			if ScreenUIFrame and not ScreenUIFrame:FindFirstChildOfClass('Frame') then
				local PlaceHolder = Instance.new('TextLabel', ScreenUIFrame)
				PlaceHolder.Size = UDim2.fromScale(1,1)
				PlaceHolder.Position = UDim2.fromScale(0, .2)
				PlaceHolder.Text = '~<{Inventory Is Currently Empty}>~'
				PlaceHolder.TextSize = 10
				PlaceHolder.BackgroundTransparency = 1
				PlaceHolder.TextStrokeTransparency = 0
				PlaceHolder.TextColor3 = Color3.new(1,1,1)
				PlaceHolder.TextWrapped = true
				PlaceHolder.TextScaled = false
				ScreenUIFrame.ChildAdded:Once(function()
					ScreenUIFrame.BackgroundColor3 = Color3.new(1,1,1)
					game:FindFirstChildOfClass('TweenService'):Create(ScreenUIFrame, TweenInfo.new(.5), {BackgroundColor3 = Color3.new(0.133333, 0.133333, 0.133333)}):Play()
					if PlaceHolder then
						Debris:AddItem(PlaceHolder, .5)
						game:FindFirstChildOfClass('TweenService'):Create(PlaceHolder, TweenInfo.new(.5), {TextTransparency = 1, TextSize = 15, TextStrokeTransparency = 1, TextColor3 = Color3.new(0.333333, 1, 0) , TextStrokeColor3 = Color3.new(1,1,1)}):Play()
					end
				end)
			end
			UIEvent = BindedEvent.Event:Connect(function(i: number)
				if i and Eggpedia[i] then
					CreateNewLabel(i)
				end
			end)
		else
			PlrGUI:FindFirstChild("__INVENTORIES"):Destroy()
		end
		return UIEvent
	end
end

-- Setting up player storage and connecting events
Players.PlayerAdded:Connect(function(Player: Player)
	if not Player then return end
	local UIEvent: RBXScriptConnection
	local ThisCon: RBXScriptConnection
	local Debounce: boolean = false
	if Player and not Storage[Player.UserId] then Storage[Player.UserId] = {} end  -- Initialize player inventory
	if Player and ChatCon[Player] then ChatCon[Player]:Disconnect() end
	ThisCon = Player.Chatted:Connect(function(Message, Target)
		if not Player or Debounce or Target or not Message or not Storage[Player.UserId] then if not Storage[Player.UserId] then Storage[Player.UserId] = {} end if not Player then if ThisCon then ThisCon:Disconnect() end if Player and ChatCon[Player] then ChatCon[Player]:Disconnect() ChatCon[Player] = nil end end return end
		Debounce = true
		task.delay(.5, function()
			Debounce = false
		end)
		if Message:upper():sub(1,#"!INVENTORY" + 1):match("!INVENTORY") or Message:upper():sub(1,#"/e !INVENTORY" + 1):match("/E !INVENTORY") then
			--Create UI if none existed
			local PlrGUI: PlayerGui? = Player and Player:FindFirstChildOfClass("PlayerGui") 
			if UIEvent then UIEvent:Disconnect() end
			local Connection = Inventory(PlrGUI, Player)
			if Connection then
				UIEvent = Connection
			end
		end
	end)
	if Player and ThisCon then ChatCon[Player] = ThisCon end
end)

Players.PlayerRemoving:Connect(function(Player: Player)
	if Player and ChatCon[Player] then ChatCon[Player]:Disconnect() ChatCon[Player] = nil end
end)

-- Collect eggs on touch
function SetupEggCollection(Egg: BasePart, Type: RegisterTypes)
	if not Egg or not Dataset[Egg] then return end
	local EggData = Dataset[Egg]
	if EggData and EggData.RegisterType == Type then
		local Debounce = false
		local thisevent: RBXScriptConnection
		local BillboardGui, TweenOut, TextLabel, UICorner, UIStroke
		if EggData.RegisterType == 'Tool' and not Egg:FindFirstChildOfClass('BillboardGui') then
			BillboardGui = Instance.new("BillboardGui", Egg)
			BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			BillboardGui.Active = true
			BillboardGui.LightInfluence = 1
			BillboardGui.AlwaysOnTop = true
			BillboardGui.Size = UDim2.new(1.5, 0, 1.5, 0)
			BillboardGui.ClipsDescendants = false
			BillboardGui.MaxDistance = 15

			TextLabel = Instance.new("TextLabel")
			TextLabel.Size = UDim2.new(1, 0, 1, 0)
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.TextStrokeTransparency = 0
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14
			TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.Text = "Require Basket"
			TextLabel.TextWrapped = true
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.TextScaled = true
			TextLabel.Parent = BillboardGui

			UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(1, 0)
			UICorner.Parent = TextLabel

			UIStroke = Instance.new("UIStroke")
			UIStroke.Transparency = 1
			UIStroke.Thickness = 0
			UIStroke.Color = Color3.fromRGB(255, 255, 255)
			UIStroke.Parent = TextLabel
		elseif EggData.RegisterType == 'Tool' and Egg:FindFirstChildOfClass('BillboardGui') then
			BillboardGui = Egg:FindFirstChildOfClass('BillboardGui')
			TextLabel = BillboardGui:FindFirstChildOfClass('TextLabel')
			UICorner = TextLabel:FindFirstChildOfClass('UICorner')
			UIStroke = TextLabel:FindFirstChildOfClass('UIStroke')
		end
		if UIStroke then
			TweenOut =	game:FindFirstChildOfClass('TweenService'):Create(UIStroke, TweenInfo.new(1), {Thickness = 10, Transparency = 1, Color = Color3.new(1,1,1)})
		end
		thisevent = Egg.Touched:Connect(function(Hit: BasePart)
			if Debounce or not Hit or not Hit.Parent or not Hit.Parent:FindFirstChildOfClass('Humanoid') then return end  -- Safeguard against deleted parts or null hierarchy
			Debounce = true
			task.delay(1, function() Debounce = false end)
			if not Egg or not Dataset[Egg] or Dataset[Egg].Collected then if thisevent then thisevent:Disconnect() end return end
			if EggData.RegisterType == 'Tool' and (not Hit.Parent:FindFirstChildOfClass('Tool') or not Hit.Parent:FindFirstChildOfClass('Tool'):GetAttribute('__EasterRegister')) then if UIStroke then UIStroke.Color = Color3.new(1,0,0) UIStroke.Transparency = 0 UIStroke.Thickness = 0 TweenOut:Play() end return end
			local Player = Players:GetPlayerFromCharacter(Hit.Parent)
			if Player then
				if Hit.Parent and Hit.Parent:IsA('Model') then
					Egg.Material =Enum.Material.Neon
					Egg.CanCollide = false
					Egg.Anchored = true
					game:FindFirstChildOfClass('TweenService'):Create(Egg, TweenInfo.new(.25), {CFrame = Hit.Parent:GetPivot(), Size = Vector3.new(), Transparency = 1}):Play()
					if Egg:FindFirstChildOfClass('SpecialMesh') then
						game:FindFirstChildOfClass('TweenService'):Create(Egg:FindFirstChildOfClass('SpecialMesh'), TweenInfo.new(.25), {Scale = Vector3.new()}):Play()
					end
					if Egg and Dataset[Egg] and Dataset[Egg].EggType and Eggpedia[Dataset[Egg].EggType] then
						local particle = Instance.new('ParticleEmitter', Egg)
						local pedia: EggTypeInfo = Eggpedia[Dataset[Egg].EggType]
						particle.Brightness = pedia.Rarity * 5/CheckedMaximumRarity
						particle.SpreadAngle = Vector2.new(360,360)
						particle.Color = ColorSequence.new(Egg.Color, Color3.new(1,1,1))
						particle.Transparency = NumberSequence.new(0,1)
						particle.RotSpeed = NumberRange.new(30,60)
						particle.Speed = NumberRange.new(pedia.Rarity * 2.5,pedia.Rarity * 5)
						particle:Emit(math.round(pedia.Rarity * 5))
						Debris:AddItem(particle, .2)
					end
				end
				CollectEgg(Player, Egg)
			end
		end)
		if EggData.Event then
			EggData.Event:Disconnect()
		end
		EggData.Event = thisevent
	end
end

GenerateRandomEggs(1000)
local UncollectableSpawnLeft = 25
local Folder = Instance.new('Folder',workspace)
Folder.Name = '__Easter'
while task.wait(1) do
	if #Folder:GetChildren() < 100 then
		local RandomEgg = GetRandomEggBasedOnRarity()
		if Eggpedia[RandomEgg] and (Eggpedia[RandomEgg].RegisterType ~= 'None' or UncollectableSpawnLeft > 0) then
			if Eggpedia[RandomEgg].RegisterType == 'None' then UncollectableSpawnLeft -= 1 end
			SpawnEgg(Folder,Vector3.new(math.random(-150,150),math.random(10,150), math.random(-150,150)), RandomEgg)
		elseif Eggpedia[RandomEgg] and UncollectableSpawnLeft <= 0 then
			Eggpedia[RandomEgg] = nil -- limit reached, removing unneccessary data to save memory
		end
	end
end
-- SillySolyMyle lolol