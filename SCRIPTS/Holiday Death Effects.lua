--all by solivion
function BreakJoints(Part:Part)
	for _,child in Part:GetJoints() do
		child:Destroy()
	end
end

function independenceDayEffect(character: Model)
	if not character or not character.PrimaryPart then return end
	local eagleCry = Instance.new("Sound")
	eagleCry.SoundId = "rbxassetid://491270608"  -- Replace with actual eagle cry sound ID
	eagleCry.Parent = character
	eagleCry:Play()

	local billboardGui = Instance.new("BillboardGui")
	billboardGui.Size = UDim2.new(5, 0, 2, 0)
	billboardGui.Adornee = character.PrimaryPart
	billboardGui.StudsOffset = Vector3.new(0, 3, 0)

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.Text = "??????????"
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.Font = Enum.Font.GothamBold
	textLabel.TextSize = 50
	textLabel.BackgroundTransparency = 1
	textLabel.Parent = billboardGui
 
	billboardGui.Parent = character
end

function halloweenEffect(character: Model)
	if not character then return end
	local random = math.random() > .5
	character:SetAttribute('Disconnect_Execution', true)
	if random then
		local timer = math.random() < .75 and 0 or math.random(20,40)/10
		local locked = math.random() > .5
		local start = math.random() < .7 and 0 or math.random(0,10)/100
		local rotation = math.random() > .5
		local startrotation = math.random() > .8
		local startrotationaccordedtostart = math.random() > .1
		for _, part in pairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				if locked then part.Anchored = true part.CanCollide = false end
				part.Transparency = part.Transparency + (start ~= 0 and start or math.random())
				if startrotation then
					if startrotationaccordedtostart then
						part.CFrame = part.CFrame * (startrotation and CFrame.Angles(math.random(),math.random(),math.random()) or CFrame.new())
					else
						part.CFrame = CFrame.new(part.Position)  * (startrotation and CFrame.Angles(math.random(),math.random(),math.random()) or CFrame.new())
					end
				end
				game:GetService("TweenService"):Create(part, TweenInfo.new((timer == 0 and math.random() * 4) or timer), {Transparency = 1, CFrame = part.CFrame * (rotation and locked and CFrame.Angles(math.random(),math.random(),math.random()) or CFrame.new())}):Play()
			end
			if part:IsA("Decal") or part:IsA("Texture") then
				part.Transparency = part.Transparency + (start ~= 0 and start or math.random())
				game:GetService("TweenService"):Create(part, TweenInfo.new((timer == 0 and math.random() * 5) or timer), {Transparency = 1}):Play()
			end
		end
	else
		if character then
			character.Archivable = true
			local timer = math.random() < .75 and 0 or math.random(25,50)/10
			local height = math.random() < .8 and 0 or 10
			local ghost = character:Clone()
			local start = math.random() < .75 and 0 or math.random(1,2)/10
			local rotation = math.random() > .5
			local startrotation = math.random() > .8
			local startrotationaccordedtostart = math.random() > .1
			ghost.Parent = workspace
			ghost.Name = ' '
			if ghost:FindFirstChildOfClass('Humanoid') then
				ghost:FindFirstChildOfClass('Humanoid').HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
				ghost:FindFirstChildOfClass('Humanoid').HealthDisplayDistance = 0
				ghost:FindFirstChildOfClass('Humanoid').NameDisplayDistance = 0
				ghost:FindFirstChildOfClass('Humanoid').DisplayName = ''
				ghost:FindFirstChildOfClass('Humanoid').MaxHealth = 0
				ghost:FindFirstChildOfClass('Humanoid').NameOcclusion = Enum.NameOcclusion.OccludeAll
			end
			for _, part in pairs(ghost:GetDescendants()) do
				if part:IsA("Decal") or part:IsA("Texture") then
					part.Transparency = part.Transparency + (start ~= 0 and start or math.random())
					game:GetService("TweenService"):Create(part, TweenInfo.new((timer == 0 and math.random() * 5) or timer), {Transparency = 1}):Play()
				end
				if part:IsA("BasePart") then
					part.CanCollide = false
					part.Anchored = true
					if startrotation then
						if startrotationaccordedtostart then
							part.CFrame = part.CFrame * (startrotation and CFrame.Angles(math.random(),math.random(),math.random()) or CFrame.new())
						else
							part.CFrame = CFrame.new(part.Position)  * (startrotation and CFrame.Angles(math.random(),math.random(),math.random()) or CFrame.new())
						end
					end
					part.Transparency = part.Transparency + (start ~= 0 and start or math.random())
					game:GetService("TweenService"):Create(part, TweenInfo.new((timer == 0 and math.random() * 5) or timer), {CFrame = part.CFrame * (rotation and CFrame.Angles(math.random(),math.random(),math.random()) or CFrame.new()) + Vector3.new(0, math.random() * height, 0), Transparency = 1}):Play()
				end
			end
			game:GetService("Debris"):AddItem(ghost, 4)
		end
	end
