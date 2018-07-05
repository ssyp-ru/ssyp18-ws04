obj = require "constructor"
	edit = {
		x1 = 0,
		x2 = 0,
		y1 = 0,
		y2 = 0,
	}
function love.mousereleased( x, y, button)

	if button == 1 then
		edit.x2 = x
		edit.y2 = y
		print(x,y)
	end
end

function editWall(x,y)
	edit.x1 = x
	edit.y1 = y
	edit.h = edit.x1 - edit.x2 
	edit.w = edit.y1 - edit.y2 
	u[#u+1] = obj.createWall(edit.x1, edit.y1, edit.h, edit.w)
end