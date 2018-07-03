coll = require "collision"
local function conThief (self, units, dt)
	local mx = love.mouse.getX()
	local my = love.mouse.getY()
	if self.x > 683 then 
		mx = mx + self.x - 683
	end
	if self.y > 384 then 
		my = my + self.y - 384
	end
	local oldx = self.x
	local oldy = self.y
	if self.x > mx then
		self.x = self.x - 100 * dt
		for i = 1, #units do
			if units[i].kind == "wall" then
				if coll.rect2circle(self,units[i]) == true then
					self.x = oldx
				end
			end
		end
	end
	if self.x < mx then
		self.x = self.x + 100 * dt
		for i = 1, #units do
			if units[i].kind == "wall" then
				if coll.rect2circle(self,units[i]) == true then
					self.x = oldx
				end
			end
		end
	end
	if self.y > my then
		self.y = self.y - 100 * dt
		for i = 1, #units do
			if units[i].kind == "wall" then
				if coll.rect2circle(self,units[i]) == true then
					self.y = oldy
				end
			end
		end
	end
	if self.y < my then
		self.y = self.y + 100 * dt
		for i = 1, #units do
			if units[i].kind == "wall" then
				if coll.rect2circle(self,units[i]) == true then
					self.y = oldy
				end
			end
		end
	end
	if self.x > mx - 5 and self.x < mx + 5 and self.y > my - 5 and self.y < my + 5 then
	self.x = oldx
	self.y = oldy
	end
end
return {conThief = conThief}