local character = require "core/character"
local maps = require "core/maps"
local commands = require "core/commands"

local world = love.physics.newWorld( 0, 0, true )
local player
local map
local screen

function love.load()
    love.window.setMode( 1024, 600, {fullscreen=false} )
    map = maps.make( 'maps/map.lua', world )
    player = character.make( world )
    screen = {x=0, y=0}
end

function love.update( dt )
    commands.follow( player, map, screen )
    commands.move( player, map )
end

function love.draw()
    maps.draw( map, screen )
    character.draw( player, map, screen )
end