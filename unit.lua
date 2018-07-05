drawUnits = require "drawUnits"
local function createWall(x1,y1,w1,h1)
	maxid = maxid + 1
	local t = {
		x = x1, y = y1,
		angle = 0,
		kind = "wall",
		subKind = " ",
		id = maxid,
		w = w1, h = h1, r = 0,
		name = "wall"..maxid,
		update = wall_update,
		draw = drawUnits.wall
	}
	return t
end
local function wall_update(dt)
end
return {createWall = createWall}