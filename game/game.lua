local scene = require "core/scene"
local map = require "game/scenes/map"
local conf = require "game/scenes/conf"
local keyboard = require "core/keyboard"

function start( database )
    local map = scene.make( '0-map', map.load, map.update, map.draw )
    local conf = scene.make( '1-conf', conf.load, conf.update, conf.draw)

    keyboard.asign( map, {'q'}, function()
        if map.delay <= 0 then
            conf.active = true
            conf.focus(0.1)
        end
    end )

    keyboard.asign( conf, {'q'}, function()
        if conf.delay <= 0 then
            map.focus(0.1)
            conf.active = false
        end
    end )
    map.focus()
    map.active = true
    map.database = database
end

return {
    start=start
}
