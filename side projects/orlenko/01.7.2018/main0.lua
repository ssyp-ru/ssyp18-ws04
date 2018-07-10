function love.load()
	miganie=true
end
function love.draw()
	love.graphics.setColor(70,244,47)
	love.graphics.polygon("fill",100,100,50,200,100,180,150,200,100,100)
	if miganie==true then
		love.graphics.polygon("fill",75,190,100,210,125,190,100,180,75,190)
	end

	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill",50,0, 50, 50)


--	love.graphics.setColor(255,255,255)
--	for y = 1,600,40 do
--		love.graphics.line(1,y,800,y)
--	end
--	for x = 1,800,20 do
--		love.graphics.line(x,1,x,600)
--	end
	
	
	
	
	
	
end
function love.update(dt)
	if miganie == true then
		miganie=false 
	else 
		miganie = true
	end
end