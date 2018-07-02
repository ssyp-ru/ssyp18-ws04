--Version 1.1
local function circle2circle(circle1, circle2)
	if (math.sqrt((circle1.x-circle2.x)*(circle1.x-circle2.x)+(circle1.y-circle2.y)*(circle1.y-circle2.y))) 
	<= circle1.r + circle2.r then
		return true
	else
		return false
	end
end
local function dot2dot(dot,dot1)
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
end
local function rect2rect (rect1,rect2)
	if rect1.x + rect1.w >= rect2.x and rect1.x <= rect2.x + rect2.w and rect1.y + rect1.h >= rect2.y and rect1.y <= rect2.y + rect1.h then
		return true
	else
		return false
	end
end
local function rect2circle (circle, rect)
	if circle.x + circle.r >= rect.x and circle.x - circle.r <= rect.x + rect.w and circle.y + circle.r
	>= rect.y and circle.y - circle.r <= rect.y + rect.h then --х, у, r относятся к кругу, r - радиус.
		return true
	else
		return false
	end
end
local function dot2circle (dot, circle)
	if math.sqrt((circle.x - dot.x)^2 + (circle.y - dot.y)^2) < circle.r then
		return true
	else
		return false
	end
end

return {dot2dot = dot2dot, dot2rect = dot2rect, circle2rect = circle2rect,
circle2circle = circle2circle, rect2rect = rect2rect, rect2circle=rect2circle, dot2circle = dot2circle}