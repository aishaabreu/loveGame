function make_character( world )
    obj = {}
    obj.name="Character Name"
    obj.w, obj.h = 32, 64
    obj.body=love.physics.newBody( world, 1000, 1000, "dynamic" )
    obj.shape=love.physics.newRectangleShape( obj.w, obj.h )
    obj.fixture=love.physics.newFixture(obj.body, obj.shape, 1)
    obj._moves = {}
    obj.move = function(move)
        obj._moves[move] = true
    end
    return obj
end

function draw_character( obj, map, screen )
    draw_x, draw_y = screen.x + obj.body:getX(), screen.y + obj.body:getY()

    if obj.body:getX() < ((love.graphics.getWidth() / 2) - (obj.w /2)) then
        draw_x = obj.body:getX()
    elseif obj.body:getX() > (map.width * map.tilewidth) - ((love.graphics.getWidth() / 2) + (obj.w /2)) then
        draw_x = love.graphics.getWidth() - ((map.width * map.tilewidth) - obj.body:getX())
    end

    if obj.body:getY() < ((love.graphics.getHeight() / 2) - (obj.h /2 )) then
        draw_y = obj.body:getY()
    elseif obj.body:getY() > (map.height * map.tileheight) - ((love.graphics.getHeight() / 2) + (obj.h /2 )) then
        draw_y = love.graphics.getHeight() - ((map.height * map.tileheight) - obj.body:getY())
    end

    love.graphics.rectangle("fill", draw_x, draw_y, obj.w, obj.h, 6, 6, 20)
    love.graphics.printf( obj.name, draw_x -5, draw_y - 20, obj.w + 10, 'center')
end

return {
    make=make_character,
    draw=draw_character
}