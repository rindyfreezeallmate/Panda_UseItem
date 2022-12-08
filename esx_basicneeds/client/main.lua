ESX          = nil
local IsDead = false
local IsAnimated = false
local IsEating = false
local smokingarea = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 100, '#CFAD0F', function(status)
		return true
	end, function(status)
		status.remove(1)
	end)

	TriggerEvent('esx_status:registerStatus', 'thirst', 100, '#CFAD0F', function(status)
		return true
	end, function(status)
		status.remove(1)
	end)

	if Config.EnableStress == true then
		TriggerEvent('esx_status:registerStatus', 'stress', 100, '#CFAD0F', function(status)
			return true
		end, function(status)
			status.add(0.5)
		end)
	end

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1000)

			local playerPed  = PlayerPedId()
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			if Config.EnableStress == true then
				TriggerEvent('esx_status:getStatus', 'stress', function(status)
					if status.val == 100 then
						if prevHealth <= 150 then
							health = health - 5
						else
							health = health - 1
						end
					end
				end)
			end

			if health ~= prevHealth then
				SetEntityHealth(playerPed, health)
			end
		end
	end)
end)
