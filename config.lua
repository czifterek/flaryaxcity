Config = {}

Config.Debug = false
Config.Framework = 'ESX' -- ESX / QB
Config.Language = 'en' -- pl / en

Config.Start = {
    ped = { -- delete ped to remove ped
        model = 'csb_agent',
        anim = {}
    },
    coords = vector4(26.91, -626.45, 14.51),
    radius = 0.35,
    drawSprite = true,
    label = 'weź zlecenie',
    icon = 'fa-solid fa-comments',
    jobsLimit = 4,
    timeRestrict = false, -- from 6 pm to 6 am, set to false to turn off
    policeCount = 0,
    policeAlert = false, -- true / false
    alertDelay = 2000, -- alert will trigger after 2 seconds from spawning crate
    sendPoliceAlert = function(playerId) -- server sided
        if GetResourceState('piotreq_gpt') == 'started' then
            exports['piotreq_gpt']:SendAlert(playerId, {
                title = 'Crate',
                code = '10-90',
                icon = 'fa-solid fa-mask',
                info = {
                   {icon = 'fa-solid fa-road', isStreet = true},
                   {icon = 'fa-solid fa-triangle-exclamation', data = 'Very Danger'},
                },
                blip = { -- optional
                   scale = 1.1,
                   sprite = 1,
                   category = 3, -- default 1
                   color = 1,
                   hidden = false, -- default false (hidden on legend)
                   priority = 5, -- default 5
                   short = true, -- as short range? default true
                   alpha = 200, -- default 255
                   name = "Crate"
                },
                type = 'risk', -- default normal
                canAnswer = true, -- default false
                maxOfficers = 6, -- default 4
                time = 10,-- 10 minutes, default 5
                notifyTime = 8000, -- 8 seconds, default 7
            })
        end
    end,
    flareTime = 45, -- 30 minutes
    flareRadius = 300.0,
    radiusColor = 1,
    radiusAlpha = 180,
    flareMove = {x = {-30.0, 30.0}, y = {-30.0, 30.0}}, -- move flare blip for random x, y
    requiredItems = {
        ['lockpick'] = 0.1 -- set to 1 to remove item, or float to remove durability from item
    },
    removeType = 2, -- 1 = remove every try, 2 = remove only on success
    flareBlip = {
        sprite = 514,
        scale = 0.9,
        color = 1,
        priority = 5,
        shortRange = false,
        name = 'Zrzut'
    }
}

Config.PoliceJobs = {
    ['police'] = true,
}

Config.BoxModels = {
    'prop_box_wood05a'
}

Config.SearchAnimation = {
    dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
    clip = 'machinic_loop_mechandplayer',
    flag = 1,
    duration = 3500
}

Config.Points = {
    [1] = {
        flareCoords = vector3(268.1, 2866.57, 76.93),
        boxCoords = { -- script will select 1 from these coords
            vector3(268.1, 2866.57, 76.93),
            vector3(314.97, 2891.97, 46.25
            vector3(283.36, 2821.73, 44.34)
            vector3(290.83, 2815.74, 45.91)
            vector3(319.19, 2883.33, 46.49)
            vector3(301.13, 2865.59, 44.17)
            vector3(261.84, 2859.71, 43.81)
            vector3(325.39, 2884.01, 46.05)
            vector3(259.32, 2873.33, 43.33)
            vector3(294.38, 2882.15, 43.16)
        }
    }
}

Config.MiniGame = function()
    local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'hard'}, {'w', 'a', 's', 'd'})
    return success
end

Config.Rewards = {
    {name = 'money', min = 100, max = 1000}
}

Config.LuckyRewards = {
    {name = 'black_money', min = 700, max = 2500, chance = 10}
    {name = 'cannabis_seed' , min = 1, max = 5, chance = 70}
    {name = 'cannabis_seed_female' , min = 1, max = 3, chance = 40}
    {name = 'orange_haze_seed' , min = 1, max = 5, chance = 20}
    {name = 'amber_kush_seed' , min = 1, max = 5, chance = 20}
}

Config.GetPlayerNumber = function(identifier) -- if you dont use any phone just set it to return true
    return exports['piotreq_phone']:GetNumberFromIdentifier(identifier)
end

Config.Messages = {
    Start = function(playerId, playerNumber)
        exports['piotreq_phone']:SendMessage({
            sender = 'Santiago',
            receiver = playerNumber,
            content = 'Wysłałem ci lokalizacje paki.',
            notify = {
               title = 'Santiago',
               time = 'Now',
               text = 'Wysłałem ci lokalizacje paki.',
               type = 'default',
               timeout = 6000
            }
        })
    end,
    Finish = function(playerId, playerNumber)
        exports['piotreq_phone']:SendMessage({
            sender = 'Santiago',
            receiver = playerNumber,
            content = 'Dobra robota, odzywaj się jeszcze.',
            notify = {
               title = 'Santiago',
               time = 'Now',
               text = 'Dobra robota, odzywaj się jeszcze.',
               type = 'default',
               timeout = 6000
            }
        })
    end,
    Timeout = function(playerId, playerNumber)
        exports['piotreq_phone']:SendMessage({
            sender = 'Santiago',
            receiver = playerNumber,
            content = 'Ile ci to może zajmować?! nie przychodź więcej.',
            notify = {
               title = 'Santiago',
               time = 'Now',
               text = 'Ile ci to może zajmować?! nie przychodź więcej.',
               type = 'default',
               timeout = 6000
            }
        })
    end,
    Stole = function(playerId, playerNumber)
        exports['piotreq_phone']:SendMessage({
            sender = 'Santiago',
            receiver = playerNumber,
            content = 'Gratuluje zajebania paki, środek dla ciebie ale następnym razem przyjdź po zlecenie.',
            notify = {
               title = 'Santiago',
               time = 'Now',
               text = 'Gratuluje zajebania paki, środek dla ciebie ale następnym razem przyjdź po zlecenie.',
               type = 'default',
               timeout = 6000
            }
        })
    end,
    Stolen = function(playerId, playerNumber)
        exports['piotreq_phone']:SendMessage({
            sender = 'Santiago',
            receiver = playerNumber,
            content = 'Gratuluje kurwa dalej się opierdolić debilu, nie pokazuj mi się lepiej na oczy',
            notify = {
               title = 'Santiago',
               time = 'Now',
               text = 'Gratuluje kurwa dalej się opierdolić debilu, nie pokazuj mi się lepiej na oczy',
               type = 'default',
               timeout = 6000
            }
        })
    end
}
