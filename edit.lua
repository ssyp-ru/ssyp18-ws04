obj = require "constructor"

cam = require "gamera"
logging = require "logging"
edit = {
	x1 = 0,x2 = 0,
	y1 = 0,y2 = 0
}
local function load_editor()
	local state = "Wall"
end
local function full_editor()
	if love.keyboard.isDown("1") then
		state = "Wall"
	end
	if love.keyboard.isDown("2") then
		state = "Thief"
	end
	if love.keyboard.isDown("3") then
		state = "Animal"
	end
	if love.keyboard.isDown("4") then
		state = "Movement"
	end
end
local function editMovement()
	edit.w = -(edit.x1 - edit.x2)
	edit.h = -(edit.y1 - edit.y2)
	u[#u+1] = obj.createMovement(edit.x1, edit.y1, edit.w, edit.h)
	logging.init(u)
end
local function editWall()
	edit.w = -(edit.x1 - edit.x2)
	edit.h = -(edit.y1 - edit.y2)
	u[#u+1] = obj.createWall(edit.x1, edit.y1, edit.w, edit.h)
end
local function editThief(x,y)
	u[#u+1] = obj.createThief(x,y, 15)
end
local function editAnimal(x,y) 
	u[#u+1] = obj.createAnimal(x,y, 10)
end
local function editDrawWall()
	mX,mY = love.mouse.getX(), love.mouse.getY()
	mX,mY = cam:toWorld(mX,mY)
	love.graphics.setColor (141, 107, 33)
	love.graphics.rectangle ("line",edit.x1, edit.y1, -(edit.x1 - mX), -(edit.y1 - mY))
end
local function editDrawMovement()
	mX,mY = love.mouse.getX(), love.mouse.getY()
	mX,mY = cam:toWorld(mX,mY)
	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("line",edit.x1, edit.y1, -(edit.x1 - mX), -(edit.y1 - mY))
end
local function editDrawAnimal()
	mx,my = cam:toWorld(love.mouse.getX(),love.mouse.getY())
	love.graphics.setColor(125,125,125)
	love.graphics.circle("line",mx, my, 10)
end

local function editDrawThief()
	mx,my = cam:toWorld(love.mouse.getX(),love.mouse.getY())
	love.graphics.setColor(0,0,0)
	love.graphics.circle("line",mx, my, 15)
end
local function editDraw()
	if state == "Wall" then
		if love.mouse.isDown(2) then
			editDrawWall()
		end
	elseif state == "Thief" then
		editDrawThief()
	elseif state == "Animal" then
		editDrawAnimal()
	elseif state == "Movement" then
		if love.mouse.isDown(2) then
			editDrawMovement()
		end
	end
end
function love.mousepressed(mX, mY, button, isTouch)
	if button == 1 then
		gx, gy = cam:toWorld(mX,mY)
	end
	if button == 2 then
		mX,mY = cam:toWorld(mX,mY)
		if state == "Wall" then
			edit.x1 = mX
			edit.y1 = mY
		elseif state == "Thief" then
			editThief(mX,mY)
		elseif state == "Animal" then
			editAnimal(mX,mY)
		elseif state == "Movement" then
			edit.x1 = mX
			edit.y1 = mY
		end
	end
end
function love.mousereleased(mX, mY, button)
	if button == 2 then
		mX,mY = cam:toWorld(mX,mY)
		edit.x2 = mX
		edit.y2 = mY
		if state == "Wall" then
			editWall()
		elseif state == "Movement" then
			editMovement()
		end
	end
end
return {full_editor = full_editor, editWall = editWall, editDrawWall = editDrawWall,state = state,
	load_editor = load_editor,editDraw = editDraw}