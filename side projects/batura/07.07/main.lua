--- корабль в функции
lg = love.graphics
idemvpravo=false
idemvniz=false
function love.load()
	x,y=100,100
	ypatron = 300
	xpatron=400
	speedpatron = 50
	mertviy=false
	y3 = 300
	x3=400
	speed1 = 200
	y4 = 500
	x4=500
	speed2 = 150
	y5 = 100
	x5=100
	speed3 = 150
end
function love.draw()
	--lg.print("x3:"..x3.."y3:"..y3, x3,y3+60)
	lg.rectangle("fill", xpatron,ypatron , 10, 20)
	if 	love.keyboard.isDown("1")then
		lg.setColor(175,150,200)
	else
		lg.setColor(100,150,200)
	end
	lg.rectangle("fill", x3,y3 , 60,60)
	if mertviy== false then
		lg.setColor(100,200,255)
	else
		lg.setColor(100,200,255,30)
		mertviy=false
	end
	lg.rectangle("fill", x4,y4 , 60,60)
	drawShip(x - 100, y-150,1)
	drawShip(x - 250, y-150)
	drawShip(x + 50, y-150,2)
	drawShip(x + 200, y-150,3)
	drawShip(x - 400, y-150,4)
end
function love.update(dt)
	x, y = love.mouse.getPosition()
	if love.keyboard.isDown("escape")then
		love.event.quit()
	end
	if x3>740 then
		idemvpravo=false
	end
	if x3<0 then
		idemvpravo=true
	end
	if y3>540 then
		idemvniz=false
	end
	if y3<0 then
		idemvniz=true
	end
	ypatron=ypatron+speedpatron*dt
	if love.keyboard.isDown("down")then
		y=y+speed*dt
	end
	if love.keyboard.isDown("up")then
		y=y-speed*dt
	end
	if love.keyboard.isDown("left")then
		x=x-speed*dt
	end
	if love.keyboard.isDown("right")then
		x=x+speed*dt
	end
	if idemvpravo == true then
		x3=x3+speed1*dt
	else
		x3=x3-speed1*dt
	end
	if idemvniz == true then
		y3=y3+speed1*dt
	else
		y3=y3-speed1*dt
	end
	if love.keyboard.isDown("b")then
		if idemvpravo==false then
			idemvpravo = true
		else
			idemvpravo=false
		end
	end
	if 	love.keyboard.isDown("1")then
		ypatron = y3
		xpatron=x3
	end
--	love.even
end
function drawShip(x, y, c)
	local niz_y = 0
	niz_y = math.random(250, 290)
	lg.setColor(255,165,35, math.random(255))
	lg.polygon("fill",x+64,y+175,x+100,y+niz_y, x+137,y+175)
	if c == 1 then
		lg.setColor(26,255,55)
	elseif c==2 then
		lg.setColor(26,55,255)
	elseif c==3 then
		lg.setColor(25,255,137)
	elseif c==4 then
		lg.setColor(139,155,137)
	else
		lg.setColor(255,26,55)
	end
	lg.polygon("fill",x+100,y+100,x+50,y+200,x+25,y+175,x+175,y+175,x+150,y+200)
end
