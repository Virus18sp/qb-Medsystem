QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('medSystem:print')
AddEventHandler('medSystem:print', function(req, pulse, area, blood, x, y, z, bleeding)

	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	--local  =  ESX.GetPlayerFromId(_source)
	Wait(100)
	local name = xPlayer.PlayerData.charinfo.firstname
	local lastname = xPlayer.PlayerData.charinfo.lastname
	
	
	local xPlayers = QBCore.Functions.GetPlayers()
		for i=1, #xPlayers, 1 do
			TriggerClientEvent('medSystem:near', xPlayers[i] ,x ,y ,z , pulse, blood, name, lastname, area, bleeding)
		end
	
end)

RegisterCommand('med', function(source, args)
	
	if args[1] ~= nil then
	TriggerClientEvent('medSystem:send', args[1], source)
	else
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
	end
	
end)

RegisterNetEvent('hospital:server:SetDeathStatus', function(isDead)
	local src = source
	if not src then return end
	TriggerClientEvent("vir-medsystem:SetDeathStatus", src, isDead)
end)
