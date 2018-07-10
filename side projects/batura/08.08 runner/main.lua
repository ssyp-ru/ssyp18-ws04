-- Батура Дмитрий
-- РАННЕР
math.randomseed(os.time())
lg = love.graphics

local function randomCar(drugoix)
	local x
	local z
	repeat
		z=math.random(1,3)
		if z==1 then
			x=200
		elseif z==2 then
			x=360
		else
			x=520
		end
	until drugoix ~= x
	return x
end

-- Collision detection function;
-- Returns true if two boxes overlap, false if they don't;
-- x1,y1 are the top-left coords of the first box, while w1,h1 are its width and height;
-- x2,y2,w2 & h2 are the same, but for the second box.
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 < x2+w2 and
	x2 < x1+w1 and
	y1 < y2+h2 and
	y2 < y1+h1
end

function love.load()
	gameover = false

	tree1 = love.graphics.newImage( "tree1.png")
	tree2 = love.graphics.newImage( "tree2.png")
	tree3 = love.graphics.newImage( "tree3.png")
	heroCar = lg.newImage("heroCar.png")
	enemyCar1 = lg.newImage("enemyCar1.png")
	enemyCar2 = lg.newImage("enemyCar2.png")

	time=0

	xhero = randomCar(0)
	yhero = 400
	speedhero = 200
	shirhero= 85
	dlinahero = 105
	xenemy1 = randomCar(xhero)
	yenemy1 = 10
	speedenemy1 = 500
	shirenemy1 = 90
	dlinaenemy1 = 170
	xenemy2 = randomCar(xenemy1)
	yenemy2 = 10
	speedenemy2 = 100
	shirenemy2 = 90
	dlinaenemy2 = 120
	-- деревья
	xtree1 = 80
	ytree1 = 0
	xtree2 = 80
	ytree2 = 200
	xtree3 = 80
	ytree3 = 400
	speedtree = 1000
end
function love.draw()

	lg.setColor(13,161,25)
	lg.rectangle("fill",0,0,160,600)
	lg.setColor(13,161,25)
	lg.rectangle("fill",640,0,800,600)
	lg.setColor(93,106,98)
	lg.rectangle("fill",160,0,640,600)
	lg.setColor(13,161,25)
	lg.rectangle("fill",640,0,800,600)
	lg.setColor(255,255,255)
	lg.line(320,0,320,600)
	lg.setColor(255,255,255)
	lg.line(480,0,480,600)

	lg.setColor(255,255,255)
	lg.draw(heroCar, xhero, yhero, 0, 6)
	lg.draw(enemyCar1, xenemy1, yenemy1, 0, 8)
	lg.draw(enemyCar2, xenemy2, yenemy2, 0, 10)
	lg.draw(tree1, xtree1, ytree1, 0, 4)
	lg.draw(tree2, xtree2, ytree2, 0, 4)
	lg.draw(tree3, xtree3, ytree3, 0, 4)
	lg.print("TIME LEFT "..time,440,20, 0, 4)

--	lg.rectangle("line", xenemy1, yenemy1, shirenemy1, dlinaenemy1 )
--	lg.rectangle("line", xenemy2, yenemy2, shirenemy2, dlinaenemy2 )
--	lg.rectangle("line", xhero, yhero, shirhero, dlinahero )
	if gameover then
		lg.setColor(0,0,0,100)
		lg.print("game over ",310,310, 0, 4)
		lg.setColor(255,255,255)
		lg.print("game over ",300,300, 0, 4)
	end
end

local function randomTreeX()
	local x
	-- дерево будет справа или слева
	if math.random(1, 2) == 2 then
		-- координаты слева
		x =  math.random(5, 110)
	else
		-- координаты справа
		x = math.random(640, 745)
	end
	return x
end

function love.update(dt)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	if not gameover then
		time = time + dt

		if love.keyboard.isDown("left") then
			xhero= xhero - dt*speedhero
		end
		if love.keyboard.isDown("right") then
			xhero= xhero + dt*speedhero
		end
		if love.keyboard.isDown("up") then
			yhero= yhero - dt*speedhero
		end
		if love.keyboard.isDown("down") then
			yhero= yhero + dt*speedhero
		end
		if xhero <160 then
			xhero=xhero+speedhero   *dt
		end
		if xhero >540 then
			xhero=xhero-speedhero   *dt
		end
		if yhero <0 then
			yhero=yhero+speedhero   *dt
		end
		if yhero >460 then
			yhero=yhero-speedhero   *dt
		end
		-- ВРАГИ МАШИНЫ
		yenemy1=yenemy1+speedenemy1*dt
		if yenemy1 > 600 then
			yenemy1= -200
			xenemy1=randomCar()
			speedenemy1 = speedenemy1 + 300
			if speedenemy1 > 300 then
				speedenemy1 = 100
			end
		end
		yenemy2=yenemy2+speedenemy2*dt
		if yenemy2 > 600 then
			yenemy2= -200
			xenemy2=randomCar(xenemy1)
			speedenemy2 = speedenemy2 + 30
			if speedenemy2 > 300 then
				speedenemy2 = 100
			end
		end
		yenemy2=yenemy2+speedenemy2*dt
		if yenemy2 > 720 then
			yenemy2=7
			xenemy2=randomCar(xenemy1)
		end

		-- ДЕРЕВЬЯ
		ytree1=ytree1+speedtree*dt
		if ytree1 > 600 then
			ytree1= -80
			xtree1 = randomTreeX()
		end
		ytree2=ytree2+speedtree*dt
		if ytree2 > 600 then
			ytree2= -80
			xtree2 = randomTreeX()
		end
		ytree3=ytree3+speedtree*dt
		if ytree3 > 600 then
			ytree3= -80
			xtree3 = randomTreeX()
		end

		-- проверка столкновений
--	
		if CheckCollision(xhero,yhero,shirhero,dlinahero,xenemy1,yenemy1,shirenemy1,dlinaenemy1)
		or CheckCollision(xhero,yhero,shirhero,dlinahero,xenemy2,yenemy2,shirenemy2,dlinaenemy2)
		then
			gameover=true
		end
	end
end