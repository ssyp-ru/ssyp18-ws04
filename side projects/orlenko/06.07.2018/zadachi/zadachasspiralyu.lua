function love.draw()
	for y=600,60,-60 do
	for x=0,800,80 do
	love.graphics.polygon("fill",x,0,x+40,y,x+80,0)
end
end
end