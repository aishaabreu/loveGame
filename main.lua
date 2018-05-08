local character = require "core/character"
local maps = require "core/maps"
local commands = require "core/commands"
local interface = require "core/interface"

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
    function action()
        player.name = 'olatI'
    end
    function action2()
        player.name = 'Italo'
    end
    button_up = interface.make("UP", {'r'}, action, {x=100, y=100}, {w=100, h=100})
    button_up2 = interface.make("DOWN", {'e'}, action2, {x=210, y=100}, {w=100, h=100})
end

function love.update( dt )
    commands.move( dt, player, map )
    commands.follow( player, map, screen )
    button_up.call()
    button_up2.call()
end

function love.draw()
    maps.draw( map, screen )
    character.draw( player, map, screen )
    button_up.draw()
    button_up2.draw()
end