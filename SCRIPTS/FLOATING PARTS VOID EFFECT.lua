--By Solivion, Laziest By Far
local Limit: number = 100
local TargetEffectParent: Instance? = workspace:FindFirstChild('__EFFECT') or workspace
local CooldownSpawn: number? = .175 -- How Long The While Loop Is Spaced
local TransitionInPeriodMultiplier: number = 3
local LifeTimePeriodMultiplier: number = 60
local Pointzero: CFrame = CFrame.new() -- Middle Location
local MinimalDistanceFromPointZeroInXAndZAxis: number = 125
local LimitedDistanceFromPointZero: number = 500
local LowestYRange: number, HighestYRange: number = 0,500
local ClampPartDistanceMode: ('ClampedToMax' | "LockedBetweenRange" | "Boundless") = 'LockedBetweenRange'

-- Core and Stuff
local AllEffectParts: {BasePart?} = {}

function GetSaturatedColor(color)
	local function clamp(value, min, max)
		if value < min then
			return min
		elseif value > max then
			return max
		else
			return value
		end
	end

	local r = clamp(color.r, 0, 1)
	local g = clamp(color.g, 0, 1)
	local b = clamp(color.b, 0, 1)

	local colorreturn
	pcall(function()
		local h, s, v = Color3.new(r, g, b):ToHSV()
		colorreturn = Color3.fromHSV(h, 1, v)
	end)
	return colorreturn
end


function GetMonotoneColor(color)
	local gray = (color.R + color.G + color.B) / 3
	return Color3.new(gray, gray, gray)
end

local function createAntigravityPart()
	local SpawnTransitTime = math.random() * TransitionInPeriodMultiplier
	local lifetime = math.random() * 60
	local FirstTargetSize = Vector3.new(
		Random.new():NextInteger(0.1,30),
		Random.new():NextInteger(0.1,30),
		Random.new():NextInteger(0.1,30)
	)
	local FirstTranspar = math.random()
	local TransitType = math.random(1,3)
	local ColorTransitType = math.random(1,3)
	local TargetColor = Color3.new(math.random(0,255),math.random(0,255),math.random(0,255))
	local part = Instance.new("Part", TargetEffectParent or workspace)
	part.Anchored = true
	if math.random() > .5 then
		part.Anchored = false
	end

	part.Massless = true
	part.CanCollide = false

	local gravityVector = Vector3.new(0, game.Workspace.Gravity, 0)

	local TargetedPartAttachment = Instance.new("Attachment")
	TargetedPartAttachment.Name = "TargetedPartAttachment"
	TargetedPartAttachment.Parent = part

	local vectorForce = Instance.new("VectorForce")
	vectorForce.RelativeTo = Enum.ActuatorRelativeTo.World
	vectorForce.Attachment0 = TargetedPartAttachment
	vectorForce.Force = gravityVector * part.AssemblyMass
	vectorForce.Parent = part

	part.Size = FirstTargetSize
	part.Material = Enum.Material.Neon
	local location = Vector3.new(math.random() > .5 and Random.new():NextInteger(MinimalDistanceFromPointZeroInXAndZAxis,2048) or -Random.new():NextInteger(MinimalDistanceFromPointZeroInXAndZAxis,2048), Random.new():NextInteger(LowestYRange,HighestYRange), math.random() > .5 and Random.new():NextInteger(MinimalDistanceFromPointZeroInXAndZAxis,2048) or -Random.new():NextInteger(MinimalDistanceFromPointZeroInXAndZAxis,2048))	
	
	part.CFrame = Pointzero * CFrame.new(
		location.Unit * (ClampPartDistanceMode == 'ClampedToMax' and math.clamp(location.Magnitude, MinimalDistanceFromPointZeroInXAndZAxis, LimitedDistanceFromPointZero) or ClampPartDistanceMode == 'LockedBetweenRange' and Random.new():NextInteger(MinimalDistanceFromPointZeroInXAndZAxis, LimitedDistanceFromPointZero) or location.Magnitude)
	) * CFrame.Angles(math.random(), math.random(), math.random())
	
	if ClampPartDistanceMode ~= 'Boundless' and (Pointzero.Position - part.Position).Magnitude > LimitedDistanceFromPointZero then part:Destroy() return end
	
	if TransitType == 1 then
		part.Color = TargetColor
	elseif TransitType == 2 then
		part.Color = GetSaturatedColor(TargetColor)
	else
		part.Color = GetMonotoneColor(TargetColor)
	end
	if TransitType == Color3 then
		part.Size = FirstTargetSize * math.random() * 2
	elseif TransitType == 2 then
		part.Size = FirstTargetSize * math.random()
	else
		part.Size = FirstTargetSize
	end
	if math.random() > .5 then
		part.Transparency = 1
	elseif math.random() < .5 then
		part.Transparency = 0
	else
		part.Transparency = FirstTranspar
	end
	if not table.find(AllEffectParts, part) then
		table.insert(AllEffectParts, part)
	end
	local removefromlist = function()
		if table.find(AllEffectParts, part) then
			table.remove(AllEffectParts, table.find(AllEffectParts, part))
		end
	end
	game:FindFirstChildOfClass('TweenService'):Create(part, TweenInfo.new(SpawnTransitTime), {Transparency = FirstTranspar, Size = FirstTargetSize, Color = TargetColor}):Play()
	task.delay(SpawnTransitTime, function()
		if part and part:IsDescendantOf(workspace) then
			vectorForce.Force = gravityVector * part.AssemblyMass
			part.Anchored = false
			part.Transparency = FirstTranspar
			part.AssemblyAngularVelocity = Vector3.new(Random.new():NextInteger(-15,15),Random.new():NextInteger(-15,15),Random.new():NextInteger(-15,15))
			part.Velocity = Vector3.new(Random.new():NextInteger(-10,10),Random.new():NextInteger(-10,10),Random.new():NextInteger(-10,10))
			part.Color = TargetColor
			game:FindFirstChildOfClass('Debris'):AddItem(part, lifetime)
			game:FindFirstChildOfClass('TweenService'):Create(part, TweenInfo.new(lifetime), {Transparency = 1, Size = math.random() < .9 and part.Size or part.Size * math.random() * 2}):Play()
			part.Destroying:Once(removefromlist)
			task.delay(lifetime, removefromlist)
			if ClampPartDistanceMode ~= 'Boundless' and (Pointzero.Position - part.Position).Magnitude > LimitedDistanceFromPointZero then removefromlist() part:Destroy() end
		else
			removefromlist()
		end
	end)
end

while task.wait(CooldownSpawn) and TargetEffectParent and script:IsDescendantOf(game) do
	if #AllEffectParts < Limit then
		createAntigravityPart()
	end
end