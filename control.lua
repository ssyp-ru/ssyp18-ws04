coll = require "collision"
local function conThief (self, dt)
	down = love.mouse.isDown(1)
	local gx
	local gy
	local mx = love.mouse.getX ()
	local my = love.mouse.getY ()
	mx,my = cam:toWorld (mx,my)
	local oldx = self.x
	local oldy = self.y
	if gx == nil then
		gx = mx
	end
	if gy == nil then
		gy = my
	end
	if down then
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
		if self.x > mx - 10 and self.x < mx + 10 and self.y > my - 10 and self.y < my + 10 then
			self.x = oldx
			self.y = oldy
		end
	else
		self.noize =  0
	end
end
return {conThief = conThief}