end

local physProperties = PhysicalProperties.new(0.919, 0.001, 0.15, 100, 1)
function christmasEffect(character: Model)
	local transparency = math.random()
	local timer = math.random(100,200)/100
		local breaks = math.random() > .95
		character:SetAttribute('Disconnect_Execution', true)
		for i,v in pairs(character:GetDescendants())  do
		if v:IsA('BasePart') then v.Archivable = true local cv = v:Clone() cv.CustomPhysicalProperties = physProperties cv.Transparency = 1 if cv:IsA('MeshPart') then cv:ClearAllChildren() cv.TextureID = '' else for i,b in cv:GetChildren() do if b:IsA('SpecialMesh') then b.TextureId = '' else b:Destroy() end end end cv.Parent = v v.CastShadow = false cv.Size = v.Size * 1.01 local weld = Instance.new('Glue', cv) weld.Part1 = cv weld.Part0 = v cv.Material = Enum.Material.Ice game:FindFirstChildOfClass('TweenService'):Create(v, TweenInfo.new(timer/1.25), {Transparency = 1}):Play() game:FindFirstChildOfClass('TweenService'):Create(cv, TweenInfo.new(timer), {Transparency = v.Transparency, Color = Color3.new(math.clamp(math.random(900,1000)/1000, .9, 1) , 1, 1)}):Play()
			if breaks or math.random() > .9 then
				task.delay(timer,function() if v then pcall(function() v.AssemblyLinearVelocity = v.Position - character.PrimaryPart.Position end) cv.CanCollide = true v.CanCollide = true	v.Anchored = false BreakJoints(v) if not weld or not weld:IsDescendantOf(v) then weld = Instance.new('Glue', cv) weld.Part1 = cv weld.Part0 = v end end end)
			end
		end
		if v:IsA("Decal") or v:IsA("Texture") then
			game:FindFirstChildOfClass('TweenService'):Create(v, TweenInfo.new(timer/1.25), {Transparency = 1}):Play()
		end
	end
	
end

function valentineEffect(character: Model)
	if not character or not character.PrimaryPart then return end
	for i = 1, math.random(8,12) do
		local heart = Instance.new("Part")
		local sp = Instance.new('SpecialMesh', heart)
		sp.MeshId = 'rbxassetid://431221914'
		heart.Shape = Enum.PartType.Ball
		local size = math.random(5,15)/10
		heart.Size = Vector3.new(size, size, size)
		heart.BrickColor = BrickColor.new("Bright red")
		heart.Position = character.PrimaryPart.Position + Vector3.new(math.random(-2, 2), 2, math.random(-2, 2))
		heart.Parent = workspace
		game:GetService("Debris"):AddItem(heart, 2)
	end

	for i = 1, math.random(3,4) do
		local heart = Instance.new("Part")
		local sp = Instance.new('SpecialMesh', heart)
		sp.MeshId = 'rbxassetid://146063878'
		sp.TextureId = 'rbxassetid://146063910'
		heart.Shape = Enum.PartType.Ball
		heart.Size = Vector3.new(1, 1, 1)
		heart.BrickColor = BrickColor.new("Bright red")
		heart.Position = character.PrimaryPart.Position + Vector3.new(0, i, 0)
		heart.Anchored = true
		game:GetService("TweenService"):Create(heart, TweenInfo.new(3), {Position = heart.Position + Vector3.new(0, 5, 0), Transparency = 1}):Play()
		heart.Parent = workspace
		game:GetService("Debris"):AddItem(heart, 3)
	end
