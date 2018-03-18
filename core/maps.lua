local sti = require "../plugins/sti"

function make_map( map_path, world )
    local map = sti( map_path )
    return map
end

function draw_map( map, screen )
    draw_x, draw_y = screen.x, screen.y
    min_x = - ((map.width * map.tilewidth) - love.graphics.getWidth())
    min_y = - ((map.height * map.tileheight) - love.graphics.getHeight())

    if screen.x < min_x then
        draw_x = min_x
    elseif screen.x > 0 then
        draw_x = 0
    end

    if screen.y < min_y then
        draw_y = min_y
    elseif screen.y > 0 then
        draw_y = 0
    end

    map:draw( draw_x, draw_y )
end

return {
    make=make_map,
    draw=draw_map
}
