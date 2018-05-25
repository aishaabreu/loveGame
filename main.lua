local scene = require "core/scene"
local game = require "game/game"
local database = {}

function love.load()
    love.window.setMode( 1024, 600, {fullscreen=false} )
    game.start( database )
    scene.load()
end

function love.update( dt )
    scene.update( dt )
end

function love.draw()
    scene.draw()
end