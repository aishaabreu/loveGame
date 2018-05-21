function left( obj, move, min )
    local to = obj.body:getX() - move
    if to > min then
        obj.body:setX(to)
    else
        obj.body:setX(min)
    end
end

function right( obj, move, max )
    local to = obj.body:getX() + move
    if to < max then
        obj.body:setX(to)
    else
        obj.body:setX(max)
    end
end

function up( obj, move, min )
    local to = obj.body:getY() - move
    if to > min then
        obj.body:setY(to)
    else
        obj.body:setY(min)
    end
end

function down( obj, move, max )
    local to = obj.body:getY() + move
    if to < max then
        obj.body:setY(to)
    else
        obj.body:setY(max)
    end
end

function screen_follow( obj, map, screen )
    screen.x = - (obj.body:getX() - ((love.graphics.getWidth() / 2) - (obj.w /2)))
    screen.y = - (obj.body:getY() - ((love.graphics.getHeight() / 2) - (obj.h /2 )))
end

function move_obj( dt, obj, map )
    for i, value in ipairs(obj._moves) do
        if value == 'left' then
            left(obj, dt * 250, 0)
        elseif value == 'right' then
            right(obj, dt * 250, (map.width * map.tilewidth) - obj.w )
        elseif value == 'up' then
            up(obj, dt * 250, 0)
        elseif value == 'down' then
            down(obj, dt * 250, (map.height * map.tileheight) - obj.h )
        end
    end
    obj._moves = {}
end

return {
    move=move_obj,
    follow=screen_follow
}