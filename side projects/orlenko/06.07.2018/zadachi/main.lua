function love.draw()
	y=60
		for x=0,800,80 do
			love.graphics.polygon("line",x,0,x+40,y,x+80,0)
			y=y+60
		end
	end