function left(player, move)
    local to = player.x - move
    if to >= 0 then
        player.x = to
    end
end

function right(player, move)
    local to = player.x + move
    if to <= (love.graphics.getWidth() - player.width) then
        player.x = to
    end
end

function up(player, move)
    local to = player.y - move
    if to >= 0 then
        player.y = to
    end
end

function down(player, move)
    local to = player.y + move
    if to <= (love.graphics.getHeight() - player.height) then
        player.y = to
    end
end

function get_move(move, max)
    if move < max then
        return move
    end
    return max
end

function get_max(max, to_move, to_compare, from_move, from_compare)
    local move_route = math.abs(from_move - to_move)
    local compare_route = math.abs(from_compare - to_compare)
    if move_route < compare_route and (compare_route > max) then
        local move = move_route / (compare_route / max)
        if move < 1 then
            return max
        end
        return move
    end
    return max
end

return {
    left = left,
    right = right,
    up = up,
    down = down,
    get_move = get_move,
    get_max = get_max
}
