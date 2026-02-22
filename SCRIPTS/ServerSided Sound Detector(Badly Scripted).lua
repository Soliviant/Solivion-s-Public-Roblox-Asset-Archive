-- Solivion
local TableOneOnOneExplosion = {}
local TableSoNoDepletionTimers = {}

local function HandleSoundExplosion(descendant)
	if descendant.Playing == false or not descendant.Parent or descendant.PlaybackLoudness <= 0 then
		return
	end
	TableOneOnOneExplosion[descendant:GetFullName()] = {} -- Nullify So It Does Register A Part
	local VolumeType = descendant.PlaybackLoudness -- Configure What U Want It to Consider, Maybe Use PlaybackLoudness For More Accuracy
	local blastRadius = VolumeType * 50
	local soundAreaReaction = Instance.new("Explosion", descendant.Parent)
	soundAreaReaction.Position = descendant.Parent.Position
	soundAreaReaction.DestroyJointRadiusPercent = 0
	soundAreaReaction.ExplosionType = Enum.ExplosionType.NoCraters
	soundAreaReaction.Name = "Exp_" .. descendant:GetFullName()
	soundAreaReaction.Visible = true -- Mayb set it 2 tru, So u Could Debug It.
	soundAreaReaction.BlastPressure = VolumeType
	soundAreaReaction.BlastRadius = blastRadius
	soundAreaReaction.Archivable = false
	
	soundAreaReaction.Hit:Connect(function(WhatHit, Dis)
		task.desynchronize() -- Enable parallel execution, So This Goofy Ahh Checking is 1% Smoother!
		if TableOneOnOneExplosion[descendant:GetFullName()][WhatHit:GetFullName()] ~= nil then
			return
		else
			TableOneOnOneExplosion[descendant:GetFullName()][WhatHit:GetFullName()] = true
		end

		if WhatHit.Name ~= "Head" or not WhatHit:FindFirstAncestorWhichIsA("Model") or not WhatHit:FindFirstAncestorWhichIsA("Model"):FindFirstChildOfClass("Humanoid") or WhatHit:FindFirstAncestorWhichIsA("Model"):FindFirstChildOfClass("Humanoid").Health <= 0 or WhatHit:FindFirstAncestorWhichIsA("Model"):FindFirstChildOfClass("Humanoid"):GetState() == Enum.HumanoidStateType.Ragdoll or WhatHit:FindFirstAncestorWhichIsA("Model"):FindFirstChildOfClass("Humanoid"):GetState() == Enum.HumanoidStateType.Dead or WhatHit:FindFirstAncestorWhichIsA("Model"):FindFirstChildOfClass("Humanoid"):GetState() == Enum.HumanoidStateType.Physics or WhatHit:FindFirstAncestorWhichIsA("Model"):FindFirstChildOfClass("Humanoid"):GetState() == Enum.HumanoidStateType.FallingDown then
			return
		end
		task.synchronize() -- Enable parallel execution
		if not WhatHit:GetAttribute("Sound_Realization") then
			WhatHit:SetAttribute("Sound_Realization", VolumeType/1.5 * math.clamp((1 - Dis / blastRadius), 0, 2))
		else
			WhatHit:SetAttribute("Sound_Realization", WhatHit:GetAttribute("Sound_Realization") + VolumeType/1.5 * math.clamp((1 - Dis / blastRadius), 0, 2))
		end
		
		-- Check if a depletion timer is already running
		if not TableSoNoDepletionTimers[WhatHit:GetFullName()] then
			TableSoNoDepletionTimers[WhatHit:GetFullName()] = true
			task.desynchronize()

			-- Start a timer to deplete the "Sound_Realization" attribute
			task.spawn(function()
				while true do
					task.synchronize()
					task.wait(0.025)  -- Adjust the interval as needed (1 second in this example)
					if not WhatHit or not WhatHit:FindFirstAncestorWhichIsA("Model") or not WhatHit:FindFirstAncestorWhichIsA("Model"):FindFirstChildOfClass("Humanoid") then
						break
					end
					local currentRealization = WhatHit:GetAttribute("Sound_Realization") or 0
					if currentRealization > 0 then
						WhatHit:SetAttribute("Sound_Realization", math.clamp( currentRealization - 0.01, 0 , 2) )
					else
						break
					end
				end
				TableSoNoDepletionTimers[WhatHit:GetFullName()] = nil
				task.synchronize()
			end)
		end

		task.synchronize()
	end)
end

local function ProcessDescendant(descendant)
	if descendant:IsA("Sound") then
		TableOneOnOneExplosion[descendant:GetFullName()] = {}
		descendant.Played:Connect(function(ID)
			task.desynchronize() -- Enable parallel execution
			while descendant.Playing and descendant.Parent do
				task.synchronize() -- Ensure synchronization of state
				HandleSoundExplosion(descendant)
				wait() -- You can adjust this delay as needed
			end
		end)
	end
end

workspace.DescendantAdded:Connect(ProcessDescendant)
--print("Binded To Do The Bomb Thingy")
