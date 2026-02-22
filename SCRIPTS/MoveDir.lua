--By Solivion
task.desynchronize()
task.wait(math.pi/5) --wait first.

local Chr = script:FindFirstAncestorWhichIsA('Model') and script:FindFirstAncestorWhichIsA('Model'):FindFirstAncestorWhichIsA('Model') or script:FindFirstAncestorWhichIsA('Model')
if not Chr then return end
local Hum: Humanoid = Chr:FindFirstChildOfClass('Humanoid') or Chr:WaitForChild('Humanoid', 10)
if not Hum or not Hum:IsA('Humanoid') then return end
local root = Hum.RootPart
local HipOri = {}
for i,v in Chr:GetDescendants() do
	if (v:IsA('Motor6D')) and (v.Name:upper():match('HIP') or v.Name:upper():match('ROOT') or v.Name:upper():match('NECK')) then
		HipOri[v] = v:GetAttribute('failsafe') or v.C0
		if not v:GetAttribute('c1') then task.synchronize() v:SetAttribute('c1', v.C1) task.desynchronize() end
		if not v:GetAttribute('failsafe') then	task.synchronize() v:SetAttribute('failsafe', v.C0) task.desynchronize() end
	end
end
function compareCFrame(a, b)
	if typeof(a) ~= "CFrame" or typeof(b) ~= 'CFrame' or a.LookVector:Dot(b.LookVector) < .98 or (a.Position - b.Position).Magnitude > .1 then return false end return true -- if cframe look the same(close enough), this thing will return false
end

--roblox's rig system befeelin lass trust worthy day by day.
local isr15 = Chr:FindFirstChild('UpperTorso') and Chr:FindFirstChild('UpperTorso'):IsA('BasePart') and Chr:FindFirstChild('LowerTorso') and Chr:FindFirstChild('LowerTorso'):IsA('BasePart')
if Chr:GetAttribute('R6') then
	isr15 = false
end
while Hum and root do
	task.desynchronize()
	local dt = task.wait()
	local speed = 1 - (10 ^ -2) ^ dt
	local WalkDirection = Hum.MoveDirection
	if not table.find({Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.Running, Enum.HumanoidStateType.Landed, Enum.HumanoidStateType.Jumping},Hum:GetState()) or (WalkDirection.Unit.Magnitude ~=  WalkDirection.Unit.Magnitude or WalkDirection.Unit.Magnitude < 1) then
		WalkDirection = root.CFrame.UpVector
	end
	--detect walking backward, it's lower with a bit offset so it doesn't do a quick spin while walking 90 degree to the left or right.
	if WalkDirection:Dot(root.CFrame.LookVector) < -0.05 then WalkDirection = -WalkDirection end
	local rvec = root.CFrame.RightVector
	local LeftRight = -rvec:Dot(WalkDirection)
	local FrontBack = table.find({Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.Swimming, Enum.HumanoidStateType.Climbing, Enum.HumanoidStateType.Landed, Enum.HumanoidStateType.Jumping},Hum:GetState()) and root.CFrame.LookVector:Dot(Hum.MoveDirection) or 0
	if Enum.HumanoidStateType.Running == Hum:GetState() then FrontBack = (root.AssemblyLinearVelocity:Dot(root.CFrame.LookVector) * root.AssemblyLinearVelocity.Magnitude/(96 * math.pi)) end
	
	-- 30 degree max for backward/forward stuff
	local XAng =  math.pi/6 * FrontBack
	-- 45 degree max for legs and torso. should add up to the walking angle if you ask me.
	local LegTransform = CFrame.Angles(0, math.pi/4 * LeftRight * (1), 0)
	local LegUntra = CFrame.Angles(0, math.pi/2 * LeftRight, 0)
	local TorsTransform = isr15 and CFrame.Angles(0, math.pi/4 * LeftRight, 0) or CFrame.Angles(Chr:GetAttribute('NO_DIR') and 0 or XAng, Chr:GetAttribute('NO_DIR') and 0 or math.pi/12 * LeftRight,  math.pi/4 * LeftRight)
	for i,v in HipOri do
		task.desynchronize()
		if typeof(i:GetAttribute('offset__C0')) == 'CFrame' then v = v*i:GetAttribute('offset__C0') end
		local iC0 = v
		if i.Name:upper():match('ROOT') then iC0 = i.C0:Lerp(v * TorsTransform, speed) elseif i.Name:upper():match('NECK') then  iC0 = i.C0:Lerp(v * TorsTransform:Inverse(), speed)
		else local revleg = (isr15 or Chr:GetAttribute('NO_DIR')) and CFrame.new() or CFrame.Angles(0,0,(i.Name:upper():match("LEFT") and -1 or 1) * XAng) local leg = CFrame.new(LegTransform:ToWorldSpace(v).Position) * v.Rotation * LegTransform iC0 = i.C0:Lerp(leg * revleg , speed) if not isr15 then local cw = i:GetAttribute('c1') local leg2 = CFrame.new(LegUntra:ToWorldSpace(cw).Position) * v.Rotation * LegUntra local iC1 = Chr:GetAttribute('NO_DIR') and i.C1 or i.C1:Lerp(leg2 + Vector3.new(0, math.abs(math.cos(XAng) - 1), math.sin(XAng)), speed) task.synchronize() i.C1 = iC1 end task.desynchronize()
		end
		--if not compareCFrame(iC0, i.C0) then continue end --Detects if it is different enough to sync and commit the change. u should use this if you removed the interpolation(lerp) to stop writing the weld with the same ahh cframe.
		task.synchronize()	
		i.C0 = iC0 
	end
end
