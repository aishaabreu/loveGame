local character = require "core/character"
local maps = require "core/maps"
local moves = require "core/moves"
local interface = require "core/interface"
local keyboard = require "core/keyboard"

local world = love.physics.newWorld( 0, 0, true )
local player
local map
local screen

function love.load()
    love.window.setMode( 1024, 600, {fullscreen=false} )
    map = maps.make( 'maps/map.lua', world )
    player = character.make( world )
    player.name = 'Italo'
    screen = {x=0, y=0}

    keyboard.asign({'up', 'w'}, function() player.move('up') end)
    keyboard.asign({'left', 'a'}, function() player.move('left') end)
    keyboard.asign({'right', 'd'}, function() player.move('right') end)
    keyboard.asign({'down', 's'}, function() player.move('down') end)

    interface.make(function() player.move('up') end, {x=55, y=500}, {w=30, h=30})
    interface.make(function() player.move('left') end, {x=20, y=535}, {w=30, h=30})
    interface.make(function() player.move('right') end, {x=90, y=535}, {w=30, h=30})
    interface.make(function() player.move('down') end, {x=55, y=535}, {w=30, h=30})
end

function love.update( dt )
    moves.move( dt, player, map )
    moves.follow( player, map, screen )
    keyboard.call()
    interface.call()
end

function love.draw()
    maps.draw( map, screen )
    character.draw( player, map, screen )
    interface.draw()
end