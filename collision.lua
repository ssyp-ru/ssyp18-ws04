--Version 1.1a
local function circle2circle(circle1, circle2)
	if (math.sqrt((circle1.x-circle2.x)*(circle1.x-circle2.x)+(circle1.y-circle2.y)*(circle1.y-circle2.y))) 
	<= circle1.r + circle2.r then
		return true
	else
		return false
	end
end
--[[local function dot2dot(dot,dot1)
	if dot1.x == dot1.x and dot.y == dot1.y then
		return true
	else
		return false
	end
end
local function dot2rect(dot, rect)
	if dot.y >= (rect.y - rect.h) and dot.y <= rect.y and dot.x >= rect.x - rect.h and dot.x <= rect.x + rect.w then
		return true
	else
		return false
	end
end]]
local function rect2rect (rect1,rect2)
	if rect1.x + rect1.w >= rect2.x and rect1.x <= rect2.x + rect2.w and rect1.y + rect1.h >= rect2.y and rect1.y <= rect2.y + rect1.h then
		return true
	else
		return false
	end
end
local function rect2circle (circle, rect)
	if not rect.w then
		print(rect.kind, rect.subKind, rect.id, rect.x, rect.w, rect.r, rect.h)
	end
	if circle.x + circle.r >= rect.x and circle.x - circle.r <= rect.x + rect.w and circle.y + 
	circle.r>= rect.y and circle.y - circle.r <= rect.y + rect.h then --х, у, r относятся к кругу.
		return true
	else
		return false
	end
end
--[[local function dot2circle (dot, circle)
	if math.sqrt((circle.x - dot.x)^2 + (circle.y - dot.y)^2) < circle.r then
		return true
	else
		return false
	end
end]]
local function obj2obj (obj1, obj2)
	if obj1.kind=="bed" or obj1.kind=="desk" or obj1.kind=="fridge" then
		return false
	elseif obj2.kind=="bed" or obj2.kind=="desk" or obj2.kind=="fridge" then
		return false
	elseif obj1.kind == "human" or obj1.kind == "animal" then
		if obj2.kind == "human" or obj2.kind == "animal" then
			return circle2circle(obj1, obj2)
		else	
			return rect2circle(obj1, obj2)
		end
	else
		if obj2.kind == "human" or obj2.kind == "animal" then
			return rect2circle(obj2, obj1)
		else	
			return rect2rect(obj1, obj2)
		end
	end
end
return {obj2obj = obj2obj} 