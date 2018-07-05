brAnimal = require "brainAnimal"
units = require "unit"
obj = require "constructor"
tf = require "control"
drwUnit = require "drawUnits"
camera = require "gamera"
require "edit"

local time = 7
local time1 = 20
local anX = 700
local anY = 750

x = 1300
y = 300

function love.load()
	cam = camera.new( 0, 0, 2000,2000)
	cam:setWindow(0,0,love.graphics.getWidth(),love.graphics.getHeight())
	maxid = 0
	--love.window.setMode(1366, 768, {})
	u = {}
	for i = 1, 15 do
		if i == 1 then
			u[#u+1] = units.createWall(300, 200, 20, 360)
		elseif i == 2 then
			u[#u+1] = units.createWall(i * 500, 200, 20, 380)
		elseif i == 3 then
			u[#u+1] = units.createWall(300, 180, 720, 20)
		elseif i == 4 then
			u[#u+1] = units.createWall(300, 560, 620, 20)
		elseif i == 5 then
			u[#u+1] = obj.createThief (x, y, 15)
		elseif i == 6 then
			u[#u+1] = obj.createAnimal (anX,anY,10)
		elseif i == 7 then
			u[#u+1] = obj.createMovement (300, 20, 900, 160)
		elseif i == 8 then
			u[#u+1] = obj.createNoise (320, 200, 680, 360)
		elseif i == 9 then
			u[#u+1] = obj.createLight (974, 200)
		elseif i == 10 then
			u[#u+1] = obj.createDoor (920, 555, 25, 25)
		elseif i == 11 then
			u[#u+1] = units.createWall(100, 20, 20, 670)
		elseif i == 12 then
			u[#u+1] = units.createWall(100, 0, 1100, 20)
		elseif i == 13 then
			u[#u+1] = units.createWall(250, 670, 970, 20)
		elseif i == 14 then
			u[#u+1] = units.createWall(1200, 0, 20, 670)
		elseif i == 15 then
			u[#u+1] = obj.createMovement (120, 20, 180, 650)
		end
	end
	love.graphics.setBackgroundColor{255,255,255}
	i = 255
end

function love.draw()
	cam:draw(function(l,t,w,h)
			for i = 1,#u do
				u[i]:draw()
			end
		end)
end

function love.update(dt)
	cam:setPosition(u[5].x,u[5].y)
	for i = 1, #u do 
		if u[i].update then
			u[i]:update(dt)
		end
	end
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

function love.mousepressed(mX, mY, button, isTouch)
	if button == 2 then
		mX,mY = cam:toWorld(mX,mY)
		edit.x1 = mX
		edit.y1 = mY
	end
end
function love.mousereleased(mX, mY, button)
	if button == 2 then
		mX,mY = cam:toWorld(mX,mY)
		edit.x2 = mX
		edit.y2 = mY
		editWall()
	end
end