QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('medSystem:print')
AddEventHandler('medSystem:print', function(req, pulse, area, blood, x, y, z, bleeding)

	local src = source
	local xPlayer = VirusCore.Functions.GetPlayer(src)
	--local  =  ESX.GetPlayerFromId(_source)
	Wait(100)
	local name = Player.PlayerData.charinfo.firstname
	local lastname = Player.PlayerData.charinfo.lastname
	
	
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
