coll = require 'collision'
local function brainAnimal (self, dt)
	local oldx = self.x
	local oldy = self.y
	for i = 1, 15 do
		if u[i].subkind == 'thief' then
			if self.x > u[i].x then
				self.x = self.x - 900 * dt
				for i = 1, #u do
					if u[i].kind == "wall" then
						if coll.obj2obj(self,u[i]) == true then
							self.x = oldx
						end
					end
				end
			end
			if self.x < u[i].x then
				self.x = self.x + 900 * dt
				for i = 1, #u do
					if u[i].kind == "wall" then
						if coll.obj2obj(self,u[i]) == true then
							self.x = oldx
						end
					end
				end
			end
			if self.y > u[i].y then
				self.y = self.y - 900 * dt
				for i = 1, #u do
					if u[i].kind == "wall" then
						if coll.obj2obj(self,u[i]) == true then
							self.y = oldy
						end
					end
				end
			end
			if self.y < u[i].y then
				self.y = self.y + 900 * dt
				for i = 1, #u do
					if u[i].kind == "wall" then
						if coll.obj2obj(self,u[i]) == true then
							self.y = oldy
						end
					end
				end
			end
		end
	end
end
return {brainAnimal = brainAnimal}