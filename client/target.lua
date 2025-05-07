target = {}

target.addSphereZone = function(data)
    if GetResourceState('ox_target') == 'started' then
        return exports['ox_target']:addSphereZone(data)
    elseif GetResourceState('qb-target') == 'started' then
        for i = 1, #data.options, 1 do
            if data.options[i].onSelect then
                data.options[i].action = data.options[i].onSelect
            end
        end
        return exports['qb-target']:AddCircleZone(data.name, data.coords, data.radius, {
            name = data.name,
            debugPoly = Config.Debug,
        }, {
            options = data.options,
            distance = data.options[1].distance or 2
        })
    elseif GetResourceState('ox_lib') == 'started' then
        local point = lib.points.new({
            coords = data.coords,
            distance = 3,
        })
         
        function point:onEnter()
            lib.showTextUI(locale('start_textui'))
        end
         
        function point:onExit()
            lib.hideTextUI()
        end
         
        function point:nearby()
            if self.currentDistance < 2.5 and IsControlJustReleased(0, 38) then
                if data.options[1] and data.options[1].onSelect then
                    data.options[1].onSelect()
                end
            end
        end

        return point
    end
end

target.addLocalEntity = function(entity, options)
    if GetResourceState('ox_target') == 'started' then
        exports['ox_target']:addLocalEntity(entity, options)
        return options[1].name
    elseif GetResourceState('qb-target') == 'started' then
        for i = 1, #options, 1 do
            if options[i].onSelect then
                options[i].action = options[i].onSelect
            end
        end
        exports['qb-target']:AddTargetEntity(entity, {
            options = options,
            distance = options[1].distance or 2
        })
        return options[1].label
    elseif GetResourceState('ox_lib') == 'started' then
        local point = lib.points.new({
            coords = GetEntityCoords(entity),
            distance = 3,
        })
         
        function point:onEnter()
            lib.showTextUI(locale('search_textui'))
        end
         
        function point:onExit()
            lib.hideTextUI()
        end
         
        function point:nearby()
            if self.currentDistance < 2.5 and IsControlJustReleased(0, 38) then
                if options[1] and options[1].onSelect then
                    options[1].onSelect()
                end
            end
        end

        return point
    end
end

target.removeLocalEntity = function(entity, optionName)
    if GetResourceState('ox_target') == 'started' then
        exports['ox_target']:removeLocalEntity(entity, optionName)
    elseif GetResourceState('qb-target') == 'started' then
        exports['qb-target']:RemoveTargetEntity(entity, optionName)
    elseif GetResourceState('ox_lib') == 'started' then
        optionName:onExit()
        optionName:remove()
    end
end