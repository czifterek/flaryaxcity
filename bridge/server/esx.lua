if Config.Framework ~= 'ESX' then
    return
end

local ESX = exports['es_extended']:getSharedObject()

Core.GetPlayerFromId = function(playerId)
    return ESX.GetPlayerFromId(playerId)
end

Core.GetPlayerIdentifier = function(xPlayer)
    return xPlayer.identifier
end

Core.ShowNotification = function(playerId, text)
    TriggerClientEvent('esx:showNotification', playerId, text)
end

Core.GetPoliceCount = function()
    local totalPolice = 0
    local xPlayers = ESX.GetExtendedPlayers()
    for _, xPlayer in pairs(xPlayers) do
        if Config.PoliceJobs[xPlayer.job.name] then
            totalPolice += 1
            if totalPolice >= Config.Start.policeCount then
                break
            end
        end
    end

    return totalPolice
end