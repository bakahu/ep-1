-- SERVICE
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- VERIABLE
local PLACE_ID = 0
local TELEPORT_GUI = true
local TELEPORT_EVENT = ReplicatedStorage.Common:WaitForChild("TeleportEvent")
local TELEPORT_PART = workspace.World.Teleport

-- SCRIPT
local function onTouched(part)
	local character = part.Parent
	local humanoid = character:FindFirstChild("Humanoid")

	if humanoid and not humanoid:GetAttribute("OnTeleport") then
		humanoid:SetAttribute("OnTeleport", true)
		local player = Players:GetPlayerFromCharacter(character)
		TELEPORT_EVENT:FireClient(player, PLACE_ID, TELEPORT_GUI)
	end
end

TELEPORT_PART.Touched:Connect(onTouched)