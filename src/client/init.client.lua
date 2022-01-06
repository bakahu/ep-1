-- SERVICE
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- VERIABLE
local LOADING_GUI = ReplicatedStorage.Common:FindFirstChild("LoadingGui")
local TELEPORT_EVENT = ReplicatedStorage.Common:WaitForChild("TeleportEvent")

-- SCRIPT
local function onFire(PLACE_ID, TELEPORT_GUI)
	if TELEPORT_GUI and LOADING_GUI then
		local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
		LOADING_GUI.Parent = playerGui

		TeleportService:SetTeleportGui(LOADING_GUI)
	end

	TeleportService:Teleport(PLACE_ID)
end

TELEPORT_EVENT.OnClientEvent:Connect(onFire)