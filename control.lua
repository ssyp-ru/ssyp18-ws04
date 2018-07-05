coll = require "collision"
local function conThief (self, dt)
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
		self.noize = self.noize + 100 * dt
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
		self.noize = self.noize + 100 * dt
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
		self.noize = self.noize + 100 * dt
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
		self.noize = self.noize + 100 * dt
		for i = 1, #u do
			if u[i].kind == "wall" then
				if coll.obj2obj(self,u[i]) == true then
					self.y = oldy
				end
			end
		end
	end
	if self.x > gx - 10 and self.x < gx + 10 and self.y > gy - 10 and self.y < gy + 10 then
		self.x = oldx
		self.y = oldy
	end
end
return {conThief = conThief}