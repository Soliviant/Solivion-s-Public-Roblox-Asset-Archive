--Script By Solivion(2026)
--Put this under StarterGui, Or Any where a localscript would run Under an Actor Instance
--Add the parts you want the snow to interacts with to "FilterDescendantInstances"
task.desynchronize()
local acc = 0
local interv = 0.1
local par = RaycastParams.new()
par.RespectCanCollide = true
task.synchronize()
par.FilterDescendantsInstances = {workspace.Baseplate, workspace.SpawnLocation} -- I Scripted This In Baseplate, Change Accordingly!
par.IgnoreWater = false
par.FilterType = Enum.RaycastFilterType.Include
local Debris = game:GetService('Debris')
task.desynchronize()
local snowfolder = workspace:FindFirstChild('__SNOW')
if not snowfolder then
	task.synchronize()
	local fold = Instance.new('Folder')
	fold.Name = '__SNOW'
	fold.Parent = workspace
	snowfolder = fold
end
task.synchronize()
script.Destroying:Once(function()
	for i,v in snowfolder:GetChildren() do
		Debris:AddItem(v, 5)
	end
end)

task.synchronize()
local TweenService = game:GetService('TweenService')
local vel = Vector3.new(0,-5,0) + workspace.GlobalWind/10
local vel10 = vel * 10
local vmag = vel.Magnitude
local vmag5 = vmag * 5
local vmag10 = vmag5 * 2
function spawnsnow()
	task.desynchronize()
	local snowPosition = workspace.CurrentCamera.CFrame.Position + (Vector3.new(math.random(-1000,1000),math.random(-50,350),math.random(-1000,1000))/10) - vel * math.random(0,250)/100
	if snowPosition.Y <= -1 then snowPosition = snowPosition + Vector3.new(0,-snowPosition.Y + math.random(0,500)/25, 0) end
	if workspace:Raycast(snowPosition, -vel * 50, par) then
		spawnsnow()
		return -- under ceil 
	end
	task.synchronize()
	local snow = Instance.new("Part")
	snow.Size = Vector3.new(0.5,0.5,0.5)
	pcall(function() snow.Shape = Enum.PartType.Block end)
	snow.Anchored = true
	snow.CanCollide = false
	snow.Transparency = 1
	snow.CastShadow = false
	snow.Name = "snow"
	snow.Parent = workspace
	pcall(function() snow.Material = Enum.Material.Neon end)
	snow.Position = snowPosition
	snow.Parent = snowfolder or workspace
	Debris:AddItem(snow, 60)
	task.desynchronize()
	local checkdown checkdown= workspace:Blockcast(snow.CFrame, snow.Size, vel10, par)
	local waterattheend = false 
	local secd = vmag5 
	local d=vmag5 
	local tpa=.5 
	local tpb= 1 
	local leftt= 0 
	local ending
	local atime = 5 
	local btime = 5 
	if checkdown then waterattheend= checkdown.Material == Enum.Material.Water secd= math.max(0, checkdown.Distance - vmag5)  d=math.min(vmag5, checkdown.Distance)  tpa=math.min(1 - .5 * (d/vmag5), 1)  tpb=math.min(.5 + .5*(secd/vmag5), 1) atime = (5 * d/vmag5) btime = 5 * (secd/vmag5) leftt = (((secd > 0) and (5 - btime) or (atime))) local infen = TweenInfo.new(leftt,Enum.EasingStyle.Linear) local propend = {Transparency = 1, Size = waterattheend and Vector3.new(.5,.1,.5) or snow.Size, Position = waterattheend and (checkdown.Position - Vector3.new(0,.2,0)) or checkdown.Position} task.synchronize() ending = TweenService:Create(snow, infen, propend) task.desynchronize() end 
	task.desynchronize()
	local inf = TweenInfo.new(atime,Enum.EasingStyle.Linear)
	local prp = {Transparency = tpa, Position = snow.Position + vel.Unit * d}
	task.synchronize()
	TweenService:Create(snow, inf, prp):Play()
	task.delay(atime, function()if secd > 0 then
			task.desynchronize()
			if not snow then return end
			local prop =  {Transparency = tpb, Position = snow.Position + vel.Unit * secd}
			local info = TweenInfo.new(btime,Enum.EasingStyle.Linear)
			task.synchronize()
			local twn:Tween = TweenService:Create(snow, info,prop) 
			task.synchronize() twn:Play()
			if ending then twn.Completed:Wait()
				task.synchronize()
					ending:Play() 
				end
		 
	else 
		task.synchronize()
			ending:Play() -- it doesn't even have the chance to go into phase two, of course it hit an object
		end
		task.desynchronize()
		if not snow or not snow.Parent then return end
		task.wait(.1 + leftt) if not snow or not snow.Parent then return end  local dif =math.abs(1-snow.Transparency)	task.synchronize()
		if dif <= 0 then	snow:Destroy() else TweenService:Create(snow, TweenInfo.new(dif), {Transparency = 1}):Play() task.wait(dif) snow:Destroy() end
	end)
end

task.synchronize()
workspace:GetPropertyChangedSignal('GlobalWind'):ConnectParallel(function()
	vel = Vector3.new(0,-5,0) + workspace.GlobalWind/10
	vel10 = vel * 10
	vmag = vel.Magnitude
	vmag5 = vmag * 5
	vmag10 = vmag5 * 2
end)
task.desynchronize()
local heavy = false
pcall(function() heavy = workspace.IsItRaining.Value >= 5 end)
while true do
	task.desynchronize()
	local dt = task.wait()
	acc += dt 
	if acc > interv then
		interv = math.random()/10
		acc -= interv
		for i = 1, math.random(9,18) do task.desynchronize() spawnsnow() end	
	end
end

--Solivion, 1/1/2026, Yes I made these during new years, just releasing them later