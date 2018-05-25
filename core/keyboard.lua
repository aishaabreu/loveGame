function asign_key(scene, keys, call)
    if not scene._keyboard_commands then
        scene._keyboard_commands = {}
    end
    table.insert(scene._keyboard_commands, {keys=keys, call=call})
end

function call_keys(scene)
    for i, command in ipairs(scene._keyboard_commands) do
        if love.keyboard.isDown(unpack(command.keys)) then
            command.call()
        end
    end
end

return {
    asign=asign_key,
    call=call_keys
}