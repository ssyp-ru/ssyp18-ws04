lg=love.graphics

function love.load()
	n=0
	
	xen=55
	yen=44
	speeden=75
	
	xe=399
	ye=299
	speede=100
	
	xp=499
	yp=300
	speedp=100
	
	x = 444
	y = 333
end

function love.draw()
		lg.print("xp:"..xp)
	
	lg.print("               y:"..y)

     lg.setColor(255,0,0)
		love.graphics.ellipse("fill",xen,yen,40,40)
		--love.graphics.setColor(0,255,0)
		--love.graphics.rectangle("fill" ,100,100,60,60)
		--love.graphics.setColor(0,0,255)
		--love.graphics.rectangle("fill" ,100,100,60,60)
		love.graphics.setColor(255,255,255)
		love.graphics.ellipse("fill",xe,ye,20,20)
		love.graphics.setColor(255,255,0)
		love.graphics.arc("fill","pie",xp,yp,20,0.5,5.5)
		love.graphics.setColor(0,0,0)
		--love.graphics.ellipse("fill" ,100,100 ,5,5)
     end

function love.update(dt)
	if xen<360 then
	xen = xen+speeden*dt
else
	xen= xen+speeden*dt
end
	if yen <260 then
	yen = yen+speeden*dt
end
    
	if love.keyboard.isDown("w") then
		ye=ye-speede*dt
	end
	if love.keyboard.isDown("s") then
		ye=ye+speede*dt
	end
	if love.keyboard.isDown("a") then
		xe=xe-speede*dt
	end
	if love.keyboard.isDown("d") then
		xe=xe+speede*dt
	end
	
	if love.keyboard.isDown("up") then
		yp=yp-speedp*dt
	end
	if love.keyboard.isDown("down") then
		yp=yp+speedp*dt
	end
	if love.keyboard.isDown("right") then
		xp=xp+speedp*dt
	end
	if love.keyboard.isDown("left") then
		xp=xp-speedp*dt
	end
	x,y = love.mouse.getPosition()
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end