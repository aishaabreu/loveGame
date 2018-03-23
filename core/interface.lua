function make_element(name, keys, action, position, box)
    local element = {
        name=name,
        position=position,
        action=action,
        keys=keys,
        box=box,
    }

    element.call function()
        if love.mouse.isDown(1) then
            local m_x = love.mouse.getX()
            local m_y = love.mouse.getY()
            -- if element.
        end

        if love.keyboard.isDown(unpack(keys)) then
            action()
        end
    end

    return element
end