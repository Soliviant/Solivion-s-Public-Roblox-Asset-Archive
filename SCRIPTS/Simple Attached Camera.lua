--!strict
--!native
--//Solivion's Simple Attached Camera//--
--//A Really Simple Camera, Nothing Much Of It//--
--//Put In StarterGui//--
local c1,c2,c3,c4
local Players = game:FindFirstChildOfClass("Players") :: Players
local UserInp = game:FindFirstChildOfClass("UserInputService") :: UserInputService
local LocalPlayer = Players and Players.LocalPlayer :: Player
local Mouse = LocalPlayer and LocalPlayer:GetMouse()
local CF = CFrame.new() :: CFrame
local FF = CFrame.new() :: CFrame
local ZF = CFrame.new() :: CFrame
local Camera = workspace.CurrentCamera or workspace:FindFirstChildOfClass("Camera") :: Camera
local Subject = Camera.CameraSubject
local Vision = true :: boolean
local Vision_Distance = 25 :: number
local Camera_Distance = 10 :: number
local Camera_Distort = 8 :: number
local Min_Camera_Distance = 5 :: number
local Max_Camera_Distance = 25 :: number
local Min_Camera_Distort = 5 :: number
local Max_Camera_Distort = 20 :: number
local LatestMouseInput

if Min_Camera_Distance > Max_Camera_Distance then
	warn("Max_Camera_Distance Must Be Equal To Or Higher Than Min_Camera_Distance")
	Max_Camera_Distance = Min_Camera_Distance
end
if Min_Camera_Distort > Max_Camera_Distort then
	warn("Max_Camera_Distort Must Be Equal To Or Higher Than Min_Camera_Distort")
	Max_Camera_Distort = Min_Camera_Distort
end

if not script:FindFirstAncestorWhichIsA("StarterGui") then
	warn("Camera Script's Ancestor Not Recommended")
	script.Parent = game:FindFirstChildOfClass("StarterGui")
end

if not Camera or (Camera and Camera.CameraType ~= Enum.CameraType.Scriptable) then
	warn("Please Make Sure Camera Exist And The Type Of It To Be Scriptable!")
	if Camera then
		Camera.CameraType = Enum.CameraType.Scriptable
	end
end

function CleanUp_Wheel()
    if c3 ~= nil then
        c3:Disconnect()
	end 
	if c4 ~= nil then
		c4:Disconnect()
	end 
end

function clamp()
	if Min_Camera_Distance > Max_Camera_Distance then
		Max_Camera_Distance = Min_Camera_Distance
	end
	if Min_Camera_Distort > Max_Camera_Distort then
		Max_Camera_Distort = Min_Camera_Distort
	end
	if Camera_Distance > Max_Camera_Distance then
		Camera_Distance = Max_Camera_Distance
	end
	if Camera_Distance < Min_Camera_Distance then
		Camera_Distance = Min_Camera_Distance
	end
	if Camera_Distort > Max_Camera_Distort then
		Camera_Distort = Max_Camera_Distort
	end
	if Camera_Distort < Min_Camera_Distort then
		Camera_Distort = Min_Camera_Distort
	end
end
clamp()

function SetUpControl(Type: string)
	Type = Type:upper()
	if Type == "ZOOM" then
		CleanUp_Wheel()
		c3 = Mouse.WheelForward:Connect(function()
			Camera_Distance = math.clamp(Camera_Distance-(UserSettings().GameSettings.MouseSensitivity * 2),Min_Camera_Distance,Max_Camera_Distance)
		end)
		c4 = Mouse.WheelBackward:Connect(function()
			Camera_Distance = math.clamp(Camera_Distance+(UserSettings().GameSettings.MouseSensitivity * 2),Min_Camera_Distance,Max_Camera_Distance)
		end)
	elseif Type == "DISTORT" then
		CleanUp_Wheel()
		c3 = Mouse.WheelForward:Connect(function()
			Camera_Distort = math.clamp(Camera_Distort+(UserSettings().GameSettings.MouseSensitivity) * 2,Min_Camera_Distort,Max_Camera_Distort)
		end)
		c4 = Mouse.WheelBackward:Connect(function()
			Camera_Distort = math.clamp(Camera_Distort-(UserSettings().GameSettings.MouseSensitivity) * 2,Min_Camera_Distort,Max_Camera_Distort)
		end)
	elseif Type == "FOV" then
		CleanUp_Wheel()
		c3 = Mouse.WheelForward:Connect(function()
			Camera.FieldOfView = Camera.FieldOfView-(UserSettings().GameSettings.MouseSensitivity * 5)
		end)
		c4 = Mouse.WheelBackward:Connect(function()
			Camera.FieldOfView = Camera.FieldOfView+(UserSettings().GameSettings.MouseSensitivity * 5)
		end)
	end
end

coroutine.resume(coroutine.create(function()
	while task.wait(.01) and LocalPlayer do
		--print('tick')
		ZF = CFrame.new(0, Camera_Distort/100, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		Camera = workspace.CurrentCamera or workspace:FindFirstChildOfClass("Camera")
		Vision = (Camera and Camera.CameraSubject and LocalPlayer and LocalPlayer.Character and Camera.CameraSubject:IsDescendantOf(LocalPlayer.Character)) or false
		if Vision == true and Camera and LocalPlayer then
			Subject = (Camera.CameraSubject:IsA("Humanoid") and Camera.CameraSubject.RootPart) or (Camera.CameraSubject:IsA("BasePart") and Camera.CameraSubject)
			if Subject then
				CF = (Subject.CFrame + (Subject.CFrame.LookVector * Vector3.new(-Camera_Distance,0,-Camera_Distance)) + (Subject.CFrame.UpVector * Vector3.new(0,(Camera_Distance - Min_Camera_Distance) / math.clamp((Max_Camera_Distance/Min_Camera_Distance),1,math.huge) * 4,0))) * CFrame.Angles(math.rad((Camera_Distance - Min_Camera_Distance) / math.clamp((Max_Camera_Distance/Min_Camera_Distance),1,math.huge)) * -10,0,0) 
				FF = Subject.CFrame
			end
			Camera.CFrame = Camera.CFrame:Lerp(CF,0.1*(UserSettings().GameSettings.MouseSensitivity))
			Camera.Focus = Camera.Focus:Lerp(FF,0.1*(UserSettings().GameSettings.MouseSensitivity))
			Camera.CFrame = Camera.CFrame * ZF
			--print('ran')
		end
	end
end))
c1 = UserInp.InputBegan:Connect(function(Obj: InputObject, GP: boolean)
	if not GP then
		if Obj.UserInputType and Obj.UserInputType == Enum.UserInputType.MouseButton3 then
			SetUpControl("distort")
			LatestMouseInput = Obj.UserInputType
		elseif Obj.UserInputType and Obj.UserInputType == Enum.UserInputType.MouseButton2 then
			SetUpControl("fov")
			LatestMouseInput = Obj.UserInputType
		end
	end
end)
c2 = UserInp.InputEnded:Connect(function(Obj: InputObject, GP: boolean)
	if not GP then
		if Obj.UserInputType and Obj.UserInputType == LatestMouseInput then
			SetUpControl("zoom")
			LatestMouseInput = Enum.UserInputType.None
		end
	end
end)
LocalPlayer.Changed:Connect(function(what)
	if what == 'CameraMinZoomDistance' then
		Min_Camera_Distance = LocalPlayer.CameraMinZoomDistance
	elseif what == 'CameraMaxZoomDistance' then
		Max_Camera_Distance = LocalPlayer.CameraMaxZoomDistance
	end
	clamp()
end)
SetUpControl("zoom")