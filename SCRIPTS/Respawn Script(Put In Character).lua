--respawn script, Solivion's Take

local chr = script:FindFirstAncestorOfClass('Model')
local hum = chr:FindFirstChildOfClass('Humanoid') or chr:WaitForChild('Humanoid') or Instance.new("Humanoid", chr)
local clonedir = game:FindFirstChildOfClass('ServerStorage'):FindFirstChild(chr.Name) or chr:Clone()
if clonedir and not clonedir:FindFirstAncestorOfClass('ServerStorage') then
	clonedir.Parent = game:FindFirstChildOfClass('ServerStorage')
end
hum.Died:Once(function()
	local clon = clonedir:Clone()
	clon.Parent = chr.Parent
	clon:PivotTo(chr:GetPivot())
	chr:Destroy()
	script:Destroy()
end)
script.Parent = game:FindFirstChildOfClass('ServerScriptService')