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
<<<<<<< HEAD
<<<<<<< HEAD
	if self.x > mx then
		self.x = self.x - 1000 * dt
		for i = 1, #u do
			if u[i].kind == "wall" then
				if coll.obj2obj(self,u[i]) == true then
					self.x = oldx
				end
			end
		end
	end
	if self.x < mx then
		self.x = self.x + 1000 * dt
		for i = 1, #u do
			if u[i].kind == "wall" then
				if coll.obj2obj(self,u[i]) == true then
					self.x = oldx
				end
			end
		end
	end
	if self.y > my then
		self.y = self.y - 1000 * dt
		for i = 1, #u do
			if u[i].kind == "wall" then
				if coll.obj2obj(self,u[i]) == true then
					self.y = oldy
				end
			end
		end
	end
	if self.y < my then
		self.y = self.y + 1000 * dt
		for i = 1, #u do
			if u[i].kind == "wall" then
				if coll.obj2obj(self,u[i]) == true then
					self.y = oldy
=======
	print (self.x,self.y)
=======
	--print (self.x,self.y)
>>>>>>> b2ab71a1e0f61279624638c7853c95a51fa5a849
--	if self.x > mx then
	if gx == nil then
		gx = mx
	end
	if gy == nil then
		gy = my
	end
	if down then
		--print (self.x,self.y)
		if self.x > gx then
			self.x = self.x - 1000 * dt
			for i = 1, #u do
				if u[i].kind == "wall" then
					if coll.rect2circle(self,u[i]) == true then
						self.x = oldx
					end
				end
			end
		end
--	if self.x < mx then

		if self.x < gx then
			self.x = self.x + 1000 * dt
			for i = 1, #u do
				if u[i].kind == "wall" then
					if coll.rect2circle(self,u[i]) == true then
						self.x = oldx
					end
				end
			end
		end
--	if self.y > my then

		if self.y > gy then
			self.y = self.y - 1000 * dt
			for i = 1, #u do
				if u[i].kind == "wall" then
					if coll.rect2circle(self,u[i]) == true then
						self.y = oldy
					end
				end
			end
		end
--	if self.y < my then
		if self.y < gy then
			self.y = self.y + 1000 * dt
			for i = 1, #u do
				if u[i].kind == "wall" then
					if coll.rect2circle(self,u[i]) == true then
						self.y = oldy
					end
>>>>>>> c81b2cb6e0758fc04bdc5c9221720393c6864375
				end
			end
		end
		if self.x > mx - 10 and self.x < mx + 10 and self.y > my - 10 and self.y < my + 10 then
			self.x = oldx
			self.y = oldy
		end
	end
end
return {conThief = conThief}