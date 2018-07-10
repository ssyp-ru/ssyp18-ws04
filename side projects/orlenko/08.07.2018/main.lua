--made by orlenko andrew


math.randomseed (os.time())
local function rand(n)
	local a = math.random()*n
	a = math.floor(a)
	return a
end	

function love.load()
	xp=400
	yp=300
	speedp=800


	go=true
    
	gameover=false
	
	r=0

	xen6=40
	yen6=599
	speeden6=400

	xen5=40
	yen5=599
	speeden5=300

	xen4=40
	yen4=599
	speeden4=200

	xen3=40
	yen3=599
	speeden3=100

	xen2=80
	yen2=599
	speeden2=600

	n=0

	xen=40
	yen=599
	speeden=250

	xen7=40
	yen7=599
	speeden7=575

	xen8=40
	yen8=599
	speeden8=340

	xen8=40
	yen8=599
	speeden8=540

	xen9=40
	yen9=599
	speeden9=405

	xen10=40
	yen10=599
	speeden10=299

	xen11=40
	yen11=599
	speeden11=125

	miganie=true

	ystar=80
	speedstar=10

	allive=true

	a=rand(720)
end

function corablrisuetsya(x,y)
	love.graphics.setColor(70,244,47)
	love.graphics.polygon("fill",x,y,x-25,y+50,x,y+40,x+25,y+50,x,y)
	if miganie==true then
		love.graphics.polygon("fill",x-12.5,y+45,x,y+55,x+12.5,y+45,x,y+40,x-12.5,y+45)
	end
end
function love.draw()
	if allive==true then
		corablrisuetsya(xp,yp)
	end
	love.graphics.setColor(250,250,0)
	love.graphics.ellipse("fill",0,ystar,80,80)
	love.graphics.setColor(255,0,0)
	if n==0 then
		love.graphics.ellipse("fill",xen,yen,30,30)
	end

	if n==0 then
		love.graphics.setNewFont( 40 )
		love.graphics.print("you alive   "..  r .. " sekonds ")
	end

	if allive==false and gameover==true then
		love.graphics.setNewFont( 30 )
		love.graphics.print("game over\n you allive  "..r.."  sekonds")
	end


	if n==0 then
		love.graphics.ellipse("fill",xen2,yen2,30,30)
	end

	if n==0 then
		love.graphics.ellipse("fill",xen3,yen3,30,30)
	end


	if n==0 then
		love.graphics.ellipse("fill",xen4,yen4,30,30)
	end

	if n==0 then
		love.graphics.ellipse("fill",xen5,yen5,30,30)
	end

	if n==0 then
		love.graphics.ellipse("fill",xen6,yen6,30,30)
	end

	if n==0 then
		love.graphics.ellipse("fill",xen7,yen7,30,30)
	end

	if n==0 then
		love.graphics.ellipse("fill",xen8,yen8,30,30)
	end

	if n==0 then
		love.graphics.ellipse("fill",xen9,yen9,30,30)
	end

	if n==0 then
		love.graphics.ellipse("fill",xen10,yen10,30,30)
	end

	if n==0 then
		love.graphics.ellipse("fill",xen11,yen11,30,30)
	end

	if ystar>=800 then
		go=false
		n=n+1
		allive=false
		love.graphics.setNewFont( 50 )
		love.graphics.print("you win :you alive "..r.." sekonds")
	end


end