end

function easterEffect(character: Model)
	if character and character.PrimaryPart then
		local sound = Instance.new('Sound', character.PrimaryPart)
		sound.SoundId = 'http://www.roblox.com/asset/?id=1836011812'
		sound.Looped = true
		sound:Play()
	else return end
	for i = 1, math.random(12,16) do
		local egg = Instance.new("Part")
		egg.Shape = Enum.PartType.Ball
		local at1 = Instance.new('Attachment', egg)
		local at2 = Instance.new('Attachment', egg)
		local t = Instance.new('Trail', egg)
		t.Attachment0 = at1 t.Attachment1 = at2
		at1.Position = Vector3.new(0,egg.Size.Y/2,0) at2.Position = Vector3.new(0,-egg.Size.Y/2,0)
		t.Lifetime = .1
		t.WidthScale = NumberSequence.new(1,0)
		t.Transparency = NumberSequence.new(0,1)
		local mesh = Instance.new('SpecialMesh', egg)
		mesh.MeshId = 'http://www.roblox.com/asset/?id=1527559'
		egg.Size = Vector3.new(math.random(50,100)/100, math.random(50,100)/100, math.random(50,100)/100)
		mesh.Scale = egg.Size
		egg.BrickColor = BrickColor.Random()
		egg.Position = character.PrimaryPart.Position + Vector3.new(math.random(-3, 3), 2, math.random(-3, 3))
		egg.AssemblyLinearVelocity = Vector3.new(math.random(-50, 50), math.random(25, 50), math.random(-50, 50))
		egg.Parent = workspace
		t.Color = ColorSequence.new(egg.Color, Color3.new(0,0,0))
		local sound = Instance.new('Sound', egg) sound.Parent = egg
		sound.SoundId = 'rbxassetid://1211938342'
		local touched = false
		local rbse1,rbse2
		game:FindFirstChildOfClass('TweenService'):Create(egg, TweenInfo.new(20), {Transparency = 1, Color = Color3.new(1,1,1)}):Play()
		local whentouch = function(a)
			if egg and not touched and a and a:FindFirstAncestorWhichIsA('Model') and a:FindFirstAncestorWhichIsA('Model') ~= character and a:FindFirstAncestorWhichIsA('Model'):FindFirstChildOfClass('Humanoid') then
				if rbse1 then rbse1:Disconnect() rbse1 = nil end 	if rbse2 then rbse2:Disconnect() rbse2 = nil end
				touched = true
				if sound then sound:Play() end
				egg.Anchored = true
				egg.CanCollide = false
				for i,v in egg:GetChildren() do if v:IsA('Trail') then v.Enabled = false end end
				egg.CanTouch = false
				egg.Material = Enum.Material.Neon
				game:FindFirstChildOfClass('TweenService'):Create(egg, TweenInfo.new(math.random(10,20)/20), {Transparency = 1, CFrame = egg.CFrame + Vector3.new(0,2,0), Color = Color3.new(0,0,0)}):Play()
			end
		end
		rbse1 = egg.Touched:Connect(whentouch) rbse2 = egg.TouchEnded:Connect(whentouch)
		task.delay(20,function()
			if rbse1 then rbse1:Disconnect() rbse1 = nil end 	if rbse2 then rbse2:Disconnect() rbse2 = nil end
			whentouch = nil
		end)
		game:GetService("Debris"):AddItem(egg, 20)
	end
end 

