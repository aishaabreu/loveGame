local sti = require "../plugins/sti"

function make_map(map_path, world)
    local map = sti(map_path, { "box2d" })
    map:box2d_init(world)
    return map
end

function draw_map(map, screen)
    map:draw(screen.x, screen.y)
    map:box2d_draw(screen.x, screen.y)
end

return {
    make=make_map,
    draw=draw_map
}
