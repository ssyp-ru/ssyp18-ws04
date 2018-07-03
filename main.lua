obj = require "constructor"
tf = require "control"
drwUnit = require "drawUnits"
camera = require "gamera"
edt = require "edit"

function love.load()
	math.randomseed(os.time())
	maxid = 0
	local x = 1300
	local y = 300
	cam = camera.new( 0, 0, 2000,2000)
	cam:setWindow(0,0,love.graphics.getWidth(),love.graphics.getHeight())
	u = {}
	for i = 1, 15 do
		if i == 1 then
			u[#u+1] = obj.createWall(300, 200, 20, 360)
		elseif i == 2 then
			u[#u+1] = obj.createWall(i * 500, 200, 20, 380)
		elseif i == 3 then
			u[#u+1] = obj.createWall(300, 180, 720, 20)
		elseif i == 4 then
			u[#u+1] = obj.createWall(300, 560, 620, 20)
		elseif i == 5 then
			u[#u+1] = obj.createThief (x, y, 15)
		elseif i == 6 then
			u[#u+1] = obj.createAnimal (700,750,10)
		elseif i == 7 then
			u[#u+1] = obj.createMovement (300, 20, 900, 160)
		elseif i == 8 then
			u[#u+1] = obj.createNoise (320, 200, 680, 360)
		elseif i == 9 then
			u[#u+1] = obj.createLight (974, 200)
		elseif i == 10 then
			u[#u+1] = obj.createDoor (890, 535, 25, 25)
		elseif i == 11 then
			u[#u+1] = obj.createWall(100, 20, 20, 670)
		elseif i == 12 then
			u[#u+1] = obj.createWall(100, 0, 1100, 20)
		elseif i == 13 then
			u[#u+1] = obj.createWall(250, 670, 970, 20)
		elseif i == 14 then
			u[#u+1] = obj.createWall(1200, 0, 20, 670)
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
	u[5]:update(dt, u)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

function love.mousepressed( x, y, button, isTouch )
	editWall(x,y)
	print(x,y)
end