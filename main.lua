local client = require "client"
function love.load(arg)
	if arg[#arg] == "-debug" then require("mobdebug").start() end
	sprtree1 = love.graphics.newImage("res/tree1.png")
	sprtree2 = love.graphics.newImage("res/krovat.png")
	sprtree3 = love.graphics.newImage("res/freezer.png")
	sprtree4 = love.graphics.newImage("res/stol.png")
	menu = require 'leftmenu'
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

	totalDanger = 0
	local anX = 700 -- начальная точка спавна животного
	local anY = 750
	local x = 1300  -- точка спавна вора
	local y = 300
	local flag = false
	editor.load_editor()
	editor.load_editor()
	cam = camera.new(0, 0, 4000, 4000)
--    sucsess = love.window.setFullscreen(true)
	cam:setWindow(0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	maxid = 0
	love.graphics.setBackgroundColor { 255, 255, 255 }
	--		u=file.rabota("save.txt", {})
	u = {}
	u[#u + 1] = obj.createWall(300, 200, 20, 360)
	u[#u + 1] = obj.createWall(1000, 200, 20, 380)
	u[#u + 1] = obj.createWall(300, 180, 720, 20)
	u[#u + 1] = obj.createWall(300, 560, 620, 20)
	u[#u + 1] = obj.createThief(x, y, 15)
	u[#u + 1] = obj.createAnimal(anX, anY, 10)
	u[#u + 1] = obj.createMovement(300, 20, 900, 160)
	u[#u + 1] = obj.createLazer(974, 200, 1, 200)
	u[#u + 1] = obj.createDoor(920, 555, 85, 25)
	u[#u + 1] = obj.createWall(100, 20, 20, 670)
	u[#u + 1] = obj.createWall(100, 0, 1100, 20)
	u[#u + 1] = obj.createWall(250, 670, 970, 20)
	u[#u + 1] = obj.createWall(1200, 0, 20, 670)
	u[#u + 1] = obj.createMovement(120, 20, 180, 650)
	u[#u + 1] = obj.createTree(1500, 800, 30)
	u[#u + 1] = obj.createBed(150, 800)
	u[#u + 1] = obj.createFridge(50, 800)
	u[#u + 1] = obj.createDesk(1500, 500)
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
	drwUnit.dangerIndicator(love.graphics.getWidth() - 70, love.graphics.getHeight() - 20)
--    mX, mY = love.mouse.getX(), love.mouse.getY()

	love.graphics.setColor(255, 0, 0)
	menu:drawAll()
end

function love.update(dt)
	if flag then
		client.update(dt)
	end

	totalDanger = 0
	if edit.x3 == edit.x4 and edit.y3 == edit.y4 then
		scale = 1
		edit.x4 = 6000
	end

	if love.keyboard.isDown("c") then
		flag = true
		client.start()
	end
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
	if scale > 1.5 then
		scale = 1.5
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