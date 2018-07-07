cam = require "gamera"

local function moveCamera(self)
	mx,my = love.mouse.getX(),love.mouse.getY()
	local padding = 100
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
return {moveCamera = moveCamera}