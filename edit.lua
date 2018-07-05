obj = require "constructor"
edit = {
	x1 = 0,x2 = 0,x3 = 0,
	y1 = 0,y2 = 0,y3 = 0
}

function editWall()
	edit.w = -(edit.x1 - edit.x2) 
	edit.h = -(edit.y1 - edit.y2) 
	u[#u+1] = obj.createWall(edit.x1, edit.y1, edit.w, edit.h)
end
function editDrawWall()
	mX,mY = love.mouse.getX(), love.mouse.getY()
	mX,mY = cam:toWorld(mX,mY)
	love.graphics.setColor (141, 107, 33)
	love.graphics.rectangle ("line",edit.x1, edit.y1, -(edit.x1 - mX), -(edit.y1 - mY))
end