coll = require "collision"
local function conThief (self, dt)
	local mx, my = love.mouse.getX(), love.mouse.getY()
	local oldx = self.x
	local oldy = self.y
	if gx == nil then
		gx = self.x
	end
	if gy == nil then
		gy = self.y
	end
	if mx >= 650 and mx <= 800 and my >= 0 and my <= 50 then
	gx, gy = self.x, self.y
	else
		if self.x > gx - 2 then
			self.x = self.x - 400 * dt
			for i = 1, #u do
				if u[i].kind == "wall" then
					if coll.obj2obj(self,u[i]) == true then
						self.x = oldx
						speed = 0
					end
				end
			end
		end
		if self.x < gx + 2 then
			self.x = self.x + 400 * dt
			for i = 1, #u do
				if u[i].kind == "wall" then
					if coll.obj2obj(self,u[i]) == true then
						self.x = oldx
						speed = 0
					end
				end
			end
		end
		if self.y > gy - 2 then
			self.y = self.y - 400 * dt
			for i = 1, #u do
				if u[i].kind == "wall" then
					if coll.obj2obj(self,u[i]) == true then
						self.y = oldy
					end
				end
			end
		end
		if self.y < gy + 2 then
			self.y = self.y + 400 * dt
			for i = 1, #u do
				if u[i].kind == "wall" then
					if coll.obj2obj(self,u[i]) == true then
						self.y = oldy
					end
				end	
			end
		end
		if self.x > gx - 2 and self.x < gx + 2 and self.y > gy - 2 and self.y < gy + 2 then
			self.x = gx
			self.y = gy
		end
	end
end
return {conThief = conThief}