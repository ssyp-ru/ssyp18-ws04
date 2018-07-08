menu = require 'menu'
brAnimal = require "brainAnimal"
obj = require "constructor"
tf = require "control"
logging = require 'logging'
drwUnit = require "drawUnits"
camera = require 'gamera'
editor = require "edit"
file = require "file"
json = require "json"
mc = require "movecam"
success = love.window.setFullscreen(true)
scale = 1
local time = 7
local time1 = 20
local anX = 700
local anY = 750
x = 1300
y = 300
sost = 0
function love.load(arg)
	if arg[#arg] == "-debug" then require("mobdebug").start() end
	editor.load_editor()
	cam = camera.new(0, 0, 5000, 5000)
	cam:setWindow(0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	maxid = 0
	love.graphics.setBackgroundColor { 255, 255, 255 }
	u = file.rabota("save.txt", {})
	--		u={}
	--	for i = 1, 14 do
	--		if i == 1 then
	--			u[#u+1] = obj.createWall(300, 200, 20, 360)
	--		elseif i == 2 then
	--			u[#u+1] = obj.createWall(i * 500, 200, 20, 380)
	--		elseif i == 3 then
	--			u[#u+1] = obj.createWall(300, 180, 720, 20)
	--		elseif i == 4 then
	--			u[#u+1] = obj.createWall(300, 560, 620, 20)
	--		elseif i == 5 then
	--			u[#u+1] = obj.createThief (x, y, 15)
	--		elseif i == 6 then
	--			u[#u+1] = obj.createAnimal (anX,anY,10)
	--		elseif i == 7 then
	--			u[#u+1] = obj.createMovement (300, 20, 900, 160)
	--		elseif i == 8 then
	--			u[#u+1] = obj.createLazer (974, 200,1,200)
	--		elseif i == 9 then
	--			u[#u+1] = obj.createDoor (920, 555, 85, 25)
	--		elseif i == 10 then
	--			u[#u+1] = obj.createWall(100, 20, 20, 670)
	--		elseif i == 11 then
	--			u[#u+1] = obj.createWall(100, 0, 1100, 20)
	--		elseif i == 12 then
	--			u[#u+1] = obj.createWall(250, 670, 970, 20)
	--		elseif i == 13 then
	--			u[#u+1] = obj.createWall(1200, 0, 20, 670)
	--		elseif i == 14 then
	--			u[#u+1] = obj.createMovement (120, 20, 180, 650)
	--		end
	--	end
	--obj.createLazer(974,200,1,200)
	love.graphics.setBackgroundColor { 255, 255, 255 }
	logging.init(u)
end

function love.draw()
	cam:draw(function(l, t, w, h)
			for i = 1, #u do
				u[i]:draw()
			end
			editor.editDraw()
		end)
	mX, mY = love.mouse.getX(), love.mouse.getY()
	love.graphics.setColor(255, 0, 0)
	menu:drawAll()
end

function love.update(dt)
	if edit.x3 == edit.x4 and edit.y3 == edit.y4 then
		scale = 1
		edit.x4 = 6000
	end
	editor.full_editor()
	cam:setScale(scale)
	mc.moveCamera(cam, dt) -- двигать камеру мышкой по краям экрана
	for i = 1, #u do
		if u[i].update then
			u[i]:update(dt)
		end
	end
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	logging.updateLog(dt)
	down = love.mouse.isDown(1)
	menu.check(dt)
end

function love.wheelmoved(x, y)
	if scale > 2 then
		scale = 2
	elseif scale < 0.5 then
		scale = 0.5
	end
	if y > 0 then
		scale = scale + 0.05
	end
	if y < 0 then
		scale = scale - 0.05
	end
end