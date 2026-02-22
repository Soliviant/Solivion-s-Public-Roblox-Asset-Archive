--<<Solivion>>--
--<<Personnally you can only use it for head with consistant shape, if you want another way then CSG is there for you to implement>>--
--Size is a scale of 0-1: 0% Head Size - 100% Head Size
local HeadShadow: {BasePart: {BasePart}?} = {}
local ShadowWeld: {BasePart: Weld?} = {}
local HeadTick: {BasePart: number?} = {}
local ShadowAnimate: {BasePart: thread?} = {}
local HeadEvent: {BasePart: RBXScriptConnection?} = {}

function ClearData(Head: BasePart)
	if HeadShadow[Head] then for i,v in HeadShadow[Head] do if ShadowWeld[v] then ShadowWeld[v]:Destroy() ShadowWeld[v] = nil end v:Destroy() end end
	if ShadowAnimate[Head] then coroutine.close(ShadowAnimate[Head]) end
	if HeadEvent[Head] then HeadEvent[Head]:Disconnect() end
	HeadTick[Head] = tick()
end

function ShadowHead(Head: BasePart, Transparency: number?, Amount: number?, Size: number?, Color: Color3?)
	if not Head then return end Transparency = Transparency or 0.9 Amount = Amount or 5 Size = Size or 0.1 Color = Color or Color3.new(0,0,0)
	local Tick Tick = tick()
	ClearData(Head)
	HeadEvent[Head] = Head.Destroying:Once(function()
		ClearData(Head)
	end)
	HeadTick[Head] = Tick
	HeadShadow[Head] = {}
	local StoredClone = Head:Clone() for i,v in StoredClone:GetChildren() do if v:IsA('Light') or v:IsA('Sound') or v:IsA('ParticleEmitter') or v:IsA('JointInstance') or v:IsA('Constraint') or v:IsA('Texture') or v:IsA('BillboardGui') or v:IsA('SurfaceGui') or v:IsA('Decal') then v:Destroy() end end
	local UniversalSize = (StoredClone.Size * 1.025) - Vector3.new(0, StoredClone.Size.Y, 0) * 0.05 StoredClone.Color = Color StoredClone.Transparency = Transparency StoredClone.CastShadow = false StoredClone.CanCollide = false StoredClone.CanTouch = false StoredClone.CanQuery = false StoredClone.Material = Enum.Material.Neon
	for i = 1, math.ceil(Amount) do
		local ShadowHead = StoredClone:Clone()
		ShadowHead.Parent = Head
		ShadowHead.Size = UniversalSize - Vector3.new(0,UniversalSize.Y * Size * ((math.ceil(Amount) + 1) - i),0)/2 - Vector3.new(0,UniversalSize.Y/4,0)
		local HeadAttach = Instance.new('Weld')
		HeadAttach.Parent = ShadowHead
		HeadAttach.Part1 = ShadowHead
		HeadAttach.Part0 = Head
		HeadAttach.Name = 'AccessoryWeld'
		HeadAttach.C0 = --[[CFrame.new(Vector3.new(0,UniversalSize.Y * Size * ((math.ceil(Amount) + 1) - i),0)/2]] CFrame.new( -Vector3.new(0, ShadowHead.Size.Y, 0)/2 + Vector3.new(0, Head.Size.Y, 0)/2) + Vector3.new(0,UniversalSize.Y/16,0) --[[ - Vector3.new(0, UniversalSize.Y/4, 0)]]
		HeadShadow[Head][i] = ShadowHead
		ShadowWeld[ShadowHead] = HeadAttach
	end
	if StoredClone then StoredClone:Destroy() StoredClone = nil end
	ShadowAnimate[Head] = coroutine.create(function()
		while task.wait(.01) and Head and HeadShadow[Head] and HeadEvent[Head] and HeadTick[Head] == Tick do
			
		end
	end)
	if HeadTick[Head] == Tick and ShadowAnimate and ShadowAnimate[Head] then
		--coroutine.resume(ShadowAnimate[Head])
	end
end

--Example Usage
workspace.DescendantAdded:Connect(function(what)
	if what:IsA('Model') and what:FindFirstChildOfClass('Humanoid') then
		local Head = what:FindFirstChild('Head')
		local Hum = what:FindFirstChildOfClass('Humanoid')
		local TransitTime = Random.new():NextInteger(5,15)
		local latesti = 1
		local lasttick = tick()
		coroutine.resume(coroutine.create(function()
			lasttick = tick()
			for i = latesti,TransitTime,0.1 do
				local d = tick() - lasttick
				lasttick = tick()
				if not what or not Head or not Hum or Hum:GetState() == Enum.HumanoidStateType.Dead then break end
				i = i - d * 5
				latesti = i
				ShadowHead(Head, 0.75 + 0.025 * ((TransitTime - i)/TransitTime) * 10, 10 - ((TransitTime - i)/TransitTime) * 10, 0.05 + ((TransitTime - i)/TransitTime) * 10 * 0.01)
				task.wait(.01)
			end
		end))
		if what and Hum then
			pcall(function()
				Hum.Died:Once(function()
					lasttick = tick()
					for i = latesti,0,-0.1 do
						local d = tick() - lasttick
						i = i - d * 5
						lasttick = tick()
						if not what or not Head then break end
						latesti = i
						ShadowHead(Head, 0.75 + 0.025 * ((TransitTime - i)/TransitTime) * 10, 10 - ((TransitTime - i)/TransitTime) * 10, 0.05 + ((TransitTime - i)/TransitTime) * 10 * 0.01)
						task.wait(.01)
					end
				end)
			end)
		end
	end
end)