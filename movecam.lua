cam = require "gamera"

local function moveCamera(self,dt)
	local mx,my = love.mouse.getX(),love.mouse.getY()
	local padding = 50
--	if mx >= 650 and mx <= 800 and my >= 0 and my <= 50 or
--	mx >= 0 and mx <= 350 and my >= 530 and my <= 600 then
		if mx >= love.graphics.getHeight() - 150 and mx <= love.graphics.getWidth() and my >= 0 and my <= 50 then
		else
			if love.mouse.isDown(3) then
				mx,my = self:toWorld(mx,my)
				self:setPosition(self.x + (mx - edit.x3) * -dt * 2,self.y + (my - edit.y3) * -dt * 2)
			else
				if my > love.graphics.getHeight() - padding then
					self:setPosition(self.x,self.y + 10)
				end
				if my < 0 + padding then
					self:setPosition(self.x,self.y - 10)
				end
				if mx > love.graphics.getWidth() - padding then
					self:setPosition(self.x + 10,self.y)
				end
				if mx < 0 + padding then
					self:setPosition(self.x - 10,self.y)
				end
			end
		end
--	end
end
return {moveCamera = moveCamera}