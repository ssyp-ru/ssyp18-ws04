cam = require "gamera"

local function moveCamera(self)
	mx,my = love.mouse.getX(),love.mouse.getY()
	local padding = 50
	if mx >= 650 and mx <= 800 and my >= 0 and my <= 50 then
	else
		if my > 600 - padding then
			self:setPosition(self.x,self.y + 10)
		end
		if my < 0 + padding then
			self:setPosition(self.x,self.y - 10)
		end
		if mx > 800 - padding then
			self:setPosition(self.x + 10,self.y)
		end
		if mx < 0 + padding then
			self:setPosition(self.x - 10,self.y)
		end
	end
end
return {moveCamera = moveCamera}