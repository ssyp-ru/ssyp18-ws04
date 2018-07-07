coll = require "collision"
local function conThief (self, dt)
	local speedNoice
	local oldx = self.x
	local oldy = self.y
	if gx == nil then
		gx = self.x
	end
	if gy == nil then
		gy = self.y
	end
	if self.x > gx then
		self.x = self.x - 400 * dt
		speedNoice = 1000
		for i = 1, #u do
			if u[i].kind == "wall" then
				if coll.obj2obj(self,u[i]) == true then
					self.x = oldx
				end
			end
		end
	end
	if self.x < gx then
		self.x = self.x + 400 * dt
		speedNoice = 1000
		for i = 1, #u do
			if u[i].kind == "wall" then
				if coll.obj2obj(self,u[i]) == true then
					self.x = oldx
				end
			end
		end
	end
	if self.y > gy then
		self.y = self.y - 400 * dt
		speedNoice = 1000
		for i = 1, #u do
			if u[i].kind == "wall" then
				if coll.obj2obj(self,u[i]) == true then
					self.y = oldy
				end
			end
		end
	end
	if self.y < gy then
		self.y = self.y + 400 * dt
		speedNoice = 1000
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
		speedNoice = -2000
	end
	self.noize = self.noize + speedNoice * dt
	if self.noize > 200 then
		self.noize = 200
	end
	if self.noize < 0 then
		self.noize = 0
	end
end
return {conThief = conThief}