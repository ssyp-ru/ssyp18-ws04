local collisions = require "collision"
function brake(starship,dt) 
	if not(love.keyboard.isDown(starship.control.w)
		or love.keyboard.isDown(starship.control.s)) then
		if starship.speed > 0 then
			starship.speed = starship.speed - 20 * dt
			if starship.speed < 0 then starship.speed = 0 end
		end
		if starship.speed < 0 then
			starship.speed = starship.speed + 20 * dt
			if starship.speed > 0 then starship.speed = 0 end
		end
	end
end
function border (starship)
	if starship.x > 1376 then starship.x = -10 end
	if starship.x < -10 then starship.x = 1376 end
	if starship.y > 778 then starship.y = -10 end
	if starship.y < -10 then starship.y = 778 end
	if starship.speed > 200 then starship.speed = 200 end
	if starship.speed < -200 then starship.speed = -200 end
end
function moveObj(obj, obj2, dt)
	obj.x = obj.x + obj.xspeed * dt
	if collisions.rect2circle(obj,obj2) then
		obj.x = obj.ox
	end
	obj.y = obj.y + obj.yspeed * dt
	if collisions.rect2circle(obj,obj2) then
		obj.y = obj.oy
	end
end
function Rot (starship)
	starship.ro = starship.ro % (2 * math.pi)
	love.graphics.translate( starship.x, starship.y )
	love.graphics.rotate( starship.ro )
	love.graphics.translate( -starship.x, -starship.y )
end
function countDist(x1,y1,x2,y2)
	Distance = math.sqrt((x1-x2)^2 + (y1-y2)^2)
end