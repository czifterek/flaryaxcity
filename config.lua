Config = {}

Config.Debug = false
Config.Framework = 'ESX' -- ESX / QB
Config.Language = 'en' -- pl / en

Config.Start = {
    ped = { -- delete ped to remove ped
        model = 'csb_agent',
        anim = {}
    },
    coords = vector4(1150.8447, 2388.9236, 57.8078, 31.6073),
    radius = 0.35,
    drawSprite = true,
    label = 'Take Job',
    icon = 'fa-solid fa-comments',
    jobsLimit = 3,
    timeRestrict = {18, 6}, -- from 6 pm to 6 am, set to false to turn off
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
    flareTime = 30, -- 30 minutes
    flareRadius = 300.0,
    radiusColor = 1,
    radiusAlpha = 180,
    flareMove = {x = {-30.0, 30.0}, y = {-30.0, 30.0}}, -- move flare blip for random x, y
    requiredItems = {
        ['lockpick'] = 0.1 -- set to 1 to remove item, or float to remove durability from item
    },
    removeType = 1, -- 1 = remove every try, 2 = remove only on success
    flareBlip = {
        sprite = 514,
        scale = 0.9,
        color = 1,
        priority = 5,
        shortRange = true,
        name = 'Air Drop'
    }
}

Config.PoliceJobs = {
    ['police'] = true,
}

Config.BoxModels = {
    'tr_prop_tr_adv_case_01a', 'ex_prop_adv_case', 'ex_prop_adv_case_sm', 'ex_prop_adv_case_sm_flash'
}

Config.SearchAnimation = {
    dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
    clip = 'machinic_loop_mechandplayer',
    flag = 1,
    duration = 3500
}

Config.Points = {
    [1] = {
        flareCoords = vector3(1542.6046, 2322.7439, 71.0847),
        boxCoords = { -- script will select 1 from these coords
            vector3(1537.2036, 2325.2351, 70.8695),
            vector3(1544.0769, 2328.3494, 70.9651)
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
    {name = 'black_money', min = 10, max = 100, chance = 10}
}

Config.GetPlayerNumber = function(identifier) -- if you dont use any phone just set it to return true
    return exports['piotreq_phone']:GetNumberFromIdentifier(identifier)
end

Config.Messages = {
    Start = function(playerId, playerNumber)
        exports['piotreq_phone']:SendMessage({
            sender = 'Mario',
            receiver = playerNumber,
            content = 'You receive location on your GPS.',
            notify = {
               title = 'Mario',
               time = 'Now',
               text = 'You receive location on your GPS.',
               type = 'default',
               timeout = 6000
            }
        })
    end,
    Finish = function(playerId, playerNumber)
        exports['piotreq_phone']:SendMessage({
            sender = 'Mario',
            receiver = playerNumber,
            content = 'You finished job. Good work!',
            notify = {
               title = 'Mario',
               time = 'Now',
               text = 'You finished job. Good work!',
               type = 'default',
               timeout = 6000
            }
        })
    end,
    Timeout = function(playerId, playerNumber)
        exports['piotreq_phone']:SendMessage({
            sender = 'Mario',
            receiver = playerNumber,
            content = 'It took you all this time to find it? dont come to me anymore...',
            notify = {
               title = 'Mario',
               time = 'Now',
               text = 'It took you all this time to find it? dont come to me anymore...',
               type = 'default',
               timeout = 6000
            }
        })
    end,
    Stole = function(playerId, playerNumber)
        exports['piotreq_phone']:SendMessage({
            sender = 'Mario',
            receiver = playerNumber,
            content = 'You crazy, you stole a package for my worker. Keep it to yourself and come see me.',
            notify = {
               title = 'Mario',
               time = 'Now',
               text = 'You crazy, you stole a package for my worker. Keep it to yourself and come see me.',
               type = 'default',
               timeout = 6000
            }
        })
    end,
    Stolen = function(playerId, playerNumber)
        exports['piotreq_phone']:SendMessage({
            sender = 'Mario',
            receiver = playerNumber,
            content = 'Your package was stolen, you idiot, dont show up here again.',
            notify = {
               title = 'Mario',
               time = 'Now',
               text = 'Your package was stolen, you idiot, dont show up here again.',
               type = 'default',
               timeout = 6000
            }
        })
    end
}