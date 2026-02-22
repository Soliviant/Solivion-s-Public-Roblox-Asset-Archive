--\\~<Solivion>~//--
if not script:FindFirstAncestorWhichIsA('Actor') then
	local Actor =	Instance.new('Actor')
	Actor.Parent = game:FindFirstChildOfClass('ServerScriptService') or workspace
	Actor.Name = 'Accessory_Fixer_Actor'
	script.Parent = Actor
end
local CacheFolder =  game:FindFirstChildOfClass('ServerStorage'):FindFirstChild('Cache') or Instance.new('Folder', game:FindFirstChildOfClass('ServerStorage'))
CacheFolder.Name = 'Cache'
function synchronize()
	if script:FindFirstAncestorOfClass('Actor') then
		task.synchronize()
	end
end
function desynchronize()
	if script:FindFirstAncestorOfClass('Actor') then
		task.desynchronize()
	end
end
function Swap(v: Accessory,Accessory: Accessory)
	synchronize()
	Accessory.Archivable = true
	local clone = Accessory:Clone()
	clone.Name = v.Name
	clone.Parent = v.Parent
	v:Destroy()
--	print(Accessory.Name..' Has Replaced The Original')
end
--Serialized R15
if game:FindFirstChildOfClass('ServerStorage') and not game:FindFirstChildOfClass('ServerStorage'):FindFirstChild('R15')  then
	local R15 = Instance.new("Model")
	R15.Name = "R15"
	R15.WorldPivot = CFrame.new(0.9649574160575867, 2.5000038146972656, 30.924638748168945, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)

	local HumanoidRootPart = Instance.new("Part")
	HumanoidRootPart.Name = "HumanoidRootPart"
	HumanoidRootPart.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	HumanoidRootPart.Transparency = 1
	HumanoidRootPart.Color = Color3.fromRGB(159, 161, 172)
	HumanoidRootPart.Size = Vector3.new(2, 2, 1)
	HumanoidRootPart.CFrame = CFrame.new(35.07740020751953, -106.83145141601562, -3.439481735229492, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	HumanoidRootPart.Parent = R15

	local RootRigAttachment = Instance.new("Attachment")
	RootRigAttachment.Name = "RootRigAttachment"
	RootRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RootRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RootRigAttachment.WorldPosition = Vector3.new(35.07740020751953, -106.83145141601562, -3.439481735229492)
	RootRigAttachment.WorldCFrame = CFrame.new(35.07740020751953, -106.83145141601562, -3.439481735229492, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RootRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RootRigAttachment.Parent = HumanoidRootPart

	local OriginalSize = Instance.new("Vector3Value")
	OriginalSize.Name = "OriginalSize"
	OriginalSize.Value = Vector3.new(2, 2, 1)
	OriginalSize.Parent = HumanoidRootPart

	local LeftHand = Instance.new("MeshPart")
	LeftHand.Name = "LeftHand"
	LeftHand.CanCollide = false
	LeftHand.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	LeftHand.Color = Color3.fromRGB(159, 161, 172)
	LeftHand.Size = Vector3.new(0.9999997615814209, 0.29999998211860657, 0.9999998807907104)
	LeftHand.CFrame = CFrame.new(33.891361236572266, -107.03144836425781, -2.52116060256958, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftHand.Parent = R15

	local LeftWristRigAttachment = Instance.new("Attachment")
	LeftWristRigAttachment.Name = "LeftWristRigAttachment"
	LeftWristRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftWristRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftWristRigAttachment.CFrame = CFrame.new(0.0004788637161254883, 0.14999999105930328, 5.960464477539063e-08)
	LeftWristRigAttachment.WorldPosition = Vector3.new(33.89173889160156, -106.8814468383789, -2.521453619003296)
	LeftWristRigAttachment.WorldCFrame = CFrame.new(33.89173889160156, -106.8814468383789, -2.521453619003296, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftWristRigAttachment.Position = Vector3.new(0.0004788637161254883, 0.14999999105930328, 5.960464477539063e-08)
	LeftWristRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftWristRigAttachment.Parent = LeftHand

	local LeftGripAttachment = Instance.new("Attachment")
	LeftGripAttachment.Name = "LeftGripAttachment"
	LeftGripAttachment.WorldSecondaryAxis = Vector3.new(-0.6122139692306519, 6.123234262925839e-17, -0.790692150592804)
	LeftGripAttachment.WorldOrientation = Vector3.new(-90, 37.749759674072266, 0)
	LeftGripAttachment.CFrame = CFrame.new(-1.1920928955078125e-07, -0.14999963343143463, -1.4630612099608697e-07, 1, 0, -0, 0, 6.123234262925839e-17, 1, 0, -1, 6.123234262925839e-17)
	LeftGripAttachment.WorldPosition = Vector3.new(33.891361236572266, -107.18144989013672, -2.52116060256958)
	LeftGripAttachment.Rotation = Vector3.new(-90, -0, -0)
	LeftGripAttachment.WorldCFrame = CFrame.new(33.891361236572266, -107.18144989013672, -2.52116060256958, 0.790692150592804, -0.6122139692306519, 3.748729596531118e-17, -5.641904020691205e-36, 6.123234262925839e-17, 1, -0.6122139692306519, -0.790692150592804, 4.841593342646788e-17)
	LeftGripAttachment.SecondaryAxis = Vector3.new(0, 6.123234262925839e-17, -1)
	LeftGripAttachment.Position = Vector3.new(-1.1920928955078125e-07, -0.14999963343143463, -1.4630612099608697e-07)
	LeftGripAttachment.Orientation = Vector3.new(-90, -0, 0)
	LeftGripAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftGripAttachment.Parent = LeftHand

	local OriginalSize1 = Instance.new("Vector3Value")
	OriginalSize1.Name = "OriginalSize"
	OriginalSize1.Value = Vector3.new(0.9999997615814209, 0.29999998211860657, 0.9999998807907104)
	OriginalSize1.Parent = LeftHand

	local LeftWrist = Instance.new("Motor6D")
	LeftWrist.Name = "LeftWrist"
	LeftWrist.C1 = CFrame.new(0.0004788637161254883, 0.14999999105930328, 5.960464477539063e-08)
	LeftWrist.C0 = CFrame.new(0.00047850608825683594, -0.5499999523162842, 7.644625506630354e-20)
	LeftWrist.Parent = LeftHand

	local LeftLowerArm = Instance.new("MeshPart")
	LeftLowerArm.Name = "LeftLowerArm"
	LeftLowerArm.CanCollide = false
	LeftLowerArm.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	LeftLowerArm.Color = Color3.fromRGB(159, 161, 172)
	LeftLowerArm.Size = Vector3.new(0.9999997615814209, 1.200000286102295, 1)
	LeftLowerArm.CFrame = CFrame.new(33.891361236572266, -106.33145141601562, -2.521160840988159, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftLowerArm.Parent = R15

	local LeftElbowRigAttachment = Instance.new("Attachment")
	LeftElbowRigAttachment.Name = "LeftElbowRigAttachment"
	LeftElbowRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftElbowRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftElbowRigAttachment.CFrame = CFrame.new(0.00047850608825683594, 0.2500000298023224, 7.644625506630354e-20)
	LeftElbowRigAttachment.WorldPosition = Vector3.new(33.89173889160156, -106.08145141601562, -2.521453857421875)
	LeftElbowRigAttachment.WorldCFrame = CFrame.new(33.89173889160156, -106.08145141601562, -2.521453857421875, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftElbowRigAttachment.Position = Vector3.new(0.00047850608825683594, 0.2500000298023224, 7.644625506630354e-20)
	LeftElbowRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftElbowRigAttachment.Parent = LeftLowerArm

	local LeftWristRigAttachment1 = Instance.new("Attachment")
	LeftWristRigAttachment1.Name = "LeftWristRigAttachment"
	LeftWristRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftWristRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftWristRigAttachment1.CFrame = CFrame.new(0.00047850608825683594, -0.5499999523162842, 7.644625506630354e-20)
	LeftWristRigAttachment1.WorldPosition = Vector3.new(33.89173889160156, -106.88145446777344, -2.521453857421875)
	LeftWristRigAttachment1.WorldCFrame = CFrame.new(33.89173889160156, -106.88145446777344, -2.521453857421875, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftWristRigAttachment1.Position = Vector3.new(0.00047850608825683594, -0.5499999523162842, 7.644625506630354e-20)
	LeftWristRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftWristRigAttachment1.Parent = LeftLowerArm

	local OriginalSize2 = Instance.new("Vector3Value")
	OriginalSize2.Name = "OriginalSize"
	OriginalSize2.Value = Vector3.new(0.9999997615814209, 1.200000286102295, 1)
	OriginalSize2.Parent = LeftLowerArm

	local LeftElbow = Instance.new("Motor6D")
	LeftElbow.Name = "LeftElbow"
	LeftElbow.C1 = CFrame.new(0.00047850608825683594, 0.2500000298023224, 7.644625506630354e-20)
	LeftElbow.C0 = CFrame.new(0.00047910213470458984, -0.20000016689300537, 8.940696716308594e-08)
	LeftElbow.Parent = LeftLowerArm

	local LeftUpperArm = Instance.new("MeshPart")
	LeftUpperArm.Name = "LeftUpperArm"
	LeftUpperArm.CanCollide = false
	LeftUpperArm.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	LeftUpperArm.Color = Color3.fromRGB(159, 161, 172)
	LeftUpperArm.Size = Vector3.new(0.9999997615814209, 1.4000003337860107, 0.9999999403953552)
	LeftUpperArm.CFrame = CFrame.new(33.891361236572266, -105.88145446777344, -2.52116060256958, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftUpperArm.Parent = R15

	local LeftShoulderRigAttachment = Instance.new("Attachment")
	LeftShoulderRigAttachment.Name = "LeftShoulderRigAttachment"
	LeftShoulderRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftShoulderRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftShoulderRigAttachment.CFrame = CFrame.new(0.2501091957092285, 0.4499998092651367, 8.940696716308594e-08)
	LeftShoulderRigAttachment.WorldPosition = Vector3.new(34.08911895751953, -105.43145751953125, -2.674280881881714)
	LeftShoulderRigAttachment.WorldCFrame = CFrame.new(34.08911895751953, -105.43145751953125, -2.674280881881714, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftShoulderRigAttachment.Position = Vector3.new(0.2501091957092285, 0.4499998092651367, 8.940696716308594e-08)
	LeftShoulderRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftShoulderRigAttachment.Parent = LeftUpperArm

	local LeftElbowRigAttachment1 = Instance.new("Attachment")
	LeftElbowRigAttachment1.Name = "LeftElbowRigAttachment"
	LeftElbowRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftElbowRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftElbowRigAttachment1.CFrame = CFrame.new(0.00047910213470458984, -0.20000016689300537, 8.940696716308594e-08)
	LeftElbowRigAttachment1.WorldPosition = Vector3.new(33.89173889160156, -106.08145141601562, -2.521453857421875)
	LeftElbowRigAttachment1.WorldCFrame = CFrame.new(33.89173889160156, -106.08145141601562, -2.521453857421875, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftElbowRigAttachment1.Position = Vector3.new(0.00047910213470458984, -0.20000016689300537, 8.940696716308594e-08)
	LeftElbowRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftElbowRigAttachment1.Parent = LeftUpperArm

	local LeftShoulderAttachment = Instance.new("Attachment")
	LeftShoulderAttachment.Name = "LeftShoulderAttachment"
	LeftShoulderAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftShoulderAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftShoulderAttachment.CFrame = CFrame.new(2.384185791015625e-07, 0.7000002861022949, -2.7096831445305725e-08)
	LeftShoulderAttachment.WorldPosition = Vector3.new(33.891361236572266, -105.18145751953125, -2.521160840988159)
	LeftShoulderAttachment.WorldCFrame = CFrame.new(33.891361236572266, -105.18145751953125, -2.521160840988159, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftShoulderAttachment.Position = Vector3.new(2.384185791015625e-07, 0.7000002861022949, -2.7096831445305725e-08)
	LeftShoulderAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftShoulderAttachment.Parent = LeftUpperArm

	local OriginalSize3 = Instance.new("Vector3Value")
	OriginalSize3.Name = "OriginalSize"
	OriginalSize3.Value = Vector3.new(0.9999997615814209, 1.4000003337860107, 0.9999999403953552)
	OriginalSize3.Parent = LeftUpperArm

	local LeftShoulder = Instance.new("Motor6D")
	LeftShoulder.Name = "LeftShoulder"
	LeftShoulder.C1 = CFrame.new(0.2501091957092285, 0.4499998092651367, 8.940696716308594e-08)
	LeftShoulder.C0 = CFrame.new(-1.2498912811279297, 0.5499999523162842, 1.1920928955078125e-07)
	LeftShoulder.Parent = LeftUpperArm

	local RightHand = Instance.new("MeshPart")
	RightHand.Name = "RightHand"
	RightHand.CanCollide = false
	RightHand.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	RightHand.Color = Color3.fromRGB(159, 161, 172)
	RightHand.Size = Vector3.new(0.9999998807907104, 0.29999998211860657, 0.9999998807907104)
	RightHand.CFrame = CFrame.new(36.2634391784668, -107.03144836425781, -4.357802867889404, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightHand.Parent = R15

	local RightWristRigAttachment = Instance.new("Attachment")
	RightWristRigAttachment.Name = "RightWristRigAttachment"
	RightWristRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightWristRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightWristRigAttachment.CFrame = CFrame.new(3.5762786865234375e-07, 0.14999999105930328, 5.960464477539063e-08)
	RightWristRigAttachment.WorldPosition = Vector3.new(36.2634391784668, -106.8814468383789, -4.357802867889404)
	RightWristRigAttachment.WorldCFrame = CFrame.new(36.2634391784668, -106.8814468383789, -4.357802867889404, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightWristRigAttachment.Position = Vector3.new(3.5762786865234375e-07, 0.14999999105930328, 5.960464477539063e-08)
	RightWristRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightWristRigAttachment.Parent = RightHand

	local RightGripAttachment = Instance.new("Attachment")
	RightGripAttachment.Name = "RightGripAttachment"
	RightGripAttachment.WorldSecondaryAxis = Vector3.new(-0.6122139692306519, 6.123234262925839e-17, -0.790692150592804)
	RightGripAttachment.WorldOrientation = Vector3.new(-90, 37.749759674072266, 0)
	RightGripAttachment.CFrame = CFrame.new(0, -0.14999963343143463, -1.4630612099608697e-07, 1, 0, -0, 0, 6.123234262925839e-17, 1, 0, -1, 6.123234262925839e-17)
	RightGripAttachment.WorldPosition = Vector3.new(36.2634391784668, -107.18144989013672, -4.357802867889404)
	RightGripAttachment.Rotation = Vector3.new(-90, -0, -0)
	RightGripAttachment.WorldCFrame = CFrame.new(36.2634391784668, -107.18144989013672, -4.357802867889404, 0.790692150592804, -0.6122139692306519, 3.748729596531118e-17, -5.641904020691205e-36, 6.123234262925839e-17, 1, -0.6122139692306519, -0.790692150592804, 4.841593342646788e-17)
	RightGripAttachment.SecondaryAxis = Vector3.new(0, 6.123234262925839e-17, -1)
	RightGripAttachment.Position = Vector3.new(0, -0.14999963343143463, -1.4630612099608697e-07)
	RightGripAttachment.Orientation = Vector3.new(-90, -0, 0)
	RightGripAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightGripAttachment.Parent = RightHand

	local OriginalSize4 = Instance.new("Vector3Value")
	OriginalSize4.Name = "OriginalSize"
	OriginalSize4.Value = Vector3.new(0.9999998807907104, 0.29999998211860657, 0.9999998807907104)
	OriginalSize4.Parent = RightHand

	local RightWrist = Instance.new("Motor6D")
	RightWrist.Name = "RightWrist"
	RightWrist.C1 = CFrame.new(3.5762786865234375e-07, 0.14999999105930328, 5.960464477539063e-08)
	RightWrist.C0 = CFrame.new(1.1920928955078125e-07, -0.5499999523162842, -6.862447526056303e-18)
	RightWrist.Parent = RightHand

	local RightLowerArm = Instance.new("MeshPart")
	RightLowerArm.Name = "RightLowerArm"
	RightLowerArm.CanCollide = false
	RightLowerArm.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	RightLowerArm.Color = Color3.fromRGB(159, 161, 172)
	RightLowerArm.Size = Vector3.new(0.9999997615814209, 1.200000286102295, 1)
	RightLowerArm.CFrame = CFrame.new(36.2634391784668, -106.33145141601562, -4.357802867889404, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightLowerArm.Parent = R15

	local RightElbowRigAttachment = Instance.new("Attachment")
	RightElbowRigAttachment.Name = "RightElbowRigAttachment"
	RightElbowRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightElbowRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightElbowRigAttachment.CFrame = CFrame.new(1.1920928955078125e-07, 0.2500000298023224, 7.644625506630354e-20)
	RightElbowRigAttachment.WorldPosition = Vector3.new(36.2634391784668, -106.08145141601562, -4.357802867889404)
	RightElbowRigAttachment.WorldCFrame = CFrame.new(36.2634391784668, -106.08145141601562, -4.357802867889404, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightElbowRigAttachment.Position = Vector3.new(1.1920928955078125e-07, 0.2500000298023224, 7.644625506630354e-20)
	RightElbowRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightElbowRigAttachment.Parent = RightLowerArm

	local RightWristRigAttachment1 = Instance.new("Attachment")
	RightWristRigAttachment1.Name = "RightWristRigAttachment"
	RightWristRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightWristRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightWristRigAttachment1.CFrame = CFrame.new(1.1920928955078125e-07, -0.5499999523162842, -6.862447526056303e-18)
	RightWristRigAttachment1.WorldPosition = Vector3.new(36.2634391784668, -106.88145446777344, -4.357802867889404)
	RightWristRigAttachment1.WorldCFrame = CFrame.new(36.2634391784668, -106.88145446777344, -4.357802867889404, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightWristRigAttachment1.Position = Vector3.new(1.1920928955078125e-07, -0.5499999523162842, -6.862447526056303e-18)
	RightWristRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightWristRigAttachment1.Parent = RightLowerArm

	local OriginalSize5 = Instance.new("Vector3Value")
	OriginalSize5.Name = "OriginalSize"
	OriginalSize5.Value = Vector3.new(0.9999997615814209, 1.200000286102295, 1)
	OriginalSize5.Parent = RightLowerArm

	local RightElbow = Instance.new("Motor6D")
	RightElbow.Name = "RightElbow"
	RightElbow.C1 = CFrame.new(1.1920928955078125e-07, 0.2500000298023224, 7.644625506630354e-20)
	RightElbow.C0 = CFrame.new(-5.960464477539062e-07, -0.20000016689300537, 8.940696716308594e-08)
	RightElbow.Parent = RightLowerArm

	local RightUpperArm = Instance.new("MeshPart")
	RightUpperArm.Name = "RightUpperArm"
	RightUpperArm.CanCollide = false
	RightUpperArm.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	RightUpperArm.Color = Color3.fromRGB(159, 161, 172)
	RightUpperArm.Size = Vector3.new(0.9999996423721313, 1.4000003337860107, 0.9999999403953552)
	RightUpperArm.CFrame = CFrame.new(36.2634391784668, -105.88145446777344, -4.3578033447265625, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightUpperArm.Parent = R15

	local RightShoulderRigAttachment = Instance.new("Attachment")
	RightShoulderRigAttachment.Name = "RightShoulderRigAttachment"
	RightShoulderRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightShoulderRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightShoulderRigAttachment.CFrame = CFrame.new(-0.25002026557922363, 0.4499998092651367, 8.940696716308594e-08)
	RightShoulderRigAttachment.WorldPosition = Vector3.new(36.06575012207031, -105.43145751953125, -4.204737186431885)
	RightShoulderRigAttachment.WorldCFrame = CFrame.new(36.06575012207031, -105.43145751953125, -4.204737186431885, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightShoulderRigAttachment.Position = Vector3.new(-0.25002026557922363, 0.4499998092651367, 8.940696716308594e-08)
	RightShoulderRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightShoulderRigAttachment.Parent = RightUpperArm

	local RightElbowRigAttachment1 = Instance.new("Attachment")
	RightElbowRigAttachment1.Name = "RightElbowRigAttachment"
	RightElbowRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightElbowRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightElbowRigAttachment1.CFrame = CFrame.new(-5.960464477539062e-07, -0.20000016689300537, 8.940696716308594e-08)
	RightElbowRigAttachment1.WorldPosition = Vector3.new(36.2634391784668, -106.08145141601562, -4.357802867889404)
	RightElbowRigAttachment1.WorldCFrame = CFrame.new(36.2634391784668, -106.08145141601562, -4.357802867889404, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightElbowRigAttachment1.Position = Vector3.new(-5.960464477539062e-07, -0.20000016689300537, 8.940696716308594e-08)
	RightElbowRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightElbowRigAttachment1.Parent = RightUpperArm

	local RightShoulderAttachment = Instance.new("Attachment")
	RightShoulderAttachment.Name = "RightShoulderAttachment"
	RightShoulderAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightShoulderAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightShoulderAttachment.CFrame = CFrame.new(-9.5367431640625e-07, 0.7000002861022949, -2.7096831445305725e-08)
	RightShoulderAttachment.WorldPosition = Vector3.new(36.2634391784668, -105.18145751953125, -4.357802867889404)
	RightShoulderAttachment.WorldCFrame = CFrame.new(36.2634391784668, -105.18145751953125, -4.357802867889404, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightShoulderAttachment.Position = Vector3.new(-9.5367431640625e-07, 0.7000002861022949, -2.7096831445305725e-08)
	RightShoulderAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightShoulderAttachment.Parent = RightUpperArm

	local OriginalSize6 = Instance.new("Vector3Value")
	OriginalSize6.Name = "OriginalSize"
	OriginalSize6.Value = Vector3.new(0.9999996423721313, 1.4000003337860107, 0.9999999403953552)
	OriginalSize6.Parent = RightUpperArm

	local RightShoulder = Instance.new("Motor6D")
	RightShoulder.Name = "RightShoulder"
	RightShoulder.C1 = CFrame.new(-0.25002026557922363, 0.4499998092651367, 8.940696716308594e-08)
	RightShoulder.C0 = CFrame.new(1.2499804496765137, 0.5499999523162842, 1.1920928955078125e-07)
	RightShoulder.Parent = RightUpperArm

	local UpperTorso = Instance.new("MeshPart")
	UpperTorso.Name = "UpperTorso"
	UpperTorso.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	UpperTorso.Color = Color3.fromRGB(159, 161, 172)
	UpperTorso.Size = Vector3.new(2, 1.6000001430511475, 1.0000003576278687)
	UpperTorso.CFrame = CFrame.new(35.07740020751953, -105.98145294189453, -3.439481735229492, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	UpperTorso.Parent = R15

	local WaistRigAttachment = Instance.new("Attachment")
	WaistRigAttachment.Name = "WaistRigAttachment"
	WaistRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	WaistRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	WaistRigAttachment.CFrame = CFrame.new(-5.960464477539063e-08, -0.45000001788139343, 1.1920928955078125e-07)
	WaistRigAttachment.WorldPosition = Vector3.new(35.07740020751953, -106.43144989013672, -3.439481496810913)
	WaistRigAttachment.WorldCFrame = CFrame.new(35.07740020751953, -106.43144989013672, -3.439481496810913, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	WaistRigAttachment.Position = Vector3.new(-5.960464477539063e-08, -0.45000001788139343, 1.1920928955078125e-07)
	WaistRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	WaistRigAttachment.Parent = UpperTorso

	local NeckRigAttachment = Instance.new("Attachment")
	NeckRigAttachment.Name = "NeckRigAttachment"
	NeckRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	NeckRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	NeckRigAttachment.CFrame = CFrame.new(-5.960464477539063e-08, 0.7999999523162842, 1.1920928955078125e-07)
	NeckRigAttachment.WorldPosition = Vector3.new(35.07740020751953, -105.18144989013672, -3.439481496810913)
	NeckRigAttachment.WorldCFrame = CFrame.new(35.07740020751953, -105.18144989013672, -3.439481496810913, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	NeckRigAttachment.Position = Vector3.new(-5.960464477539063e-08, 0.7999999523162842, 1.1920928955078125e-07)
	NeckRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	NeckRigAttachment.Parent = UpperTorso

	local LeftShoulderRigAttachment1 = Instance.new("Attachment")
	LeftShoulderRigAttachment1.Name = "LeftShoulderRigAttachment"
	LeftShoulderRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftShoulderRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftShoulderRigAttachment1.CFrame = CFrame.new(-1.2498912811279297, 0.5499999523162842, 1.1920928955078125e-07)
	LeftShoulderRigAttachment1.WorldPosition = Vector3.new(34.0891227722168, -105.43144989013672, -2.6742806434631348)
	LeftShoulderRigAttachment1.WorldCFrame = CFrame.new(34.0891227722168, -105.43144989013672, -2.6742806434631348, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftShoulderRigAttachment1.Position = Vector3.new(-1.2498912811279297, 0.5499999523162842, 1.1920928955078125e-07)
	LeftShoulderRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftShoulderRigAttachment1.Parent = UpperTorso

	local RightShoulderRigAttachment1 = Instance.new("Attachment")
	RightShoulderRigAttachment1.Name = "RightShoulderRigAttachment"
	RightShoulderRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightShoulderRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightShoulderRigAttachment1.CFrame = CFrame.new(1.2499804496765137, 0.5499999523162842, 1.1920928955078125e-07)
	RightShoulderRigAttachment1.WorldPosition = Vector3.new(36.06575012207031, -105.43144989013672, -4.204737186431885)
	RightShoulderRigAttachment1.WorldCFrame = CFrame.new(36.06575012207031, -105.43144989013672, -4.204737186431885, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightShoulderRigAttachment1.Position = Vector3.new(1.2499804496765137, 0.5499999523162842, 1.1920928955078125e-07)
	RightShoulderRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightShoulderRigAttachment1.Parent = UpperTorso

	local BodyFrontAttachment = Instance.new("Attachment")
	BodyFrontAttachment.Name = "BodyFrontAttachment"
	BodyFrontAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	BodyFrontAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	BodyFrontAttachment.CFrame = CFrame.new(-5.960464477539063e-08, -0.20000004768371582, -0.49999988079071045)
	BodyFrontAttachment.WorldPosition = Vector3.new(34.77129364013672, -106.18144989013672, -3.8348276615142822)
	BodyFrontAttachment.WorldCFrame = CFrame.new(34.77129364013672, -106.18144989013672, -3.8348276615142822, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	BodyFrontAttachment.Position = Vector3.new(-5.960464477539063e-08, -0.20000004768371582, -0.49999988079071045)
	BodyFrontAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	BodyFrontAttachment.Parent = UpperTorso

	local BodyBackAttachment = Instance.new("Attachment")
	BodyBackAttachment.Name = "BodyBackAttachment"
	BodyBackAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	BodyBackAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	BodyBackAttachment.CFrame = CFrame.new(-5.960464477539063e-08, -0.20000004768371582, 0.5)
	BodyBackAttachment.WorldPosition = Vector3.new(35.383506774902344, -106.18144989013672, -3.044135570526123)
	BodyBackAttachment.WorldCFrame = CFrame.new(35.383506774902344, -106.18144989013672, -3.044135570526123, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	BodyBackAttachment.Position = Vector3.new(-5.960464477539063e-08, -0.20000004768371582, 0.5)
	BodyBackAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	BodyBackAttachment.Parent = UpperTorso

	local LeftCollarAttachment = Instance.new("Attachment")
	LeftCollarAttachment.Name = "LeftCollarAttachment"
	LeftCollarAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftCollarAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftCollarAttachment.CFrame = CFrame.new(-0.9999998807907104, 0.8000001907348633, -7.273973778865184e-08)
	LeftCollarAttachment.WorldPosition = Vector3.new(34.28670883178711, -105.18144989013672, -2.82726788520813)
	LeftCollarAttachment.WorldCFrame = CFrame.new(34.28670883178711, -105.18144989013672, -2.82726788520813, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftCollarAttachment.Position = Vector3.new(-0.9999998807907104, 0.8000001907348633, -7.273973778865184e-08)
	LeftCollarAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftCollarAttachment.Parent = UpperTorso

	local RightCollarAttachment = Instance.new("Attachment")
	RightCollarAttachment.Name = "RightCollarAttachment"
	RightCollarAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightCollarAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightCollarAttachment.CFrame = CFrame.new(0.9999999403953552, 0.7999999523162842, 4.612959969563235e-08)
	RightCollarAttachment.WorldPosition = Vector3.new(35.86809158325195, -105.18144989013672, -4.051695823669434)
	RightCollarAttachment.WorldCFrame = CFrame.new(35.86809158325195, -105.18144989013672, -4.051695823669434, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightCollarAttachment.Position = Vector3.new(0.9999999403953552, 0.7999999523162842, 4.612959969563235e-08)
	RightCollarAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightCollarAttachment.Parent = UpperTorso

	local NeckAttachment = Instance.new("Attachment")
	NeckAttachment.Name = "NeckAttachment"
	NeckAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	NeckAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	NeckAttachment.CFrame = CFrame.new(0, 0.800000011920929, 0)
	NeckAttachment.WorldPosition = Vector3.new(35.07740020751953, -105.18144989013672, -3.439481735229492)
	NeckAttachment.WorldCFrame = CFrame.new(35.07740020751953, -105.18144989013672, -3.439481735229492, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	NeckAttachment.Position = Vector3.new(0, 0.800000011920929, 0)
	NeckAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	NeckAttachment.Parent = UpperTorso

	local OriginalSize7 = Instance.new("Vector3Value")
	OriginalSize7.Name = "OriginalSize"
	OriginalSize7.Value = Vector3.new(2, 1.6000001430511475, 1.0000003576278687)
	OriginalSize7.Parent = UpperTorso

	local Waist = Instance.new("Motor6D")
	Waist.Name = "Waist"
	Waist.C1 = CFrame.new(-5.960464477539063e-08, -0.45000001788139343, 1.1920928955078125e-07)
	Waist.C0 = CFrame.new(-1.1920928955078125e-07, 0.5500000715255737, 7.644625506630354e-20)
	Waist.Parent = UpperTorso

	local LeftFoot = Instance.new("MeshPart")
	LeftFoot.Name = "LeftFoot"
	LeftFoot.CanCollide = false
	LeftFoot.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	LeftFoot.Color = Color3.fromRGB(159, 161, 172)
	LeftFoot.Size = Vector3.new(1, 0.3000001907348633, 1)
	LeftFoot.CFrame = CFrame.new(34.68205261230469, -109.03145599365234, -3.1333746910095215, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftFoot.Parent = R15

	local LeftAnkleRigAttachment = Instance.new("Attachment")
	LeftAnkleRigAttachment.Name = "LeftAnkleRigAttachment"
	LeftAnkleRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftAnkleRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftAnkleRigAttachment.CFrame = CFrame.new(-2.384185791015625e-07, 0.0500025749206543, 8.081544820015552e-07)
	LeftAnkleRigAttachment.WorldPosition = Vector3.new(34.68205261230469, -108.98145294189453, -3.133373975753784)
	LeftAnkleRigAttachment.WorldCFrame = CFrame.new(34.68205261230469, -108.98145294189453, -3.133373975753784, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftAnkleRigAttachment.Position = Vector3.new(-2.384185791015625e-07, 0.0500025749206543, 8.081544820015552e-07)
	LeftAnkleRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftAnkleRigAttachment.Parent = LeftFoot

	local OriginalSize8 = Instance.new("Vector3Value")
	OriginalSize8.Name = "OriginalSize"
	OriginalSize8.Value = Vector3.new(1, 0.3000001907348633, 1)
	OriginalSize8.Parent = LeftFoot

	local LeftAnkle = Instance.new("Motor6D")
	LeftAnkle.Name = "LeftAnkle"
	LeftAnkle.C1 = CFrame.new(-2.384185791015625e-07, 0.0500025749206543, 8.081544820015552e-07)
	LeftAnkle.C0 = CFrame.new(-1.7881393432617188e-07, -0.749997615814209, 6.293405476753833e-07)
	LeftAnkle.Parent = LeftFoot

	local LeftLowerLeg = Instance.new("MeshPart")
	LeftLowerLeg.Name = "LeftLowerLeg"
	LeftLowerLeg.CanCollide = false
	LeftLowerLeg.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	LeftLowerLeg.Color = Color3.fromRGB(159, 161, 172)
	LeftLowerLeg.Size = Vector3.new(0.9999999403953552, 1.5000003576278687, 1.0000001192092896)
	LeftLowerLeg.CFrame = CFrame.new(34.68205261230469, -108.23145294189453, -3.1333744525909424, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftLowerLeg.Parent = R15

	local LeftKneeRigAttachment = Instance.new("Attachment")
	LeftKneeRigAttachment.Name = "LeftKneeRigAttachment"
	LeftKneeRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftKneeRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftKneeRigAttachment.CFrame = CFrame.new(-0, 0.24999964237213135, -1.7881393432617188e-07)
	LeftKneeRigAttachment.WorldPosition = Vector3.new(34.68205261230469, -107.98145294189453, -3.1333746910095215)
	LeftKneeRigAttachment.WorldCFrame = CFrame.new(34.68205261230469, -107.98145294189453, -3.1333746910095215, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftKneeRigAttachment.Position = Vector3.new(-0, 0.24999964237213135, -1.7881393432617188e-07)
	LeftKneeRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftKneeRigAttachment.Parent = LeftLowerLeg

	local LeftAnkleRigAttachment1 = Instance.new("Attachment")
	LeftAnkleRigAttachment1.Name = "LeftAnkleRigAttachment"
	LeftAnkleRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftAnkleRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftAnkleRigAttachment1.CFrame = CFrame.new(-1.7881393432617188e-07, -0.749997615814209, 6.293405476753833e-07)
	LeftAnkleRigAttachment1.WorldPosition = Vector3.new(34.68205261230469, -108.98145294189453, -3.133373737335205)
	LeftAnkleRigAttachment1.WorldCFrame = CFrame.new(34.68205261230469, -108.98145294189453, -3.133373737335205, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftAnkleRigAttachment1.Position = Vector3.new(-1.7881393432617188e-07, -0.749997615814209, 6.293405476753833e-07)
	LeftAnkleRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftAnkleRigAttachment1.Parent = LeftLowerLeg

	local OriginalSize9 = Instance.new("Vector3Value")
	OriginalSize9.Name = "OriginalSize"
	OriginalSize9.Value = Vector3.new(0.9999999403953552, 1.5000003576278687, 1.0000001192092896)
	OriginalSize9.Parent = LeftLowerLeg

	local LeftKnee = Instance.new("Motor6D")
	LeftKnee.Name = "LeftKnee"
	LeftKnee.C1 = CFrame.new(-0, 0.24999964237213135, -1.7881393432617188e-07)
	LeftKnee.C0 = CFrame.new(5.960464477539063e-08, -0.2999999523162842, -1.6391277313232422e-07)
	LeftKnee.Parent = LeftLowerLeg

	local LeftUpperLeg = Instance.new("MeshPart")
	LeftUpperLeg.Name = "LeftUpperLeg"
	LeftUpperLeg.CanCollide = false
	LeftUpperLeg.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	LeftUpperLeg.Color = Color3.fromRGB(159, 161, 172)
	LeftUpperLeg.Size = Vector3.new(1.0000003576278687, 1.499999761581421, 0.9999998807907104)
	LeftUpperLeg.CFrame = CFrame.new(34.68205261230469, -107.68144989013672, -3.1333744525909424, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftUpperLeg.Parent = R15

	local LeftHipRigAttachment = Instance.new("Attachment")
	LeftHipRigAttachment.Name = "LeftHipRigAttachment"
	LeftHipRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftHipRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftHipRigAttachment.CFrame = CFrame.new(5.960464477539063e-08, 0.5, -1.6391277313232422e-07)
	LeftHipRigAttachment.WorldPosition = Vector3.new(34.68205261230469, -107.18144989013672, -3.1333746910095215)
	LeftHipRigAttachment.WorldCFrame = CFrame.new(34.68205261230469, -107.18144989013672, -3.1333746910095215, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftHipRigAttachment.Position = Vector3.new(5.960464477539063e-08, 0.5, -1.6391277313232422e-07)
	LeftHipRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftHipRigAttachment.Parent = LeftUpperLeg

	local LeftKneeRigAttachment1 = Instance.new("Attachment")
	LeftKneeRigAttachment1.Name = "LeftKneeRigAttachment"
	LeftKneeRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftKneeRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftKneeRigAttachment1.CFrame = CFrame.new(5.960464477539063e-08, -0.2999999523162842, -1.6391277313232422e-07)
	LeftKneeRigAttachment1.WorldPosition = Vector3.new(34.68205261230469, -107.98145294189453, -3.1333746910095215)
	LeftKneeRigAttachment1.WorldCFrame = CFrame.new(34.68205261230469, -107.98145294189453, -3.1333746910095215, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftKneeRigAttachment1.Position = Vector3.new(5.960464477539063e-08, -0.2999999523162842, -1.6391277313232422e-07)
	LeftKneeRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftKneeRigAttachment1.Parent = LeftUpperLeg

	local OriginalSize10 = Instance.new("Vector3Value")
	OriginalSize10.Name = "OriginalSize"
	OriginalSize10.Value = Vector3.new(1.0000003576278687, 1.499999761581421, 0.9999998807907104)
	OriginalSize10.Parent = LeftUpperLeg

	local LeftHip = Instance.new("Motor6D")
	LeftHip.Name = "LeftHip"
	LeftHip.C1 = CFrame.new(5.960464477539063e-08, 0.5, -1.6391277313232422e-07)
	LeftHip.C0 = CFrame.new(-0.5000001192092896, -0.19999995827674866, -0)
	LeftHip.Parent = LeftUpperLeg

	local RightFoot = Instance.new("MeshPart")
	RightFoot.Name = "RightFoot"
	RightFoot.CanCollide = false
	RightFoot.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	RightFoot.Color = Color3.fromRGB(159, 161, 172)
	RightFoot.Size = Vector3.new(0.9999999403953552, 0.3000001907348633, 1)
	RightFoot.CFrame = CFrame.new(35.472747802734375, -109.03145599365234, -3.745588779449463, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightFoot.Parent = R15

	local RightAnkleRigAttachment = Instance.new("Attachment")
	RightAnkleRigAttachment.Name = "RightAnkleRigAttachment"
	RightAnkleRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightAnkleRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightAnkleRigAttachment.CFrame = CFrame.new(-0, 0.04999971389770508, 0.00009845343447523192)
	RightAnkleRigAttachment.WorldPosition = Vector3.new(35.472808837890625, -108.98145294189453, -3.7455108165740967)
	RightAnkleRigAttachment.WorldCFrame = CFrame.new(35.472808837890625, -108.98145294189453, -3.7455108165740967, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightAnkleRigAttachment.Position = Vector3.new(-0, 0.04999971389770508, 0.00009845343447523192)
	RightAnkleRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightAnkleRigAttachment.Parent = RightFoot

	local OriginalSize11 = Instance.new("Vector3Value")
	OriginalSize11.Name = "OriginalSize"
	OriginalSize11.Value = Vector3.new(0.9999999403953552, 0.3000001907348633, 1)
	OriginalSize11.Parent = RightFoot

	local RightAnkle = Instance.new("Motor6D")
	RightAnkle.Name = "RightAnkle"
	RightAnkle.C1 = CFrame.new(-0, 0.04999971389770508, 0.00009845343447523192)
	RightAnkle.C0 = CFrame.new(-0, -0.7500004768371582, 0.00009827462054090574)
	RightAnkle.Parent = RightFoot

	local RightLowerLeg = Instance.new("MeshPart")
	RightLowerLeg.Name = "RightLowerLeg"
	RightLowerLeg.CanCollide = false
	RightLowerLeg.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	RightLowerLeg.Color = Color3.fromRGB(159, 161, 172)
	RightLowerLeg.Size = Vector3.new(0.9999999403953552, 1.5000003576278687, 1.0000001192092896)
	RightLowerLeg.CFrame = CFrame.new(35.472747802734375, -108.23145294189453, -3.745588541030884, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightLowerLeg.Parent = R15

	local RightKneeRigAttachment = Instance.new("Attachment")
	RightKneeRigAttachment.Name = "RightKneeRigAttachment"
	RightKneeRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightKneeRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightKneeRigAttachment.CFrame = CFrame.new(-0, 0.24999964237213135, 0.000043526004446903244)
	RightKneeRigAttachment.WorldPosition = Vector3.new(35.472774505615234, -107.98145294189453, -3.745554208755493)
	RightKneeRigAttachment.WorldCFrame = CFrame.new(35.472774505615234, -107.98145294189453, -3.745554208755493, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightKneeRigAttachment.Position = Vector3.new(-0, 0.24999964237213135, 0.000043526004446903244)
	RightKneeRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightKneeRigAttachment.Parent = RightLowerLeg

	local RightAnkleRigAttachment1 = Instance.new("Attachment")
	RightAnkleRigAttachment1.Name = "RightAnkleRigAttachment"
	RightAnkleRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightAnkleRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightAnkleRigAttachment1.CFrame = CFrame.new(-0, -0.7500004768371582, 0.00009827462054090574)
	RightAnkleRigAttachment1.WorldPosition = Vector3.new(35.472808837890625, -108.98145294189453, -3.7455108165740967)
	RightAnkleRigAttachment1.WorldCFrame = CFrame.new(35.472808837890625, -108.98145294189453, -3.7455108165740967, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightAnkleRigAttachment1.Position = Vector3.new(-0, -0.7500004768371582, 0.00009827462054090574)
	RightAnkleRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightAnkleRigAttachment1.Parent = RightLowerLeg

	local OriginalSize12 = Instance.new("Vector3Value")
	OriginalSize12.Name = "OriginalSize"
	OriginalSize12.Value = Vector3.new(0.9999999403953552, 1.5000003576278687, 1.0000001192092896)
	OriginalSize12.Parent = RightLowerLeg

	local RightKnee = Instance.new("Motor6D")
	RightKnee.Name = "RightKnee"
	RightKnee.C1 = CFrame.new(-0, 0.24999964237213135, 0.000043526004446903244)
	RightKnee.C0 = CFrame.new(-0, -0.2999999523162842, 0.00004360051025287248)
	RightKnee.Parent = RightLowerLeg

	local RightUpperLeg = Instance.new("MeshPart")
	RightUpperLeg.Name = "RightUpperLeg"
	RightUpperLeg.CanCollide = false
	RightUpperLeg.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	RightUpperLeg.Color = Color3.fromRGB(159, 161, 172)
	RightUpperLeg.Size = Vector3.new(1.0000004768371582, 1.499999761581421, 0.9999998807907104)
	RightUpperLeg.CFrame = CFrame.new(35.472747802734375, -107.68144989013672, -3.745588541030884, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightUpperLeg.Parent = R15

	local RightHipRigAttachment = Instance.new("Attachment")
	RightHipRigAttachment.Name = "RightHipRigAttachment"
	RightHipRigAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightHipRigAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightHipRigAttachment.CFrame = CFrame.new(-0, 0.5, -1.043081283569336e-07)
	RightHipRigAttachment.WorldPosition = Vector3.new(35.472747802734375, -107.18144989013672, -3.745588541030884)
	RightHipRigAttachment.WorldCFrame = CFrame.new(35.472747802734375, -107.18144989013672, -3.745588541030884, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightHipRigAttachment.Position = Vector3.new(-0, 0.5, -1.043081283569336e-07)
	RightHipRigAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightHipRigAttachment.Parent = RightUpperLeg

	local RightKneeRigAttachment1 = Instance.new("Attachment")
	RightKneeRigAttachment1.Name = "RightKneeRigAttachment"
	RightKneeRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightKneeRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightKneeRigAttachment1.CFrame = CFrame.new(-0, -0.2999999523162842, 0.00004360051025287248)
	RightKneeRigAttachment1.WorldPosition = Vector3.new(35.472774505615234, -107.98145294189453, -3.745553970336914)
	RightKneeRigAttachment1.WorldCFrame = CFrame.new(35.472774505615234, -107.98145294189453, -3.745553970336914, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightKneeRigAttachment1.Position = Vector3.new(-0, -0.2999999523162842, 0.00004360051025287248)
	RightKneeRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightKneeRigAttachment1.Parent = RightUpperLeg

	local OriginalSize13 = Instance.new("Vector3Value")
	OriginalSize13.Name = "OriginalSize"
	OriginalSize13.Value = Vector3.new(1.0000004768371582, 1.499999761581421, 0.9999998807907104)
	OriginalSize13.Parent = RightUpperLeg

	local RightHip = Instance.new("Motor6D")
	RightHip.Name = "RightHip"
	RightHip.C1 = CFrame.new(-0, 0.5, -1.043081283569336e-07)
	RightHip.C0 = CFrame.new(0.49999988079071045, -0.19999995827674866, -0)
	RightHip.Parent = RightUpperLeg

	local LowerTorso = Instance.new("MeshPart")
	LowerTorso.Name = "LowerTorso"
	LowerTorso.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	LowerTorso.Color = Color3.fromRGB(159, 161, 172)
	LowerTorso.Size = Vector3.new(1.999999761581421, 0.3999999761581421, 1.0000001192092896)
	LowerTorso.CFrame = CFrame.new(35.07740020751953, -106.98145294189453, -3.439481735229492, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LowerTorso.Parent = R15

	local RootRigAttachment1 = Instance.new("Attachment")
	RootRigAttachment1.Name = "RootRigAttachment"
	RootRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RootRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RootRigAttachment1.CFrame = CFrame.new(-1.1920928955078125e-07, 0.15000003576278687, -0)
	RootRigAttachment1.WorldPosition = Vector3.new(35.07740020751953, -106.83145141601562, -3.439481735229492)
	RootRigAttachment1.WorldCFrame = CFrame.new(35.07740020751953, -106.83145141601562, -3.439481735229492, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RootRigAttachment1.Position = Vector3.new(-1.1920928955078125e-07, 0.15000003576278687, -0)
	RootRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RootRigAttachment1.Parent = LowerTorso

	local WaistRigAttachment1 = Instance.new("Attachment")
	WaistRigAttachment1.Name = "WaistRigAttachment"
	WaistRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	WaistRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	WaistRigAttachment1.CFrame = CFrame.new(-1.1920928955078125e-07, 0.5500000715255737, 7.644625506630354e-20)
	WaistRigAttachment1.WorldPosition = Vector3.new(35.07740020751953, -106.43144989013672, -3.439481735229492)
	WaistRigAttachment1.WorldCFrame = CFrame.new(35.07740020751953, -106.43144989013672, -3.439481735229492, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	WaistRigAttachment1.Position = Vector3.new(-1.1920928955078125e-07, 0.5500000715255737, 7.644625506630354e-20)
	WaistRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	WaistRigAttachment1.Parent = LowerTorso

	local LeftHipRigAttachment1 = Instance.new("Attachment")
	LeftHipRigAttachment1.Name = "LeftHipRigAttachment"
	LeftHipRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	LeftHipRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	LeftHipRigAttachment1.CFrame = CFrame.new(-0.5000001192092896, -0.19999995827674866, -0)
	LeftHipRigAttachment1.WorldPosition = Vector3.new(34.68205261230469, -107.18144989013672, -3.1333746910095215)
	LeftHipRigAttachment1.WorldCFrame = CFrame.new(34.68205261230469, -107.18144989013672, -3.1333746910095215, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	LeftHipRigAttachment1.Position = Vector3.new(-0.5000001192092896, -0.19999995827674866, -0)
	LeftHipRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	LeftHipRigAttachment1.Parent = LowerTorso

	local RightHipRigAttachment1 = Instance.new("Attachment")
	RightHipRigAttachment1.Name = "RightHipRigAttachment"
	RightHipRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	RightHipRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	RightHipRigAttachment1.CFrame = CFrame.new(0.49999988079071045, -0.19999995827674866, -0)
	RightHipRigAttachment1.WorldPosition = Vector3.new(35.472747802734375, -107.18144989013672, -3.745588779449463)
	RightHipRigAttachment1.WorldCFrame = CFrame.new(35.472747802734375, -107.18144989013672, -3.745588779449463, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	RightHipRigAttachment1.Position = Vector3.new(0.49999988079071045, -0.19999995827674866, -0)
	RightHipRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	RightHipRigAttachment1.Parent = LowerTorso

	local WaistCenterAttachment = Instance.new("Attachment")
	WaistCenterAttachment.Name = "WaistCenterAttachment"
	WaistCenterAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	WaistCenterAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	WaistCenterAttachment.CFrame = CFrame.new(0, -0.20000000298023224, 0)
	WaistCenterAttachment.WorldPosition = Vector3.new(35.07740020751953, -107.18144989013672, -3.439481735229492)
	WaistCenterAttachment.WorldCFrame = CFrame.new(35.07740020751953, -107.18144989013672, -3.439481735229492, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	WaistCenterAttachment.Position = Vector3.new(0, -0.20000000298023224, 0)
	WaistCenterAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	WaistCenterAttachment.Parent = LowerTorso

	local WaistFrontAttachment = Instance.new("Attachment")
	WaistFrontAttachment.Name = "WaistFrontAttachment"
	WaistFrontAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	WaistFrontAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	WaistFrontAttachment.CFrame = CFrame.new(0, -0.20000000298023224, -0.5)
	WaistFrontAttachment.WorldPosition = Vector3.new(34.77129364013672, -107.18144989013672, -3.8348278999328613)
	WaistFrontAttachment.WorldCFrame = CFrame.new(34.77129364013672, -107.18144989013672, -3.8348278999328613, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	WaistFrontAttachment.Position = Vector3.new(0, -0.20000000298023224, -0.5)
	WaistFrontAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	WaistFrontAttachment.Parent = LowerTorso

	local WaistBackAttachment = Instance.new("Attachment")
	WaistBackAttachment.Name = "WaistBackAttachment"
	WaistBackAttachment.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	WaistBackAttachment.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	WaistBackAttachment.CFrame = CFrame.new(0, -0.20000000298023224, 0.5)
	WaistBackAttachment.WorldPosition = Vector3.new(35.383506774902344, -107.18144989013672, -3.044135570526123)
	WaistBackAttachment.WorldCFrame = CFrame.new(35.383506774902344, -107.18144989013672, -3.044135570526123, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	WaistBackAttachment.Position = Vector3.new(0, -0.20000000298023224, 0.5)
	WaistBackAttachment.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	WaistBackAttachment.Parent = LowerTorso

	local OriginalSize14 = Instance.new("Vector3Value")
	OriginalSize14.Name = "OriginalSize"
	OriginalSize14.Value = Vector3.new(1.999999761581421, 0.3999999761581421, 1.0000001192092896)
	OriginalSize14.Parent = LowerTorso

	local Root = Instance.new("Motor6D")
	Root.Name = "Root"
	Root.C1 = CFrame.new(-1.1920928955078125e-07, 0.15000003576278687, -0)
	Root.Parent = LowerTorso

	local Humanoid = Instance.new("Humanoid")
	Humanoid.RigType = Enum.HumanoidRigType.R15
	Humanoid.HipHeight = 1.35
	Humanoid.Parent = R15

	local Animator = Instance.new("Animator")
	Animator.Parent = Humanoid

	local Head = Instance.new("Part")
	Head.Name = "Head"
	Head.BottomSurface = Enum.SurfaceType.Smooth
	Head.Velocity = Vector3.new(-1.401298464324817e-45, 0, -1.401298464324817e-45)
	Head.TopSurface = Enum.SurfaceType.Smooth
	Head.Color = Color3.fromRGB(159, 161, 172)
	Head.Size = Vector3.new(2, 1, 1)
	Head.CFrame = CFrame.new(35.07756805419922, -104.68144989013672, -3.4392664432525635, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	Head.Parent = R15

	local Mesh = Instance.new("SpecialMesh")
	Mesh.Scale = Vector3.new(1.25, 1.25, 1.25)
	Mesh.Parent = Head

	local FaceCenterAttachment = Instance.new("Attachment")
	FaceCenterAttachment.Name = "FaceCenterAttachment"
	FaceCenterAttachment.WorldSecondaryAxis = Vector3.new(6.223835224972163e-09, 1, -4.8189656709496376e-09)
	FaceCenterAttachment.WorldOrientation = Vector3.new(2.5444436054650188e-14, 37.749759674072266, -4.5099656631464313e-07)
	FaceCenterAttachment.CFrame = CFrame.new(3.935688219769418e-09, 0, -0.0002722442150115967, 1, 7.871375551360416e-09, 3.029981271446139e-15, -7.871375551360416e-09, 1, -4.1444258024012927e-16, -3.029981271446139e-15, 4.1444255377034967e-16, 1)
	FaceCenterAttachment.WorldPosition = Vector3.new(35.07740020751953, -104.68144989013672, -3.439481735229492)
	FaceCenterAttachment.Axis = Vector3.new(1, -7.871375551360416e-09, -3.029981271446139e-15)
	FaceCenterAttachment.Rotation = Vector3.new(2.374580973475357e-14, 1.7360513525875587e-13, -4.5099656631464313e-07)
	FaceCenterAttachment.WorldCFrame = CFrame.new(35.07740020751953, -104.68144989013672, -3.439481735229492, 0.790692150592804, 6.223835224972163e-09, 0.6122139692306519, -7.871375551360416e-09, 1, -4.1444258024012927e-16, -0.6122139692306519, -4.8189656709496376e-09, 0.790692150592804)
	FaceCenterAttachment.SecondaryAxis = Vector3.new(7.871375551360416e-09, 1, 4.1444255377034967e-16)
	FaceCenterAttachment.Position = Vector3.new(3.935688219769418e-09, 0, -0.0002722442150115967)
	FaceCenterAttachment.Orientation = Vector3.new(2.374580973475357e-14, 1.7360513525875587e-13, -4.5099656631464313e-07)
	FaceCenterAttachment.WorldAxis = Vector3.new(0.790692150592804, -7.871375551360416e-09, -0.6122139692306519)
	FaceCenterAttachment.Parent = Head

	local FaceFrontAttachment = Instance.new("Attachment")
	FaceFrontAttachment.Name = "FaceFrontAttachment"
	FaceFrontAttachment.WorldSecondaryAxis = Vector3.new(6.223835224972163e-09, 1, -4.8189656709496376e-09)
	FaceFrontAttachment.WorldOrientation = Vector3.new(2.5444436054650188e-14, 37.749759674072266, -4.5099656631464313e-07)
	FaceFrontAttachment.CFrame = CFrame.new(3.9356886638586275e-09, 0, -0.6002722978591919, 1, 7.871375551360416e-09, 3.029981271446139e-15, -7.871375551360416e-09, 1, -4.1444258024012927e-16, -3.029981271446139e-15, 4.1444255377034967e-16, 1)
	FaceFrontAttachment.WorldPosition = Vector3.new(34.7100715637207, -104.68144989013672, -3.9138970375061035)
	FaceFrontAttachment.Axis = Vector3.new(1, -7.871375551360416e-09, -3.029981271446139e-15)
	FaceFrontAttachment.Rotation = Vector3.new(2.374580973475357e-14, 1.7360513525875587e-13, -4.5099656631464313e-07)
	FaceFrontAttachment.WorldCFrame = CFrame.new(34.7100715637207, -104.68144989013672, -3.9138970375061035, 0.790692150592804, 6.223835224972163e-09, 0.6122139692306519, -7.871375551360416e-09, 1, -4.1444258024012927e-16, -0.6122139692306519, -4.8189656709496376e-09, 0.790692150592804)
	FaceFrontAttachment.SecondaryAxis = Vector3.new(7.871375551360416e-09, 1, 4.1444255377034967e-16)
	FaceFrontAttachment.Position = Vector3.new(3.9356886638586275e-09, 0, -0.6002722978591919)
	FaceFrontAttachment.Orientation = Vector3.new(2.374580973475357e-14, 1.7360513525875587e-13, -4.5099656631464313e-07)
	FaceFrontAttachment.WorldAxis = Vector3.new(0.790692150592804, -7.871375551360416e-09, -0.6122139692306519)
	FaceFrontAttachment.Parent = Head

	local HairAttachment = Instance.new("Attachment")
	HairAttachment.Name = "HairAttachment"
	HairAttachment.WorldSecondaryAxis = Vector3.new(6.223835224972163e-09, 1, -4.8189656709496376e-09)
	HairAttachment.WorldOrientation = Vector3.new(2.5444436054650188e-14, 37.749759674072266, -4.5099656631464313e-07)
	HairAttachment.CFrame = CFrame.new(8.658513905857035e-09, 0.5999999046325684, -0.0002722442150115967, 1, 7.871375551360416e-09, 3.029981271446139e-15, -7.871375551360416e-09, 1, -4.1444258024012927e-16, -3.029981271446139e-15, 4.1444255377034967e-16, 1)
	HairAttachment.WorldPosition = Vector3.new(35.07740020751953, -104.08145141601562, -3.439481735229492)
	HairAttachment.Axis = Vector3.new(1, -7.871375551360416e-09, -3.029981271446139e-15)
	HairAttachment.Rotation = Vector3.new(2.374580973475357e-14, 1.7360513525875587e-13, -4.5099656631464313e-07)
	HairAttachment.WorldCFrame = CFrame.new(35.07740020751953, -104.08145141601562, -3.439481735229492, 0.790692150592804, 6.223835224972163e-09, 0.6122139692306519, -7.871375551360416e-09, 1, -4.1444258024012927e-16, -0.6122139692306519, -4.8189656709496376e-09, 0.790692150592804)
	HairAttachment.SecondaryAxis = Vector3.new(7.871375551360416e-09, 1, 4.1444255377034967e-16)
	HairAttachment.Position = Vector3.new(8.658513905857035e-09, 0.5999999046325684, -0.0002722442150115967)
	HairAttachment.Orientation = Vector3.new(2.374580973475357e-14, 1.7360513525875587e-13, -4.5099656631464313e-07)
	HairAttachment.WorldAxis = Vector3.new(0.790692150592804, -7.871375551360416e-09, -0.6122139692306519)
	HairAttachment.Parent = Head

	local HatAttachment = Instance.new("Attachment")
	HatAttachment.Name = "HatAttachment"
	HatAttachment.WorldSecondaryAxis = Vector3.new(6.223835224972163e-09, 1, -4.8189656709496376e-09)
	HatAttachment.WorldOrientation = Vector3.new(2.5444436054650188e-14, 37.749759674072266, -4.5099656631464313e-07)
	HatAttachment.CFrame = CFrame.new(8.658513905857035e-09, 0.5999999046325684, -0.0002722442150115967, 1, 7.871375551360416e-09, 3.029981271446139e-15, -7.871375551360416e-09, 1, -4.1444258024012927e-16, -3.029981271446139e-15, 4.1444255377034967e-16, 1)
	HatAttachment.WorldPosition = Vector3.new(35.07740020751953, -104.08145141601562, -3.439481735229492)
	HatAttachment.Axis = Vector3.new(1, -7.871375551360416e-09, -3.029981271446139e-15)
	HatAttachment.Rotation = Vector3.new(2.374580973475357e-14, 1.7360513525875587e-13, -4.5099656631464313e-07)
	HatAttachment.WorldCFrame = CFrame.new(35.07740020751953, -104.08145141601562, -3.439481735229492, 0.790692150592804, 6.223835224972163e-09, 0.6122139692306519, -7.871375551360416e-09, 1, -4.1444258024012927e-16, -0.6122139692306519, -4.8189656709496376e-09, 0.790692150592804)
	HatAttachment.SecondaryAxis = Vector3.new(7.871375551360416e-09, 1, 4.1444255377034967e-16)
	HatAttachment.Position = Vector3.new(8.658513905857035e-09, 0.5999999046325684, -0.0002722442150115967)
	HatAttachment.Orientation = Vector3.new(2.374580973475357e-14, 1.7360513525875587e-13, -4.5099656631464313e-07)
	HatAttachment.WorldAxis = Vector3.new(0.790692150592804, -7.871375551360416e-09, -0.6122139692306519)
	HatAttachment.Parent = Head

	local NeckRigAttachment1 = Instance.new("Attachment")
	NeckRigAttachment1.Name = "NeckRigAttachment"
	NeckRigAttachment1.WorldSecondaryAxis = Vector3.new(1.1174396092217555e-35, 1, 5.216463170372663e-36)
	NeckRigAttachment1.WorldOrientation = Vector3.new(6.282904806662333e-34, 37.749759674072266, -3.2325727305628275e-34)
	NeckRigAttachment1.CFrame = CFrame.new(-0, -0.5000001192092896, -0.0002722442150115967)
	NeckRigAttachment1.WorldPosition = Vector3.new(35.07740020751953, -105.18144989013672, -3.439481735229492)
	NeckRigAttachment1.WorldCFrame = CFrame.new(35.07740020751953, -105.18144989013672, -3.439481735229492, 0.790692150592804, 1.1174396092217555e-35, 0.6122139692306519, -5.641904020691205e-36, 1, -1.0965737952833648e-35, -0.6122139692306519, 5.216463170372663e-36, 0.790692150592804)
	NeckRigAttachment1.Position = Vector3.new(-0, -0.5000001192092896, -0.0002722442150115967)
	NeckRigAttachment1.WorldAxis = Vector3.new(0.790692150592804, -5.641904020691205e-36, -0.6122139692306519)
	NeckRigAttachment1.Parent = Head

	local face = Instance.new("Decal")
	face.Name = "face"
	face.Texture = "rbxasset://textures/face.png"
	face.Parent = Head

	local OriginalSize15 = Instance.new("Vector3Value")
	OriginalSize15.Name = "OriginalSize"
	OriginalSize15.Value = Vector3.new(2, 1, 1)
	OriginalSize15.Parent = Head

	local Neck = Instance.new("Motor6D")
	Neck.Name = "Neck"
	Neck.C1 = CFrame.new(-0, -0.5000001192092896, -0.0002722442150115967)
	Neck.C0 = CFrame.new(-5.960464477539063e-08, 0.7999999523162842, 1.1920928955078125e-07)
	Neck.Parent = Head

	LeftWrist.Part1 = LeftHand
	LeftWrist.Part0 = LeftLowerArm

	LeftElbow.Part1 = LeftLowerArm
	LeftElbow.Part0 = LeftUpperArm

	LeftShoulder.Part1 = LeftUpperArm
	LeftShoulder.Part0 = UpperTorso

	RightWrist.Part1 = RightHand
	RightWrist.Part0 = RightLowerArm

	RightElbow.Part1 = RightLowerArm
	RightElbow.Part0 = RightUpperArm

	RightShoulder.Part1 = RightUpperArm
	RightShoulder.Part0 = UpperTorso

	Waist.Part1 = UpperTorso
	Waist.Part0 = LowerTorso

	LeftAnkle.Part1 = LeftFoot
	LeftAnkle.Part0 = LeftLowerLeg

	LeftKnee.Part1 = LeftLowerLeg
	LeftKnee.Part0 = LeftUpperLeg

	LeftHip.Part1 = LeftUpperLeg
	LeftHip.Part0 = LowerTorso

	RightAnkle.Part1 = RightFoot
	RightAnkle.Part0 = RightLowerLeg

	RightKnee.Part1 = RightLowerLeg
	RightKnee.Part0 = RightUpperLeg

	RightHip.Part1 = RightUpperLeg
	RightHip.Part0 = LowerTorso

	Root.Part1 = LowerTorso
	Root.Part0 = HumanoidRootPart

	Humanoid.Torso = HumanoidRootPart
	Humanoid.RightLeg = RightUpperLeg
	Humanoid.LeftLeg = LeftUpperLeg

	Neck.Part1 = Head
	Neck.Part0 = UpperTorso

	R15.PrimaryPart = HumanoidRootPart
	R15.Parent = game:FindFirstChildOfClass('ServerStorage')
end
-- Effect Fixer: Some Accessory Effect Did't Appear Or Appeared Incorrectly In R6
workspace.DescendantAdded:Connect(function(Descendant)
	desynchronize()
	task.wait(.01)
	if Descendant:GetAttribute('Fixed') then
		return
	end
	if Descendant:IsA('Model') and Descendant:FindFirstChildOfClass('Humanoid') and Descendant:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R6 and not Descendant:GetAttribute('Fixed') then
		synchronize()Descendant:SetAttribute('Fixed',true)
		--print('r6')
		if Descendant:FindFirstChild('Right Arm') and Descendant:FindFirstChild('Right Arm'):FindFirstChild('RightGripAttachment') then
			Descendant:FindFirstChild('Right Arm'):FindFirstChild('RightGripAttachment').CFrame = Descendant:FindFirstChild('Right Arm'):FindFirstChild('RightGripAttachment').CFrame * CFrame.Angles(math.rad(-90),0,0)
		end
		if Descendant:FindFirstChild('Left Arm') and Descendant:FindFirstChild('Left Arm'):FindFirstChild('LeftGripAttachment') then
			Descendant:FindFirstChild('Left Arm'):FindFirstChild('LeftGripAttachment').CFrame = Descendant:FindFirstChild('Left Arm'):FindFirstChild('LeftGripAttachment').CFrame * CFrame.Angles(math.rad(-90),0,0)
		end
		desynchronize()
		if game:FindFirstChildOfClass('ServerStorage') and game:FindFirstChildOfClass('ServerStorage'):FindFirstChild('R15') then
			synchronize()
			local Alt = game:FindFirstChildOfClass('ServerStorage'):FindFirstChild('R15'):Clone()
			desynchronize()
			if Alt and Alt:FindFirstChildOfClass('Humanoid') then
				synchronize()
				Alt.Name = Descendant.Name.."_Cache"
				Alt.Parent = game:FindFirstChildOfClass('ServerStorage')
				Alt:FindFirstChildOfClass('Humanoid'):ApplyDescription(Descendant:FindFirstChildOfClass('Humanoid'):GetAppliedDescription())
				desynchronize()
				for i,v in Alt:GetChildren() do
					desynchronize()
					if v:IsA('Accessory') then
						local vcheck = v.Name..((v:FindFirstChildOfClass('MeshPart') and v:FindFirstChildOfClass('MeshPart').TextureID) or (v:FindFirstChildOfClass('Part') and v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh')and v:FindFirstChildOfClass('Part') :FindFirstChildOfClass('SpecialMesh').TextureId) or '')
						local Cached = false
						local SpecialTag = ''
						for i,Accessory: Accessory in CacheFolder:GetChildren() do
							if v.AccessoryType == Accessory.AccessoryType then
								if Descendant and v and vcheck == Accessory.Name and v:FindFirstChildOfClass('MeshPart') and Accessory:FindFirstChildOfClass('MeshPart') and Accessory:FindFirstChildOfClass('MeshPart').MeshId == v:FindFirstChildOfClass('MeshPart').MeshId and Accessory:FindFirstChildOfClass('MeshPart').TextureID == v:FindFirstChildOfClass('MeshPart').TextureID then
									Cached = true
									break
								end
								if Descendant and v and vcheck == Accessory.Name and v:FindFirstChildOfClass('Part') and Accessory:FindFirstChildOfClass('Part') and v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh') and Accessory:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh') and Accessory:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh').MeshId == v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh').MeshId and Accessory:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh').TextureId == v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh').TextureId then
									Cached = true
									break
								end	
								if Descendant and v and vcheck == Accessory.Name and v:FindFirstChildOfClass('Part') and Accessory:FindFirstChildOfClass('MeshPart') and v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh') and tonumber(Accessory:FindFirstChildOfClass('MeshPart').MeshId) == tonumber(v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh').MeshId) and tonumber(Accessory:FindFirstChildOfClass('MeshPart').TextureID) == tonumber(v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh').TextureId) then
									Cached = true -- r6 compared to r15
									break
								end	
							end
						end
						if not Cached then
							synchronize()
							local clone = v:Clone()
							if SpecialTag == '' and clone:FindFirstChildOfClass('MeshPart') then SpecialTag = clone:FindFirstChildOfClass('MeshPart').TextureID end
							clone.Name = v.Name..SpecialTag
							clone.Parent = CacheFolder
						end
					end
				end
				synchronize()
				Alt:Destroy()
			end
		end 
		desynchronize()
		for _, v in pairs(Descendant:GetChildren()) do
			if v:IsA('Accessory') then
				local IsCached = false
				local CachedAccessoryDirectory = nil
				local vcheck = v.Name..((v:FindFirstChildOfClass('MeshPart') and v:FindFirstChildOfClass('MeshPart').TextureID) or (v:FindFirstChildOfClass('Part') and v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh')and v:FindFirstChildOfClass('Part') :FindFirstChildOfClass('SpecialMesh').TextureId) or '')
				for _, Accessory in pairs(CacheFolder:GetChildren()) do
					if vcheck == Accessory.Name and v.AccessoryType == Accessory.AccessoryType then
						local vMeshPart = v:FindFirstChildOfClass('MeshPart')
						local vSpecialMesh = v:FindFirstChildOfClass('Part') and v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh')
						local accMeshPart = Accessory:FindFirstChildOfClass('MeshPart')
						local accSpecialMesh = Accessory:FindFirstChildOfClass('Part') and Accessory:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh')

						if vMeshPart and accMeshPart and tonumber(vMeshPart.MeshId) == tonumber(accMeshPart.MeshId) and tonumber(vMeshPart.TextureID) == tonumber(accMeshPart.TextureID) then
							IsCached = true
							CachedAccessoryDirectory = Accessory
							break  -- Exit the loop since a match is found
						end
						if vSpecialMesh and accSpecialMesh and tonumber(vSpecialMesh.MeshId) == tonumber(accSpecialMesh.MeshId) and tonumber(vSpecialMesh.TextureId) == tonumber(accSpecialMesh.TextureId) then
							IsCached = true
							CachedAccessoryDirectory = Accessory
							break
						end
						if Descendant and v and vcheck == Accessory.Name and vSpecialMesh and accMeshPart and tonumber(accMeshPart.MeshId)  == tonumber(vSpecialMesh.MeshId) and tonumber(accMeshPart.TextureID) == tonumber(vSpecialMesh.TextureId) then
							IsCached = true -- r6 compared to r15
							CachedAccessoryDirectory = Accessory
							break
						end	
						if Descendant and v and vcheck == Accessory.Name and vMeshPart and accSpecialMesh and tonumber(accSpecialMesh.MeshId)  == tonumber(vMeshPart.MeshId) and tonumber(vMeshPart.TextureID) == tonumber(accSpecialMesh.TextureId) then
							IsCached = true -- r15 compared to r6
							CachedAccessoryDirectory = Accessory
							break
						end	
					end
				end

				if IsCached and CachedAccessoryDirectory and CachedAccessoryDirectory:IsA('Accessory') and not v:FindFirstChildOfClass('MeshPart') then
					Swap(v, CachedAccessoryDirectory)
				end
			end
		end
	elseif Descendant:IsA('Model') and Descendant:FindFirstChildOfClass('Humanoid') and Descendant:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R15 then
		synchronize()Descendant:SetAttribute('Fixed',true)
		desynchronize()
		task.wait(.01)
		--print('r15>'.. Descendant:GetFullName())
		for i,v in Descendant:GetChildren() do
			desynchronize()
			if Descendant and v and v:IsA('Accessory') then
				if v:IsA('Accessory') then
					local Cached = false
					local SpecialTag = ''
					local vcheck = v.Name..((v:FindFirstChildOfClass('MeshPart') and v:FindFirstChildOfClass('MeshPart').TextureID) or (v:FindFirstChildOfClass('Part') and v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh')and v:FindFirstChildOfClass('Part') :FindFirstChildOfClass('SpecialMesh').TextureId) or '')
					for i,Accessory in CacheFolder:GetChildren() do
						if v.AccessoryType == Accessory.AccessoryType then
							if Descendant and v and vcheck == Accessory.Name and v:FindFirstChildOfClass('MeshPart') and Accessory:FindFirstChildOfClass('MeshPart') and Accessory:FindFirstChildOfClass('MeshPart').MeshId == v:FindFirstChildOfClass('MeshPart').MeshId and Accessory:FindFirstChildOfClass('MeshPart').TextureID == v:FindFirstChildOfClass('MeshPart').TextureID then
								Cached = true
								break
							end
							if Descendant and v and vcheck == Accessory.Name and v:FindFirstChildOfClass('MeshPart') and Accessory:FindFirstChildOfClass('MeshPart') and tonumber(Accessory:FindFirstChildOfClass('MeshPart').TextureID)  == tonumber(v:FindFirstChildOfClass('MeshPart').TextureID) and tonumber(Accessory:FindFirstChildOfClass('MeshPart').MeshId)  == tonumber(v:FindFirstChildOfClass('MeshPart').MeshId) then
								Cached = true
								break
							end
							if Descendant and v and vcheck == Accessory.Name and v:FindFirstChildOfClass('Part') and Accessory:FindFirstChildOfClass('Part') and v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh') and Accessory:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh') and Accessory:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh').TextureId == v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh').TextureId then
								Cached = true
								break
							end	
							if Descendant and v and vcheck == Accessory.Name and v:FindFirstChildOfClass('Part') and Accessory:FindFirstChildOfClass('MeshPart') and v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh') and tonumber(Accessory:FindFirstChildOfClass('MeshPart').MeshId) == tonumber(v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh').MeshId) and tonumber(Accessory:FindFirstChildOfClass('MeshPart').TextureID) == tonumber(v:FindFirstChildOfClass('Part'):FindFirstChildOfClass('SpecialMesh').TextureId) then
								Cached = true -- r6 compared to r15
								break
							end	
						end
					end
					if not Cached then
						synchronize()
						print("Cached "..v.Name..SpecialTag)
						local clone = v:Clone()
						if SpecialTag == '' and clone:FindFirstChildOfClass('MeshPart') then SpecialTag = clone:FindFirstChildOfClass('MeshPart').TextureID end
						clone.Name = v.Name..SpecialTag
						clone.Parent = CacheFolder
					end
				end
			end
		end
	end
end)