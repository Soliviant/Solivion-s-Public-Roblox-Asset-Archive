--[[
  Name: Multidirectional Climbing System
  Author: @Solivion
  Disclaimer: [movement is character relative and registered using keybind, not camera or WalkDirection],This does not contain mobile support, the default  roblox climbing movement is still there, it might overlap and boost the climbing speed or make the movement slanted up/down
  Date: 20/10/2024
]]--

--LocalScript, StarterPlayer » StarterCharacterScript

--<<Setting>>--
local speedsetting = .5 -- speed multiplier
local Debug = false -- prints stuff out, for testing and stuff
local DisableYAxis = true -- Roblox Already Allow Climbing Up And Down Motion. Setting this to false might boost the movement
local interpolatedirection = false -- make movement direction interpolate
local interpolatemovement = true -- make movement speed smoother
local interpolationspeed = 10 -- related to the option above
local poweredinterpolation = true -- will ignore the above if set, will change equation to 1 - (10 ^ -6) * dt

--<<Core>>--
local UserInputService: UserInputService = game:GetService("UserInputService")
local CurrentMovement: Vector3 = Vector3.new()
local CurrentDirection: Vector3 = Vector3.new()
local StartUpRuntime: number = 0
local Character: Model? = script:FindFirstAncestorWhichIsA('Model')
local Humanoid: Humanoid? = Character and Character:FindFirstChildOfClass("Humanoid")
if not Character then return end
if not Humanoid then
	repeat Humanoid = Character and Character:FindFirstChildOfClass("Humanoid") local DT = task.wait(1) StartUpRuntime += DT until not Character or StartUpRuntime >= 60 or Humanoid
end
if not Character or not Humanoid then script:Destroy() return end
--load variables
local Root = Humanoid and Humanoid.RootPart
local LastState: Enum.HumanoidStateType = Humanoid and Humanoid:GetState() or Enum.HumanoidStateType.Physic
local Param = RaycastParams.new()
Param.RespectCanCollide = true
Param.FilterDescendantsInstances = {Character}
Param.FilterType = Enum.RaycastFilterType.Exclude

-- Debug thingy
function display(...)
	if Debug then
		print(...)
	end
end 

-- Function to get movement direction from keyboard input, cuz Humanoid.MoveDirection Doesn't do so well as of my first attempts
function getMovementDirection()
	local moveDirection = Vector3.new()
	local iszero = true
	if not DisableYAxis then
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then
			moveDirection = moveDirection + Vector3.new(0, 0, 1)
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then
			moveDirection = moveDirection + Vector3.new(0, 0, -1)
		end
	end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        moveDirection = moveDirection + Vector3.new(-1, 0, 0)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        moveDirection = moveDirection + Vector3.new(1, 0, 0)
	end
	local isZero = moveDirection.X == 0 and moveDirection.Y == 0 and moveDirection.Z == 0
	return isZero and Vector3.new() or moveDirection.Unit
end

function IsInvalid(Vector: Vector3)
	if not Vector or typeof(Vector) ~= 'Vector3' then return true end
	local isInfinite = Vector.X == math.huge or Vector.Y == math.huge or Vector.Z == math.huge
	local isZero = Vector.X == 0 and Vector.Y == 0 and Vector.Z == 0
	local isNaN = tostring(Vector.X) == "nan" or tostring(Vector.Y) == "nan" or tostring(Vector.Z) == "nan"

	return isInfinite or isZero or isNaN
end

--Humanoid and Character Received, Connect Event
local ClimbCoroutine: thread
function PivotChar(Position, Normal, Angle)
	if not Position or not Normal or typeof(Normal) ~= "Vector3" or typeof(Position) ~= "Vector3" then return end
	if not Angle then Angle = 0 end
	local Angled = CFrame.new(Position, Position + Normal) * CFrame.Angles(0, math.rad(Angle), 0)
	if Character and Angled then
		Character:PivotTo(Angled)
	end
end
function CloseCoroutine()
	if ClimbCoroutine and coroutine.status(ClimbCoroutine) == "running" then coroutine.close(ClimbCoroutine) end
