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
            vector3(314.97, 2891.97, 46.25)
            vector3(283.36, 2821.73, 44.34)
            vector3(290.83, 2815.74, 45.91)
            vector3(319.19, 2883.33, 46.49)
            vector3(301.13, 2865.59, 44.17)
            vector3(261.84, 2859.71, 43.81)
            vector3(325.39, 2884.01, 46.05)
            vector3(259.32, 2873.33, 43.33)
            vector3(294.38, 2882.15, 43.16)
        }
            [2] = {
        flareCoords = vector3(-14.66, -2409.65, 29.5),
        boxCoords = { -- script will select 1 from these coords
            vector3(-3.93, -2451.11, 5.81),
            vector3(-6.72, -2407.53, 6.04)
            vector3(-63.37, -2412.91, 8.71)
            vector3(-151.83, -2364.05, 20.4)
            vector3(-102.69, -2476.59, 6.06)
            vector3(-44.95, -2522.1, 7.99)
            vector3(-52.09, -2449.99, 5.83)
            vector3(-27.12, -2474.55, 26.11)
            vector3(-21.55, -2394.39, 5.86)
            vector3(-15.79, -2411.04, 6.18)
        }
            [3] = {
        flareCoords = vector3(3303.78, 5175.17, 30.54),
        boxCoords = { -- script will select 1 from these coords
            vector3(3309,208, 5157,794, 18,50664),
            vector3(3418.99, 5164.38, 5.94)
            vector3(3417.07, 5175.11, 5.97)
            vector3(3288.11, 5193.15, 18.24)
            vector3(3305.58, 5190.44, 18.11)
            vector3(3321.75, 5188.87, 18.61)
            vector3(3317.83, 5180.21, 18.59)
            vector3(3262.13, 5217.02, 21.44)
            vector3(3259.93, 5073.22, 22.17)
            vector3(3318.13, 5129.83, 18.18)
        }
                [4] = {
        flareCoords = vector3(3318.13, 5129.83, 18.18),
        boxCoords = { -- script will select 1 from these coords
            vector3(1347, 4390.41, 44),
            vector3(1357.45, 4387.03, 43.97)
            vector3(1363.35, 4359.17, 44.36)
            vector3(1337.37, 4361.84, 44.2)
            vector3(1336.7, 4307.23, 38.26)
            vector3(1298.78, 4217.38, 34.31)
            vector3(1294.72, 4343.38, 41.17)
            vector3(1301.79, 4309.49, 37.73)
            vector3(1322.11, 4308.45, 38.06)
            vector3(1300.09, 4321.58, 38.45)
        }
                    [5] = {
        flareCoords = vector3(69.26, 3687.32, 43.1),
        boxCoords = { -- script will select 1 from these coords
            vector3(56.93, 3690.14, 39.89),
            vector3(79.85, 3706.34, 40.83)
            vector3(91.24, 3751.19, 40.92)
            vector3(51.18, 3697.13, 39.8)
            vector3(30.01, 3668.5, 40.25)
            vector3(42.48, 3748.05, 39.62)
            vector3(67.79, 3759.31, 39.91)
            vector3(109.65, 3735.35, 39.82)
            vector3(135.44, 3715.36, 39.59)
            vector3(99.57, 3670.79, 39.89)
        }
                        [6] = {
        flareCoords = vector3(2735.22, 1547.16, 56.92),
        boxCoords = { -- script will select 1 from these coords
            vector3(2750.29, 1564.54, 51.1),
            vector3(2670.98, 1623.54, 24.39)
            vector3(2750.72, 1686.52, 24.55)
            vector3(2846.27, 1553.4, 24.86)
            vector3(2851.64, 1494.61, 25.24)
            vector3(2815.87, 1444.27, 25.25)
            vector3(2735.79, 1490.54, 25.02)
            vector3(2669.92, 1436.59, 24.66)
            vector3(2740.12, 1508.37, 45.35)
            vector3(2756.91, 1534.13, 42.65)
        }
    }
}

Config.MiniGame = function()
    local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'hard'}, {'1', '2', '3', '4'})
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
