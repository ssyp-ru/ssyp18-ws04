constructor = require "constructor"
control = require "control"
camera = require "gamera"
function love.load()
	cam = camera.new(0,0,2000,2000)
	cam:setWindow(0,0, 1366,768)

	editor = {}
	maxid = 0
	math.randomseed(os.time())
	units = {}
	units[1] = constructor.createWall(100, 100, 10, 50)
	units[2] = constructor.createAnimal(600,600,15)
	units[3] = constructor.createMovement(300,300)
	units[4] = constructor.createThief(500,500, 10)
	love.graphics.setBackgroundColor{255,255,255}
end
function love.draw()
	cam:draw(function(l,t,w,h)
		for i = 1,#units do
			units[i]:draw()
		end
	end)
end
	function love.update(dt)
		cam:setPosition(units[4].x,units[4].y)
		units[4]:update(units,dt)
		if love.keyboard.isDown("escape") then
			love.event.quit()
		end

	end
	function love.mousepressed(x, y, button, isTouch)  
		editor.x1 = x
		editor.y1 = y
	end
	function love.mousereleased(x, y, button, isTouch)
		editor.x2 = x
		editor.y2 = y
	end