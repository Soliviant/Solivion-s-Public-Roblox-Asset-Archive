--By Solivion
--I'm Quite Busy Lately
local CloudSizeRange: NumberRange = NumberRange.new(10,20)
local CloudMat: Enum.Material = Enum.Material.SmoothPlastic
local ParentForCloudModels: Instance = workspace
local CloudColorRange: {R: NumberRange, G: NumberRange, B: NumberRange} = 
{
	R = NumberRange.new(0.9,1),
	G = NumberRange.new(0.9,1),
	B = NumberRange.new(0.9,1)
}
local MinimalDistanceFromPointZeroInXAndZAxis: number = 350
local LimitedDistanceFromPointZero: number = 1000
local LowestYRange: number, HighestYRange: number = 0,500
local ClampPartDistanceMode: ('ClampedToMax' | "LockedBetweenRange" | "Boundless") = 'LockedBetweenRange'
local CloudVelocity: Vector3 = (Vector3.new(math.random(), 0, math.random()) * math.random() * 20) or workspace.GlobalWind
local CloudLifetimeRange: NumberRange = NumberRange.new(60,240)
local PointZero: Vector3 = Vector3.new(0,50,0)
local CloudSpeed: number = 2.5
local SpawnsCloudEvery: NumberRange = NumberRange.new(1,2)
local CloudSeperationRange: {X: NumberRange, Y: NumberRange, Z: NumberRange} =
{
	X = NumberRange.new(-20,20),
	Y = NumberRange.new(-10,10),
	Z = NumberRange.new(-20,20)
	}
local CloudCluster: NumberRange = NumberRange.new(10,20)
local StarterCloud: number = math.random(1,2)
local CloudLimit = 35
local UpdateRate = .01

--core
local Debris = game:FindFirstChildOfClass("Debris")
local tweenService = game:FindFirstChildOfClass("TweenService")
local Clouds: {Model} = {}
local function createCloudPart(Model: Model): BasePart
	local part = Instance.new("Part", Model or workspace)
	part.Size = Vector3.new(math.random(CloudSizeRange.Min, CloudSizeRange.Max), math.random(CloudSizeRange.Min, CloudSizeRange.Max), math.random(CloudSizeRange.Min, CloudSizeRange.Max))
	part.Material = CloudMat or Enum.Material.SmoothPlastic
	part.Transparency = math.random(3, 7) / 10
	part.Color = Color3.new(Random.new():NextNumber(CloudColorRange.R.Min, CloudColorRange.R.Max),Random.new():NextNumber(CloudColorRange.G.Min, CloudColorRange.G.Max),Random.new():NextNumber(CloudColorRange.B.Min, CloudColorRange.B.Max))
	part.Anchored = false
	part.CanCollide = false
	part.Parent = Model or workspace
	tweenService:Create(part, TweenInfo.new(360), {Transparency = 1}):Play()
	if not Model.PrimaryPart then
		Model.PrimaryPart = part
	end
	return part
end

local function weldParts(part1, part2)
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = part1
	weld.Part1 = part2
	weld.Parent = part1
end


local function generateCloud(TargetParent: Instance): Model
	local Model = Instance.new('Model', TargetParent or ParentForCloudModels or workspace)
	local mainPart = createCloudPart(Model)
	mainPart.Position = Vector3.new(0, 50, 0)
	mainPart.Anchored = true
	
	for i = 1, (CloudCluster and math.random(CloudCluster.Min, CloudCluster.Max) or 20) do
		local part = createCloudPart(Model)
		part.Position = mainPart.Position + Vector3.new(math.random(CloudSeperationRange.X.Min, CloudSeperationRange.X.Max), math.random(CloudSeperationRange.Y.Min, CloudSeperationRange.Y.Max), math.random(CloudSeperationRange.Z.Min, CloudSeperationRange.Z.Max))
		weldParts(mainPart, part)
	end
	return Model
end

local function moveCloud(cloudModel: Model, Position: Vector3, Velocity: Vector3, Duration: number)
	local duration = Duration or math.random(10,20)
	local startPosition = Position or Vector3.new(-100, 50, 0)
	local endPosition = startPosition + Velocity * duration * (CloudSpeed or 1)
	local start = 0
	start = tick()
	local lasttick = start
	
	cloudModel:PivotTo(CFrame.new(startPosition))

	local tweenInfo = TweenInfo.new(duration)
	local goal = {CFrame = CFrame.new(endPosition)}

	
	Debris:AddItem(cloudModel, duration)
	
	coroutine.resume(coroutine.create(function()
		while task.wait(UpdateRate) and (tick() - start) <= Duration and (cloudModel:GetPivot().Position - PointZero).Magnitude < (LimitedDistanceFromPointZero * 5) and cloudModel do
			local dt = tick() - lasttick
			lasttick = tick()
			cloudModel:PivotTo(cloudModel:GetPivot() + Velocity * (CloudSpeed or 1) * dt)
		end
		if table.find(Clouds, cloudModel) then
			table.remove(Clouds, table.find(Clouds, cloudModel))
		end
		if cloudModel then	cloudModel:Destroy() end
	end))
end

function SummonCloud()
	if #Clouds >= CloudLimit then return end
	local Cloud = generateCloud(ParentForCloudModels or workspace)
	local location = Vector3.new(math.random() > .5 and Random.new():NextNumber(MinimalDistanceFromPointZeroInXAndZAxis,2048) or -Random.new():NextNumber(MinimalDistanceFromPointZeroInXAndZAxis,2048), Random.new():NextNumber(LowestYRange,HighestYRange), math.random() > .5 and Random.new():NextNumber(MinimalDistanceFromPointZeroInXAndZAxis,2048) or -Random.new():NextNumber(MinimalDistanceFromPointZeroInXAndZAxis,2048))	
	if location.Unit:Dot((CloudVelocity or workspace.GlobalWind).Unit) > 0 then location = -location end
	if Cloud then
		table.insert(Clouds, Cloud)
		Cloud.Destroying:Connect(function()
			if table.find(Clouds, Cloud) then
				table.remove(Clouds, table.find(Clouds, Cloud))
			end
		end)
		Debris:AddItem(Cloud,CloudLifetimeRange.Max)
		moveCloud(Cloud, (PointZero or Vector3.new(0,50,0)) + CFrame.new(
			location.Unit * (ClampPartDistanceMode == 'ClampedToMax' and math.clamp(location.Magnitude, MinimalDistanceFromPointZeroInXAndZAxis, LimitedDistanceFromPointZero) or ClampPartDistanceMode == 'LockedBetweenRange' and Random.new():NextNumber(MinimalDistanceFromPointZeroInXAndZAxis, LimitedDistanceFromPointZero) or location.Magnitude)).Position
			,
			CloudVelocity	or workspace.GlobalWind,
			Random.new():NextNumber(CloudLifetimeRange.Min, CloudLifetimeRange.Max))
	end
end

for i = 1, math.ceil(StarterCloud) do
	SummonCloud()
end
while task.wait(SpawnsCloudEvery and Random.new():NextNumber(SpawnsCloudEvery.Min, SpawnsCloudEvery.Max) or 30) do
	if #Clouds < CloudLimit then	SummonCloud() end
end
