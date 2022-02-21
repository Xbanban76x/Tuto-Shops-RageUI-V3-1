
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('buyItem')
AddEventHandler('buyItem', function(Label, Value, Price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= Price then
        if xPlayer.canCarryItem(Value, 1) then
            xPlayer.removeMoney(Price)
            xPlayer.addInventoryItem(Value, 1)
            TriggerClientEvent('esx:showAdvancedNotification', _src, 'Supérette', '~o~2~r~4~g~7', "Vous venez d'acheter ~b~1x "..Label.." ~s~pour ~r~"..Price.. " $ ~s~!", 'CHAR_ACTING_UP', 1)
        else
            TriggerClientEvent('esx:showAdvancedNotification', _src, 'Supérette', '~o~2~r~4~g~7', "Vous n'avez pas assez de place dans votre inventaire !", 'CHAR_ACTING_UP', 1)
        end
    else
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Supérette', '~o~2~r~4~g~7', "Vous n'avez pas suffisament d'argent !\n Il vous manque ~r~"..Price - xPlayer.getMoney().." $", 'CHAR_ACTING_UP', 1)
    end
end)

