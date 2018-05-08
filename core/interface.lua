function make_element(name, keys, action, position, box)
    local element = {
        name=name,
        position=position,
        action=action,
        keys=keys,
        box=box,
    }

    element.call = function()
        if love.mouse.isDown(1) then
            local m_x = love.mouse.getX()
            local m_y = love.mouse.getY()
            if ((element.position.x < m_x and m_x < (element.position.x + element.box.w)) and
                    (element.position.y < m_y and m_y < (element.position.y + element.box.h))) then
                element.action()
            end 
        end

        if love.keyboard.isDown(unpack(keys)) then
            element.action()
        end
    end

    element.draw = function()
        local r, g, b, a = love.graphics.getColor()
        love.graphics.setColor( 99, 99, 200, 200 )
        love.graphics.rectangle("fill", element.position.x, element.position.y, element.box.w, element.box.h, 6, 6, 20)
        love.graphics.setColor(r, g, b, a)
    end

    return element
end

return {
    make=make_element
}