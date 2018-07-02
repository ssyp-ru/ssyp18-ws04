constructor = require "constructor" 
function love.mousepressed( x, y, button, isTouch )  
		if isTouch == true and button == 1 then
			return x1, y1
		end 	
	end
function love.mousereleased( x, y2, button, isTouch )
	if isTouch == true and button == 1 then 
		return x2, y2
end
end
local function makeWall() 
	local x1, y1 = 0,0
	local x2, y2 = 0,0
	x1, y1 = love.mousepressed()
	x2, y2 = love.mousereleased()
	local w = x1 - x2
	local h = y1 - y2
	maxid = maxid + 1
	units[maxid] = constructor.createWall(x1, y1, w, h)
end
return {makeWall = makeWall}