function newYearsEffect(character: Model)
	if not character or not character.PrimaryPart then return end
	local firework = Instance.new('Part', character)
	firework.Position = character.PrimaryPart.Position
	local connection: RBXScriptConnection?
	firework.Anchored = true
	Instance.new('Fire', firework)
	local sp = Instance.new('SpecialMesh', firework)
	sp.MeshId = 'http://www.roblox.com/asset/?id=162969265'
	sp.TextureId = 'http://www.roblox.com/asset/?id=162969520'
	local boom = false
	local speed = math.random(50,70) --math.random(90,110)
	local timeout = math.random(5,7)
	local fade = math.random(15,25)/100
	local splash 
	splash = function(thing: BasePart)
		if thing then
			if thing.Transparency >= 1 then return end
			local color = thing.Color or BrickColor.random().Color
			local pos = thing.Position
			local size = (timeout + speed)/7
			local interval = math.random(15,30)/10
			Instance.new('Explosion', workspace).Position = thing.Position
			for i = 1, math.clamp(math.random(15,25) - 7 * (thing:GetAttribute('Gen') or 0), 1, 25) do
				local partsize = Vector3.new(size, size, size) * math.random(90,110)/100
				local part = Instance.new('Part', workspace)
				game:FindFirstChildOfClass('Debris'):AddItem(part, 10)
				part.Color = color
				part.Transparency = thing.Transparency + fade
				part.Anchored = true
				part.Parent = workspace
				part:SetAttribute('Gen', (thing:GetAttribute('Gen') or 0) + 1)
				Instance.new('Fire', part)
				part.Material = Enum.Material.Neon
				part.CFrame = CFrame.new(pos) * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
				local offsetfrompos = Vector3.new(math.random() * (math.random() > .5 and 1 or -1),math.random() * (math.random() > .5 and 1 or -1),math.random() * (math.random() > .5 and 1 or -1)).Unit * (math.random(50,75) - (thing:GetAttribute('Gen') or 0) * 15)
				game:FindFirstChildOfClass('TweenService'):Create(part, TweenInfo.new(interval), {CFrame = part.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))) + offsetfrompos, Transparency = part.Transparency + fade, Size = part.Size * math.random()}):Play()
				if part.Transparency < 1 then
					task.delay(interval, function()
						splash(part)
						part:ClearAllChildren()
						game:FindFirstChildOfClass('TweenService'):Create(part, TweenInfo.new(interval * 4), {Transparency = 1, Size = Vector3.new()}):Play()
						game:FindFirstChildOfClass('Debris'):AddItem(part,interval * 4)
					end)
				else
					task.delay(interval, function()
						part:ClearAllChildren()
						part:Destroy()
					end)
				end
			end
		end
	end
	coroutine.resume(coroutine.create(function()
		while firework and timeout > 0 and not boom do
			local dt = task.wait(1/60)
			firework.CFrame = firework.CFrame * CFrame.Angles(0,math.random(),0) + Vector3.new(0, speed * dt, 0)
			speed -= 10 * dt
			timeout -= dt
			if workspace:Raycast(firework.Position + firework.CFrame.UpVector * (firework.Size.Y * 1.1), Vector3.new(0, speed * dt, 0)) then
				if speed > 50 then
					splash(firework)
					Instance.new('Explosion', firework).Position = firework
					boom = true
				else
					speed = 0
				end
			end
		end
		if not boom and firework then
			splash(firework)
			Instance.new('Explosion', firework).Position = firework.Position
			firework:Destroy()
		end
	end))
end

function thanksgivingEffect(character: Model)
	if not character or not character.PrimaryPart then return end
	local sound = Instance.new('Sound', character.PrimaryPart)
	sound.PlaybackSpeed = 1 + math.random(-10,10)/100
	sound.SoundId = 'http://www.roblox.com/asset/?id=13076573'
	sound:Play()
	for i = 1, math.random(3,6) do
		local turkey = Instance.new("Part")
		local special = Instance.new('SpecialMesh', turkey)
		special.MeshId = 'http://www.roblox.com/asset/?id=13073626'
		special.TextureId = 'http://www.roblox.com/asset/?id=13073598'
		turkey.Shape = Enum.PartType.Ball
		turkey.Size = Vector3.new(2, 2, 2)
		local random = math.random(10,20)/10
		special.Scale = Vector3.new(random,random,random)
		turkey.BrickColor = BrickColor.new("Reddish brown")
		turkey.Position = character.PrimaryPart.Position + Vector3.new(math.random(-2, 2), 2, math.random(-2, 2))
		turkey.Parent = workspace
		game:GetService("Debris"):AddItem(turkey, 5)
	end