end
local StateChangedEvent = Humanoid.StateChanged:Connect(function(Old: Enum.HumanoidStateType, New: Enum.HumanoidStateType)
	if LastState ~= New then
		if New == Enum.HumanoidStateType.Climbing then
			CloseCoroutine()
			local NewThread
			NewThread = coroutine.create(function()
				CurrentDirection = Vector3.new()
				CurrentMovement = Vector3.new()
				while Character and Humanoid and Root and (Humanoid:GetState() == Enum.HumanoidStateType.Climbing) do
					local dt = task.wait()
					local CharacterPivot = Character:GetPivot()
					local MoveDir = getMovementDirection() or Vector3.new()
					if interpolatedirection then
						if not poweredinterpolation then
							CurrentDirection = CurrentDirection:Lerp(MoveDir, (dt * (interpolationspeed or 10)))
						else
							CurrentDirection = CurrentDirection:Lerp(MoveDir, 1 - ((10 ^ -6) ^ dt))
						end
						if CurrentDirection.Magnitude < 0.05 then
							CurrentDirection = Vector3.new()
						end
						MoveDir = CurrentDirection
					end
					local TargetDir = (MoveDir.Magnitude ~= 0 and not IsInvalid(MoveDir)) and Root.CFrame:VectorToWorldSpace(Vector3.new(MoveDir.X, MoveDir.Z, 0).Unit) or Vector3.new()
					if interpolatemovement then
						if not poweredinterpolation then
							CurrentMovement = CurrentMovement:Lerp(TargetDir, (dt * (interpolationspeed or 10)))
						else
							CurrentMovement = CurrentMovement:Lerp(TargetDir, 1 - ((10 ^ -6) ^ dt))
						end
						if CurrentMovement.Magnitude < 0.05 then
							CurrentMovement = Vector3.new()
						end
						TargetDir = CurrentMovement
					end
					if TargetDir.Magnitude ~= 0 and not IsInvalid(TargetDir) then
						--local MOVE = (TargetDir * 16 * dt)
						local dtspeed = dt * speedsetting * (Humanoid and Humanoid.WalkSpeed or 16)
						local RayA = workspace:Raycast(CharacterPivot.Position, TargetDir, Param)
						local GoingForFloor = TargetDir.Y <= -0.85
						local BlockSize = Root.Size/4
						if RayA then
							display('ray direction')
							local RayAPosition = CharacterPivot.Position + (RayA.Position - CharacterPivot.Position) * dtspeed
							if GoingForFloor then
								display('floor found, breaking thread')
								PivotChar(RayAPosition, RayA.Normal, 0)
								NewThread = nil
								break
							else
								PivotChar(RayAPosition, RayA.Normal, 180 + (MoveDir.X > 0 and 90 or MoveDir.X < 0 and -90 or 0))
							end
						else
							local RayB = workspace:Blockcast(CharacterPivot + TargetDir, BlockSize, Root.CFrame.LookVector * Root.Size.Z, Param)
							if RayB then
								local RayBPosition = CharacterPivot.Position + (RayB.Position - CharacterPivot.Position) * dtspeed
								display('ray surface')
								PivotChar(RayBPosition, RayB.Normal, 180) -- Same Surface, Same Angle
							else
								if TargetDir.Y >= 0.85 then -- reached top
									Character:PivotTo(CharacterPivot + TargetDir + (Root.CFrame.LookVector * Root.Size.Z))
									break
								end
								local RayC = workspace:Blockcast(CharacterPivot + TargetDir + (Root.CFrame.LookVector * Root.Size.Z), BlockSize, -TargetDir, Param)
								if RayC then
									local RayCPosition = RayC.Position or CharacterPivot.Position + (RayC.Position - CharacterPivot.Position) * dtspeed
									display('ray side')
									PivotChar(RayCPosition, RayC.Normal, 180 or ((MoveDir.X > 0 and -90) or (MoveDir.X < 0 and 90) or 0))
								else
									local RayD = workspace:Blockcast(CharacterPivot + (Root.CFrame.LookVector * Root.Size.Z), BlockSize, -(Root.CFrame.LookVector * Root.Size.Z), Param)
									if RayD then local RayDPosition = RayD.Position or CharacterPivot.Position + (RayD.Position - CharacterPivot.Position) * dtspeed display('ray back') PivotChar(RayDPosition, RayD.Normal, 180) end -- Square checked. No need to check more. if there is none then there is really none
								end
							end
						end
					end
				end
			end)
			ClimbCoroutine = NewThread
			if ClimbCoroutine == NewThread and coroutine.status(ClimbCoroutine) ~= "running" then
				coroutine.resume(ClimbCoroutine)
			end
		elseif Old == Enum.HumanoidStateType.Climbing then
			CloseCoroutine()
		end
	end
	LastState = New
end)

