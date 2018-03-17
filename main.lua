local world = require 'core/world'
local utils = require 'core/utils'

local prints = {}

function love.load(arg)
    world.make()
end

function love.update(dt)
    world.update(dt, utils, prints)
end

function love.draw()
    world.draw()
    utils.draw(prints)
    prints = {}
end
