cmd = require "commands"

function make_pc()
    return {
        x=300,
        y=300,
        move=5,
        width=35,
        height=60,
        name='Nome do Personagem',
        moving=nil,
    }
end

function debug_move(pc)
    love.graphics.print('X:', 10, 20)
    love.graphics.print(pc.x + math.floor(pc.width / 2), 30, 20)
    love.graphics.print('Y:', 10, 40)
    love.graphics.print(pc.y + pc.height, 30, 40)
    love.graphics.print('Moving X:', 10, 60)
    love.graphics.print('Moving Y:', 10, 80)
    if pc.moving then
        love.graphics.print(pc.moving.x, 80, 60)
        love.graphics.print(pc.moving.y, 80, 80)
    end
end

function draw_pc(pc)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", pc.x, pc.y, pc.width, pc.height, 6, 6, 20)
    love.graphics.printf(pc.name, pc.x -5, pc.y - 20, pc.width + 10, 'center')
    debug_move(pc)
end

function move_pc(pc)
    if love.keyboard.isDown('left', 'a') then
        cmd.left(pc, pc.move)
        pc.moving = nil
    elseif love.keyboard.isDown('right', 'd') then
        cmd.right(pc, pc.move)
        pc.moving = nil
    end

    if love.keyboard.isDown('up', 'w') then
        cmd.up(pc, pc.move)
        pc.moving = nil
    elseif love.keyboard.isDown('down', 's') then
        cmd.down(pc, pc.move)
        pc.moving = nil
    end

    if love.mouse.isDown(1) then
        pc.moving = {
            x=love.mouse.getX(),
            y=love.mouse.getY(),
        }
    end

    if pc.moving then
        local pc_x = pc.x + math.floor(pc.width / 2)
        local pc_y = pc.y + pc.height
        local max_x = cmd.get_max(pc.move, pc.moving.x, pc.moving.y, pc.x, pc.y)
        local max_y = cmd.get_max(pc.move, pc.moving.y, pc.moving.x, pc.y, pc.x)

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
}