end

function stPatrickEffect(character: Model)
	if not character or not character.PrimaryPart then return end
	for i = 1, math.random(12,20) do
		local coin = Instance.new("Part")
		local sound = Instance.new('Sound', coin)
		sound.PlaybackSpeed = 1 + math.random(-10,10)/100
		sound.SoundId = 'http://www.roblox.com/asset/?id=10066947742'
		sound:Play()
		coin.Size = Vector3.new(0.5, 0.5, 0.5)
		coin.Shape = Enum.PartType.Cylinder
		coin.BrickColor = BrickColor.new("Bright yellow")
		coin.Position = character.PrimaryPart.Position + Vector3.new(math.random(-2, 2), 2, math.random(-2, 2))
		coin.Rotation = Vector3.new(90, 0, 0)
		coin.Parent = workspace
		game:GetService("Debris"):AddItem(coin, 3)
		task.wait()
	end

	--[[local rainbow = Instance.new("Part")
	rainbow.Size = Vector3.new(10, 5, 0.1)
	rainbow.Position = character.PrimaryPart.Position + Vector3.new(0, 10, 0)
	rainbow.Anchored = true
	rainbow.BrickColor = BrickColor.new("Bright red")
	rainbow.Transparency = 0.5
	rainbow.CanCollide = false
	rainbow.Parent = workspace
	game:GetService("TweenService"):Create(rainbow, TweenInfo.new(3), {Transparency = 1}):Play()
	game:GetService("Debris"):AddItem(rainbow, 3)]]
end

function earthDayEffect(character: Model)
	if not (character and character:IsA('Model') and character:FindFirstChildOfClass('Humanoid') and character:FindFirstChildOfClass('Humanoid').RootPart) then return end
	local model = Instance.new('Folder', character)
	local treecenterdiameter = math.random(175,300)/100
	local leafdiameter = NumberRange.new(treecenterdiameter * 1.25, treecenterdiameter * 2.75)
	local tree = Instance.new("Part")
	tree.Size = Vector3.new(treecenterdiameter, 1, treecenterdiameter)
	local height = math.random(50,90)/10
	local raydown = workspace:Raycast(character:FindFirstChildOfClass('Humanoid').RootPart.Position, Vector3.new(0,-height,0))
	if not raydown then
		tree.Position = character:FindFirstChildOfClass('Humanoid').RootPart.Position + Vector3.new(0,height/2,0)
	else
		tree.Position = raydown.Position + Vector3.new(0,height/2,0)
	end
	tree.Anchored = true
	tree.Color = Color3.new(math.random(30,70)/100, math.random(30,40)/100, 0)
	tree.Parent = workspace
	tree.Transparency = 1
	tree.CFrame = CFrame.new(tree.Position) * CFrame.Angles(0,math.random(),0)
	tree.Parent = model
	for i = 1, math.random(20,30) do
		local leaves = Instance.new("Part")
		local targetsize = Vector3.new(math.random(leafdiameter.Min, leafdiameter.Max),math.random(leafdiameter.Min, leafdiameter.Max),math.random(leafdiameter.Min, leafdiameter.Max))
		leaves.Size = targetsize * math.random()
		leaves.Position = tree.Position + Vector3.new(0,math.random(treecenterdiameter) + tree.Size.Y/1.45,0) - (math.random() > .5 and 1 or -1) * (targetsize * math.random()/5 + Vector3.new(math.random(-leafdiameter.Max, leafdiameter.Max),0,math.random(-leafdiameter.Max, leafdiameter.Max))/1.75)
		leaves.Anchored = true
		leaves.Transparency = 1
		leaves.Color = Color3.new(math.random(30,70)/100, math.random(50,100)/100, 0)
		leaves.Parent = workspace
		leaves.Parent = model
		leaves.CFrame = CFrame.new(leaves.Position) * CFrame.Angles(math.random()/18,math.random(),math.random()/18)
		game:GetService("TweenService"):Create(leaves, TweenInfo.new(math.random() * 3), {Transparency = math.random(10,70)/100, Size = targetsize, CFrame = CFrame.new(leaves.Position - Vector3.new(0, (math.random() > .5 and 1 or -1) *  tree.Size.Y/2, 0)) * CFrame.Angles(math.random()/18,math.random(),math.random()/18) }):Play()
	end
	game:GetService("TweenService"):Create(tree, TweenInfo.new(math.random() * 3), {Transparency = 0, Size = Vector3.new(treecenterdiameter, 1 + height, treecenterdiameter), Position = tree.Position + Vector3.new(0, -height/2, 0)}):Play()
