lg=love.graphics

function love.load()
	n=0
	idemvniz=true
	idemvpravo=true
	xen=55
	yen=44
	speeden=200

	alive=true
	kolichestvopopodaniy=0
	kolichestvolives=3
	bessm= 5

	speedpatron=2500


	xe1=420
	ye1=320
	speede1=350

	xe=399
	ye=299
	speede=400

	xe3=399
	ye3=299
	speede3=10

	xp=499
	yp=300
	speedp=1000

	xpatron=xp
	ypatron=yp

	x = 444
	y = 333
end

function love.draw()
	lg.setColor(0, 255,0)
	if kolichestvolives>0 then
		lg.print(kolichestvopopodaniy, 0, 20)
	end

	--lg.print("               y:"..y)

	lg.setColor(255,0,0)
	if alive==true then
		love.graphics.ellipse("fill",xen,yen,80,80)
	end
	--love.graphics.setColor(0,255,0)
	--love.graphics.rectangle("fill" ,100,100,60,60)
	--love.graphics.setColor(0,0,255)
	--love.graphics.rectangle("fill" ,100,100,60,60)
	love.graphics.setColor(255,255,255)
	--love.graphics.ellipse("fill",xe,ye,20,20)
	--love.graphics.ellipse("fill",xe1,ye1,20,20)
	love.graphics.ellipse("fill",xpatron,ypatron,3,3)
	--love.graphics.ellipse("fill",xe,ye,20,20)
	love.graphics.setColor(255,255,0)
	if kolichestvolives>0 then
		love.graphics.arc("fill","pie",xp,yp,20,0.5,5.5)
	else
		if love.keyboard.isDown("enter") then
			kolichestvolives=kolichestvolives+3

		end
	end
	love.graphics.setColor(0,0,0)
	--love.graphics.ellipse("fill" ,100,100 ,5,5)
	if kolichestvolives<1 then
		lg.setColor(255,255,255,150,400,300)
		love.graphics.setNewFont(130)
		lg.print("GAME OVER")
	end
	--love.audio.play(  )
end

function love.update(dt)
	if idemvpravo then
		xen = xen+speeden*dt
	else
		xen=xen-speeden*dt
	end
	--if idemvpravo== true then
	--xen=xen+speeden*dt 
	--idemvpravo=false
	--else
	--xen=xen-speeden*dt
	--idemvpravo=true

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

	if love.keyboard.isDown("space") then
		ypatron = yp
		xpatron = xp
	end

	ypatron=ypatron-speedpatron*dt


--	if xe<xp then
--		xe=xe+speede*dt
--	else
--		xe=xe-speede*dt
--	end

--	if ye<yp then
--		ye=ye+speede*dt
--   else
--	   ye=ye-speede*dt
--	end  

--	if xe1<xe then
--		xe1=xe1+speede1*dt
--	else
--		xe1=xe1-speede1*dt
--	end

--	--if ye1<ye then
--		ye1=ye1+speede1*dt
--   else
--	   ye1=ye1-speede1*dt
--	end

	if xp>800 then
		xp=0
	end

	if xp<0 then
		xp=800
	end

	if yp<0 then    
		yp=600
	end

	if yp>600 then
		yp=0
	end




--	if love.keyboard.isDown("o") then
--		if idemvpravo== true then
--			idemvpravo=false
--		else
--			idemvpravo=true
--		end
--end

	--if love.keyboard.isDown("w") then
	--ye=ye-speede*dt
	--end
--	if love.keyboard.isDown("s") then
--		ye=ye+speede*dt
--	end
--	if love.keyboard.isDown("a") then
--		xe=xe-speede*dt
--	end
--	if love.keyboard.isDown("d") then
--		xe=xe+speede*dt
--	end

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

	if xpatron>=xen-80 and xpatron<=xen+80 and ypatron>=yen-80 and ypatron<=yen+80 then
		kolichestvopopodaniy=kolichestvopopodaniy+1
		xpatron=xp
		ypatron=ypatron-100
	end
	if kolichestvopopodaniy >= 100 then
		alive=false 
	end

	if xp>=xen-80 and xp<=xen+80 and yp>=yen-80 and yp<=yen+80 then
		kolichestvolives=kolichestvolives-1
	end

	bessm= 5

	bessm = bessm - dt
	if bessm < 0  then
		--5 

		if allve==false or kolichestvolives<=0 then
			love.event.quit()
		end

	end

end