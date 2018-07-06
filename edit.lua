obj = require "constructor"
	edit = {
		x1 = 0,
		x2 = 0,
		y1 = 0,
		y2 = 0,
		w1 = 0,
		w2 = 0,
		h1 = 0,
		h2 = 0,
	}

function editWall()
	edit.w1 = -(edit.x1 - edit.x2) 
	edit.h1 = -(edit.y1 - edit.y2) 
	u[#u+1] = obj.createWall(edit.x1, edit.y1, edit.w1, edit.h1)
end

function editHalfWall()
	
end