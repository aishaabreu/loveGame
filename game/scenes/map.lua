local character = require "core/character"
local maps = require "core/maps"
local moves = require "core/moves"
local interface = require "core/interface"
local keyboard = require "core/keyboard"
local scene = require "core/scene"

function load_map( scene )
    scene.database.world = love.physics.newWorld( 0, 0, true )
    scene.database.map = maps.make( 'maps/map.lua', scene.database.world )
    scene.database.player = character.make( scene.database.world )
    scene.database.player.name = 'Italo'
    scene.database.screen = {x=0, y=0}
    scene.loaded = true

    keyboard.asign(scene, {'up', 'w'}, function() scene.database.player.move('up') end)
    keyboard.asign(scene, {'left', 'a'}, function() scene.database.player.move('left') end)
    keyboard.asign(scene, {'right', 'd'}, function() scene.database.player.move('right') end)
    keyboard.asign(scene, {'down', 's'}, function() scene.database.player.move('down') end)

    interface.make(scene, function() scene.database.player.move('up') end, {x=55, y=500}, {w=30, h=30})
    interface.make(scene, function() scene.database.player.move('left') end, {x=20, y=535}, {w=30, h=30})
    interface.make(scene, function() scene.database.player.move('right') end, {x=90, y=535}, {w=30, h=30})
    interface.make(scene, function() scene.database.player.move('down') end, {x=55, y=535}, {w=30, h=30})
end

function update_map( dt, scene )
    moves.move( dt, scene.database.player, scene.database.map )
    moves.follow( scene.database.player, scene.database.map, scene.database.screen )
    keyboard.call( scene )
    interface.call( scene )
end

function draw_map( scene )
    maps.draw( scene.database.map, scene.database.screen )
    character.draw( scene.database.player, scene.database.map, scene.database.screen )
    interface.draw( scene )
end

return {
    load=load_map,
    update=update_map,
    draw=draw_map
}