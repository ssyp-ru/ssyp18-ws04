obj = require "constructor"
	edit = {
		x1 = 0,
		x2 = 0,
		y1 = 0,
		y2 = 0,
	}

function editWall()
	edit.w = -(edit.x1 - edit.x2) 
	edit.h = -(edit.y1 - edit.y2) 
	u[#u+1] = obj.createWall(edit.x1, edit.y1, edit.w, edit.h)
end