function love.update(dt)

	if love.keyboard.isDown("right") then
		xp=xp+speedp*dt
	end

	if love.keyboard.isDown("left") then
		xp=xp-speedp*dt
	end

	if miganie==true then
		miganie=false
	else
		miganie=true
	end
	if n==0 then
		if xp>=xen-30 and xp<=xen+30 and yp>=yen-30 and yp<=yen+30 then
			allive=false
			n=n+1
			go=false
			gameover=true
		end
	end
	if n==0 then
	if xp>=xen6-30 and xp<=xen6+30 and yp>=yen6-30 and yp<=yen6+30 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end
	end
	if n==0 then
	if xp>=xen5-30 and xp<=xen5+30 and yp>=yen5-30 and yp<=yen5+30 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end
	end
	if n==0 then
	if xp>=xen2-30 and xp<=xen2+30 and yp>=yen2-30 and yp<=yen2+30 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end
	end
	if n==0 then
	if xp>=xen3-30 and xp<=xen3+30 and yp>=yen3-30 and yp<=yen3+30 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end
	end
	if n==0 then
	if xp>=xen4-30 and xp<=xen4+30 and yp>=yen4-30 and yp<=yen4+30 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end
	end
	if n==0 then
	if xp>=xen7-30 and xp<=xen7+30 and yp>=yen7-30 and yp<=yen7+30 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end
	end
	if n==0 then
	if xp>=xen8-30 and xp<=xen8+30 and yp>=yen8-30 and yp<=yen8+30 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end
	end
	if n==0 then
	if xp>=xen9-30 and xp<=xen9+30 and yp>=yen9-30 and yp<=yen9+30 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end
	end
	if n==0 then
	if xp>=xen10-30 and xp<=xen10+30 and yp>=yen10-30 and yp<=yen10+30 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end
	end
	if n==0 then
	if xp>=xen11-30 and xp<=xen11+30 and yp>=yen11-30 and yp<=yen11+30 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end
	end

	if love.keyboard.isDown("escape") then
		love.event.quit()

	end
	if go==true then
		ystar=ystar+speedstar*dt
	end


	if xp>800 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end
	
--	if love.keyboard.isDown("up") then
--		xp=1
--	end

	if xp<0 then
		allive=false
		n=n+1
		go=false
		gameover=true
	end

	if yen5>0 and yen5<800 then
		yen5=yen5+speeden5*dt
	elseif yen5>800 then
		a=rand(720)
		xen5=40
		yen5=1
		xen5=xen5+a
		speeden5=speeden5+10
	end

	if yen6>0 and yen6<800 then
		yen6=yen6+speeden6*dt
	elseif yen6>800 then
		a=rand(720)
		xen6=40
		yen6=1
		xen6=xen6+a
		speeden6=speeden6+10
	end

	if yen>0 and yen<800 then
		yen=yen+speeden*dt
	elseif yen>800 then
		a=rand(720)
		xen=40
		yen=1
		xen=xen+a
		speeden=speeden+10
	end

	if yen2>0 and yen2<800 then
		yen2=yen2+speeden2*dt
	elseif yen2>800 then
		a=rand(720)
		xen2=40
		yen2=1
		xen2=xen2+a
		speeden2=speeden2+10
	end

	if yen3>0 and yen3<800 then
		yen3=yen3+speeden3*dt
	elseif yen3>800 then
		a=rand(720)
		xen3=40
		yen3=1
		xen3=xen3+a
		speeden3=speeden3+10
	end

	if yen4>0 and yen4<800 then
		yen4=yen4+speeden*dt
	elseif yen4>800 then
		a=rand(720)
		xen4=40
		yen4=1
		xen4=xen4+a
		speeden4=speeden4+10
	end

	if yen7>0 and yen7<800 then
		yen7=yen7+speeden*dt
	elseif yen7>800 then
		a=rand(720)
		xen7=40
		yen7=1
		xen7=xen7+a
		speeden7=speeden7+10
	end

	if yen8>0 and yen8<800 then
		yen8=yen8+speeden8*dt
	elseif yen8>800 then
		a=rand(720)
		xen8=40
		yen8=1
		xen8=xen8+a
		speeden8=speeden8+10
	end

	if yen9>0 and yen9<800 then
		yen9=yen9+speeden9*dt
	elseif yen9>800 then
		a=rand(720)
		xen9=40
		yen9=1
		xen9=xen9+a
		speeden9=speeden9+10
	end

	if yen10>0 and yen10<800 then
		yen10=yen10+speeden10*dt
	elseif yen10>800 then
		a=rand(720)
		xen10=40
		yen10=1
		xen10=xen10+a
		speeden10=speeden10+10
	end
	if yen11>0 and yen11<800 then
		yen11=yen11+speeden11*dt
	elseif yen11>800 then
		a=rand(720)
		xen11=40
		yen11=1
		xen11=xen11+a
		speeden11=speeden11+10
	end
	if n==0 then
		r=r+dt
	end
end