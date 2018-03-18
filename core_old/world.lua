local character = require 'core_old/character'
local maps = require 'core_old/maps'

local player
local world
local map
local screen

function make_world()
    player = character.make("Tedy")
    world = love.physics.newWorld(0, 0)
    map = maps.make("maps/map.lua", world)
    screen = {x=0, y=0}
end

function world_update(dt, utils, prints)
    utils.print("Current FPS: "..tostring(love.timer.getFPS()), prints)
    character.move(dt, player)
    character.debug(player, utils, prints)
    utils.print(map.width * map.tilewidth, prints)
    utils.print(map.height * map.tileheight, prints)
end

function draw_world(utils, prints)
    maps.draw(map, screen)
    character.draw(player)
end

return {
    make=make_world,
    draw=draw_world,
    update=world_update,
}