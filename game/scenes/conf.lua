local keyboard = require "core/keyboard"
local interface = require "core/interface"

function load_conf( scene )
end

function update_conf( dt, scene )
    keyboard.call( scene )
end

function draw_conf( scene )
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor( 150, 150, 150, 100 )
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor( r, g, b, a )
end

return {
    load=load_conf,
    update=update_conf,
    draw=draw_conf
}