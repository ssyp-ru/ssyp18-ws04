function love.load()
	miganie=true

	local function rand(n)
		local a = math.random()*n
		a = math.floor(a)
		return a
	end	

	n=0 
	a=rand(-20,20)
	g=100
	d=100
	speedcor=600

	m=100
	n=100
--	speedcorblue=600

	idemvniz=true
	idemvpravo=true
	xen=55
	yen=44
	speeden=200

	idemvniz2=false
	idemvpravo2=false
	xen2=100
	yen2=500
	speeden2=200


end

function corablrisuetsya(x,y)
	love.graphics.setColor(70,244,47)
	love.graphics.polygon("fill",x,y,x-25,y+50,x,y+40,x+25,y+50,x,y)
	if miganie==true then
		love.graphics.polygon("fill",x-12.5,y+45,x,y+55,x+12.5,y+45,x,y+40,x-12.5,y+45)
	end
end

function corablrisuetsyablue(x,y)
	love.graphics.setColor(100,20,200)
	love.graphics.polygon("fill",x,y,x-50,y+100,x,y+80,x+50,y+100,x,y)
	if miganie==true then
		love.graphics.polygon("fill",x-25,y+90,x,y+110,x+25,y+90,x,y+80,x-25,y+90)
	end
end

function love.draw()
--	love.graphics.setColor(70,244,47)
--	love.graphics.polygon("fill",100,100,50,200,100,180,150,200,100,100)
--	if miganie==true then
--		love.graphics.polygon("fill",75,190,100,210,125,190,100,180,75,190)
	--end
	love.graphics.setColor(255,255,255)
	--love.graphics.rectangle("fill",50,0, 50, 50)
--	love.graphics.setColor(255,255,255)
--	for y = 1,600,40 do
--		love.graphics.line(1,y,800,y)
--	end
--	for x = 1,800,20 do
--		love.graphics.line(x,1,x,600)
--	end
	local a = math.random(-20,20)
	corablrisuetsya(g + a, d + a)
	corablrisuetsyablue(m,n)
	corablrisuetsya(xen,yen)
	corablrisuetsya(xen2,yen2)
	--corablrisuetsya(500, 300)
end
function love.update(dt)
	if miganie == true then
		miganie=false 
	else 
		miganie = true
	end

	if idemvpravo then
		xen = xen+speeden*dt
	else
		xen=xen-speeden*dt
	end

	if idemvpravo==true then
		if xen>800 then
			idemvpravo=false
		else
			idemvpravo=true
		end
	end

	if idemvpravo==false then
		if xen<0 then
			idemvpravo=true
		else
			idemvpravo=false
		end
	end


	if idemvniz then
		yen = yen+speeden*dt
	else
		yen=yen-speeden*dt
	end	

	if yen>600 then
		if idemvniz== true then
			idemvniz=false
		else
			idemvniz=true
		end
	end

	if yen<0 then
		if idemvniz== true then
			idemvniz=false
		else
			idemvniz=true
		end
	end




	if idemvpravo2 then
		xen2 = xen2+speeden2*dt
	else
		xen2=xen2-speeden2*dt
	end

	if idemvpravo2==true then
		if xen2>800 then
			idemvpravo2=false
		else
			idemvpravo2=true
		end
	end

	if idemvpravo2==false then
		if xen2<0 then
			idemvpravo2=true
		else
			idemvpravo2=false
		end
	end


	if idemvniz2 then
		yen2 = yen2+speeden2*dt
	else
		yen2=yen2-speeden2*dt
	end	

	if yen2>600 then
		if idemvniz2== true then
			idemvniz2=false
		else
			idemvniz2=true
		end
	end

	if yen2<0 then
		if idemvniz2== true then
			idemvniz2=false
		else
			idemvniz2=true
		end
	end

	m,n= love.mouse.getPosition()


--	if love.keyboard.isDown("w") then
--		n=n-speedcorblue*dt
--	end
--	if love.keyboard.isDown("s") then
--		n=n+speedcorblue*dt
--	end
--	if love.keyboard.isDown("a") then
--		m=m-speedcorblue*dt
--	end
--	if love.keyboard.isDown("d") then
--		m=m+speedcorblue*dt
--	end


	if love.keyboard.isDown("up") then
		d=d-speedcor*dt
	end
	if love.keyboard.isDown("down") then
		d=d+speedcor*dt
	end
	if love.keyboard.isDown("right") then
		g=g+speedcor*dt
	end
	if love.keyboard.isDown("left") then
		g=g-speedcor*dt
	end


	if love.keyboard.isDown("escape") then
		love.event.quit()
	end


end