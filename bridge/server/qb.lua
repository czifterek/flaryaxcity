if Config.Framework ~= 'QB' then
    return
end

local QBCore = exports['qb-core']:GetCoreObject()

Core.GetPlayerFromId = function(playerId)
    return QBCore.Functions.GetPlayer(playerId)
end

Core.GetPlayerIdentifier = function(xPlayer)
    return xPlayer.PlayerData.license
end

Core.ShowNotification = function(playerId, text)
    TriggerClientEvent('QBCore:Notify', playerId, text)
end

Core.GetPoliceCount = function()
    local totalPolice = 0
    local xPlayers = QBCore.Functions.GetQBPlayers()
    for _, xPlayer in pairs(xPlayers) do
        if Config.PoliceJobs[xPlayer.PlayerData.job.name] then
            totalPolice += 1
            if totalPolice >= Config.Start.policeCount then
                break
            end
        end
    end

    return totalPolice
end