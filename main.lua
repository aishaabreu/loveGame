character = require 'character'

function love.load(arg)
    player = character.make()
    player.name = "Tedy"
end

function love.draw()
    character.move(player)
    character.draw(player)
end
