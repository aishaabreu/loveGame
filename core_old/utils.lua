return {
    print = function(val, prints)
        last = table.getn(prints) + 1
        table.insert(prints, {val=val, x=10, y =last * 13})
    end,
    draw = function(prints)
        for i, pt in ipairs(prints) do
            love.graphics.print(pt.val, pt.x, pt.y)
        end
    end,
}