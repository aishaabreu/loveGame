function make_element(scene, action, position, box)
    if not scene._elements then
        scene._elements = {}
    end

    local element = {
        position=position,
        action=action,
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
    end

    element.draw = function()
        local r, g, b, a = love.graphics.getColor()
        love.graphics.setColor( 99, 99, 200, 200 )
        love.graphics.rectangle("fill", element.position.x, element.position.y, element.box.w, element.box.h, 6, 6, 20)
        love.graphics.setColor(r, g, b, a)
    end

    table.insert(scene._elements, element)
    return element
end

function call_elements( scene )
    for i, element in ipairs(scene._elements) do
        element.call()
    end
end

function draw_elements( scene )
    for i, element in ipairs(scene._elements) do
        element.draw()
    end
end

return {
    make=make_element,
    call=call_elements,
    draw=draw_elements
}