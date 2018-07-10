lg = love.graphics
idemvpravo=false
idemvniz=false
function love.load()
	x,y=0,0
	ypatron = 300
	xpatron=400
	speedpatron = 600
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
	lg.print("x3:"..x3.."y3:"..y3, x3,y3+60)
--	lg.setColor(255,0,0)
--	lg.rectangle("fill", y, x, 60,60)
--lg.setColor(255,251,0)
--lg.rectangle("fill", x, y, 60,60)
--	lg.setColor(0,255,0)
--	lg.rectangle("fill", x, x, 60,60)
--	lg.setColor(0,0,255)
--	lg.rectangle("line", y, y, 60,60)
	lg.setColor(255,255,255)
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
--y4=y4+speed2*dt
--x4=x4-speed2*dt
--y4=y4-speed2*dt
	ypatron=ypatron+speedpatron*dt
	if love.keyboard.isDown("down")then
		y3=y3+speed1*dt
	end
	if love.keyboard.isDown("up")then
		y3=y3-speed1*dt
	end
	if love.keyboard.isDown("left")then
		x3=x3-speed1*dt
	end
	if love.keyboard.isDown("right")then
		x3=x3+speed1*dt
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