end

function aprilFoolsEffect(character: Model)
	local savedrot = character:GetPivot().Rotation
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = savedrot:GetComponents()
	local roty = math.asin(R02)
	local rotx = math.atan2(-R12, R22)
	local rotz = math.atan2(-R11, R00)
	local savedrot = CFrame.Angles(0,roty,rotz)
	local turnup = 1
	local light
	local lastpos
	if character:FindFirstChildOfClass('Humanoid') and character:FindFirstChildOfClass('Humanoid').RootPart then
		light = Instance.new('PointLight')
		light.Parent =  character:FindFirstChildOfClass('Humanoid').RootPart
	end
	while character and task.wait(.01) do
		if character:FindFirstChildOfClass('Humanoid') and character:FindFirstChildOfClass('Humanoid').RootPart then character:FindFirstChildOfClass('Humanoid').RootPart.Anchored = true end 
		if turnup < 90 then
			turnup += .5
		end
		if light then
			light.Brightness = turnup/2.5
			light.Range = turnup/5
		end
		lastpos= character:GetPivot()
		character:PivotTo(CFrame.new(character:GetPivot().Position) * CFrame.Angles(math.rad(turnup),0,0)* savedrot + Vector3.new(0,.005,0))
	end
	Instance.new('Explosion', workspace).Position = lastpos.Position
end

function applyHolidayEffect(character: Model)
	local date = os.date("*t")
	local month, day = date.month, date.day
	if character:GetAttribute('month') then
		month = character:GetAttribute('month')
	end
	if character:GetAttribute('day') then
		day = character:GetAttribute('day')
	end
	
	-- Determine which holiday effect to apply based on date
	if month == 7 and day == 4 then
		independenceDayEffect(character)
	elseif month == 10 and day == 31 then
		halloweenEffect(character)
	elseif month == 12 and (day == 24 or day == 25) then
		christmasEffect(character)
	elseif month == 2 and day == 14 then
		valentineEffect(character)
	elseif month == 4 and day >= 15 and day <= 21 then
		easterEffect(character) -- Using a general date range for Easter
	elseif month == 1 and day == 1 then
		newYearsEffect(character)
	elseif month == 11 and day == 25 then
		thanksgivingEffect(character)
	elseif month == 3 and day == 17 then
		stPatrickEffect(character)
	elseif month == 4 and day == 22 then
		earthDayEffect(character)
	elseif month == 4 and day == 1 then
		aprilFoolsEffect(character)
	end
end

local date = os.date("*t")
-->>in my hangout place you can set these attributes as well with the private server commands, the Script directory is in ServerScriptService with the exact same name, it needs to be written as game.ServerScriptService.Goofy_ahh_vfx<<--
-->>you can set the player's attribute<<--

-- Test function call (replace 'playerCharacter' with actual character reference)
game:FindFirstChildOfClass('Players').PlayerAdded:Connect(function(a)
	local dcon: RBXScriptConnection?
	a.CharacterAdded:Connect(function(char)
		if dcon then dcon:Disconnect() end
		dcon = nil
		if char:FindFirstChildOfClass('Humanoid') then
			if a:GetAttribute('Autoset') then
				char:SetAttribute('month', a:GetAttribute('month') or date.month)
				char:SetAttribute('day', a:GetAttribute('day') or date.day)
			end
			char:FindFirstChildOfClass('Humanoid').BreakJointsOnDeath = false
			dcon = char:FindFirstChildOfClass('Humanoid').Died:Once(function()
				applyHolidayEffect(char)
			end)
		end
	end)
end)

