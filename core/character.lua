cmd = require "core/commands"
utils = require "core/utils"

function make_pc(name)
    return {
        x=300,
        y=300,
        speed=240,
        width=35,
        height=60,
        name=name or 'Nome do Personagem',
        moving=nil,
    }
end

function debug_move(pc, utils, prints)
    utils.print(string.format('X: %s', pc.x + (pc.width / 2)), prints)
    utils.print(string.format('Y: %s', pc.y + pc.height), prints)
    if pc.moving then
        utils.print(string.format('Moving X %s', pc.moving.x), prints)
        utils.print(string.format('Moving Y: %s', pc.moving.y), prints)
    end
end

function draw_pc(pc)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", pc.x, pc.y, pc.width, pc.height, 6, 6, 20)
    love.graphics.printf(pc.name, pc.x -5, pc.y - 20, pc.width + 10, 'center')
end

function move_pc(dt, pc)
    local pc_move = pc.speed * dt

    if love.keyboard.isDown('left', 'a') then
        cmd.left(pc, pc_move)
        pc.moving = nil
    elseif love.keyboard.isDown('right', 'd') then
        cmd.right(pc, pc_move)
        pc.moving = nil
    end

    if love.keyboard.isDown('up', 'w') then
        cmd.up(pc, pc_move)
        pc.moving = nil
    elseif love.keyboard.isDown('down', 's') then
        cmd.down(pc, pc_move)
        pc.moving = nil
    end

    if love.mouse.isDown(1) then
        pc.moving = {
            x=love.mouse.getX(),
            y=love.mouse.getY(),
        }
    end

    local touches = love.touch.getTouches()
    if table.getn(touches) > 0 then
        local touch_x, touch_y = love.touch.getPosition(touches[0] or touches[1])
        pc.moving = {
            x=touch_x,
            y=touch_y,
        }
    end

    if pc.moving then
        local pc_x = pc.x + (pc.width / 2)
        local pc_y = pc.y + pc.height
        local max_x = cmd.get_max(pc_move, pc.moving.x, pc.moving.y, pc.x, pc.y)
        local max_y = cmd.get_max(pc_move, pc.moving.y, pc.moving.x, pc.y, pc.x)

        if pc.moving.x < pc_x then
            cmd.left(pc, cmd.get_move((pc.moving.x + pc_x), max_x))
        elseif pc.moving.x > pc_x then
            cmd.right(pc, cmd.get_move((pc.moving.x - pc_x), max_x))
        end

        if pc.moving.y < pc_y then
            cmd.up(pc, cmd.get_move((pc.moving.y + pc_y), max_y))
        elseif pc.moving.y > pc_y then
            cmd.down(pc, cmd.get_move((pc.moving.y - pc_y), max_y))
        end

        if (pc.moving.x == pc_x and pc.moving.y == pc_y ) then
            pc.moving = nil
        end
    end
end

return {
    make = make_pc,
    draw = draw_pc,
    move = move_pc,
    debug = debug_move,
}
