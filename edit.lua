obj = require "constructor"
drawobj = require "drawUnits"
cam = require "gamera"
logging = require "logging"
coll = require "collision"
local angle = 1
edit = {
	x1 = 0,x2 = 0,x3 = 0, x4 = 0,
	y1 = 0,y2 = 0,y3 = 0, y4 = 0
}
local function load_editor()
	local state = "Point"
end

local function editDelete()
	mx,my = cam:toWorld(love.mouse.getX(),love.mouse.getY())
	local t = {
		r = 1,
		x = mx,
		y = my,
		kind = "human"
	}
	if love.mouse.isDown(2) then
		for i = 1, #u do
			if coll.obj2obj(t,u[i]) then
				table.remove(u,i)
				break
			end
		end
	end
end
local function editTree()
	u[#u+1] = obj.createTree(edit.x1 - 45,edit.y1 - 45)
end
local function editMovement()
	edit.w = -(edit.x1 - edit.x2)
	edit.h = -(edit.y1 - edit.y2)
	u[#u+1] = obj.createMovement(edit.x1, edit.y1, edit.w, edit.h)
	logging.init(u)
end
local function editDoor()
	edit.w = -(edit.x1 - edit.x2)
	edit.h = -(edit.y1 - edit.y2)
	u[#u+1] = obj.createDoor(edit.x1, edit.y1, edit.w, edit.h)
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
local function editDrawDoor()
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
local function editDrawDelete()
	mx,my = cam:toWorld(love.mouse.getX(),love.mouse.getY())
	love.graphics.setColor(255,0,0)
	love.graphics.line(mx - 20, my - 20,mx + 20, my + 20)
	love.graphics.line(mx + 20, my - 20,mx - 20, my + 20)
end
local function editDrawTree()
	mx,my = cam:toWorld(love.mouse.getX(),love.mouse.getY())
	love.graphics.setColor (255,255,255)
	love.graphics.draw(sprtree1, mx - 45, my - 45)
end
local function editDrawDesk()
	mx,my = cam:toWorld(love.mouse.getX(),love.mouse.getY())
	love.graphics.setColor (255,255,255)
	love.graphics.draw(sprtree4, mx - 35, my - 35)
end
local function editDrawFridge()
	mx,my = cam:toWorld(love.mouse.getX(),love.mouse.getY())
	love.graphics.setColor (255,255,255)
	love.graphics.draw(sprtree3, mx - 30, my - 30)
end
local function editDesk()
	mx,my = cam:toWorld(love.mouse.getX(),love.mouse.getY())
	u[#u+1] = obj.createDesk(edit.x1 - 35,edit.y1 - 35,angle)
end
local function editFridge()
	mx,my = cam:toWorld(love.mouse.getX(),love.mouse.getY())
	u[#u+1] = obj.createFridge(edit.x1 - 35,edit.y1 - 35,angle)
end
local function editDrawBed()
	mx,my = cam:toWorld(love.mouse.getX(),love.mouse.getY())
	love.graphics.setColor (255,255,255)
	love.graphics.draw(sprtree2, mx - 25, my - 65)
end
local function editBed()
	mx,my = cam:toWorld(love.mouse.getX(),love.mouse.getY())
	u[#u+1] = obj.createBed(edit.x1 - 25,edit.y1 - 65,angle)
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
	elseif state == "Door" then
		if love.mouse.isDown(2) then
			editDrawDoor()
		end
	elseif state == "Delete" then
		editDrawDelete()
	elseif state == "Tree" then
		editDrawTree()
	elseif state == "Desk" then
		editDrawDesk()
	elseif state == "Fridge" then
		editDrawFridge()
	elseif state == "Bed" then
		editDrawBed()
	end
end
function love.mousepressed(mX, mY, button, isTouch)
	if button == 1 then
		gx, gy = cam:toWorld(mX,mY)
	end
	if button == 2 then
		mX,mY = cam:toWorld(mX,mY)
		if state == "Wall" or state == "Movement" or state == "Door" then
			edit.x1 = mX
			edit.y1 = mY
		elseif state == "Thief" then
			editThief(mX,mY)
		elseif state == "Animal" then
			editAnimal(mX,mY)
		elseif state == "Delete" then
			editDelete()
		elseif state == "Tree" then
			edit.x1 = mX
			edit.y1 = mY
			editTree()
		elseif state == "Desk" then
			edit.x1 = mX
			edit.y1 = mY
			editDesk()
		elseif state == "Fridge" then
			edit.x1 = mX
			edit.y1 = mY
			editFridge()
		elseif state == "Bed" then
			edit.x1 = mX
			edit.y1 = mY
			editBed()
		end
		if button == 3 then
			mX,mY = cam:toWorld(mX,mY)
			edit.x3,edit.y3 = mX,mY
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
		elseif state == "Door" then
			editDoor()
		end
	end
	if button == 3 then
		mX,mY = cam:toWorld(mX,mY)
		edit.x4,edit.y4 = mX,mY
	end
end
return {editWall = editWall, editDrawWall = editDrawWall,
	load_editor = load_editor,editDraw = editDraw}