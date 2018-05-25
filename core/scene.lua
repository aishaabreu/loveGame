local scenes = {}

function make_scene( name, load, update, draw , background_update)
    scenes[name] = {}
    scenes[name].load = function( db )
        scenes[name].loaded = true
        load( db )
    end
    scenes[name].focus = function( delay )
        for i, sc in pairs( scenes ) do
            sc.on_focus = false
        end
        scenes[name].on_focus = true
        if delay then
            scenes[name].delay = delay
        end
    end
    scenes[name].draw = draw
    scenes[name].update = update
    scenes[name].background_update = background_update
    scenes[name].loaded = false
    scenes[name].active = false
    scenes[name].on_focus = false
    scenes[name].delay = 0
    return scenes[name]
end

function load_scenes()
    for name, sc in pairs( scenes ) do
        if not sc.loaded then
            sc.load( sc )
        end
    end
end

function update_scenes( dt )
    for name, sc in pairs( scenes ) do
        if sc.active and sc.background_update then
            sc.background_update( dt, sc )
        end
        if sc.active and sc.on_focus then
            if sc.delay <= 0 then
                sc.update( dt, sc )
            else
                print(sc.delay)
                sc.delay = sc.delay - dt
            end
        end
    end
end

function draw_scenes()
    for name, sc in pairs( scenes ) do
        if sc.active then
            sc.draw( sc )
        end
    end
end

return {
    make=make_scene,
    load=load_scenes,
    update=update_scenes,
    draw=draw_scenes,
    actives=actives_scenes
}