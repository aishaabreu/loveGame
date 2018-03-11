local character = require 'core/character'
local sti = require "plugins/sti"

local player
local world
local map

function love.load(arg)
    player = character.make()
    player.name = "Tedy"

    world = love.physics.newWorld(0, 0)
    map = sti("maps/map.lua", { "box2d" })
    map:box2d_init(world)
end

function love.draw()
    map:draw(0, 0)
    map:box2d_draw(0, 0)
    character.move(player)
    character.draw(player)
end
