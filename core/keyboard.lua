local commands = {}

function asign_key(keys, call)
    table.insert(commands, {keys=keys, call=call})
end

function call_keys()
    for i, command in ipairs(commands) do
        if love.keyboard.isDown(unpack(command.keys)) then
            command.call()
        end
    end
end

return {
    asign=asign_key,
    call=call_keys
}