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
	--[[
	if gx + 2 >= 650 and gx - 2 <= 800 and gy + 2 >= 0 and gy - 2 <= 30 then
		return
	end--]]
	if self.x > gx - 2 then
		self.x = self.x - 400 * dt
		--self.noize = self.noize + 100 * dt
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
		--self.noize = self.noize + 100 * dt
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
		--self.noize = self.noize + 100 * dt
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
		--self.noize = self.noize + 100 * dt
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
		--self.noize = 0
	end

--	if self.noize > 200 then
--		self.noize = 200
--	end
end
return {conThief = conThief}