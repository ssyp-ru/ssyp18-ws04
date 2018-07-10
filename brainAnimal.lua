coll = require 'collision'
local function brainAnimal (self, dt)
	math.randomseed(os.time())
	local oldx = self.x
	local oldy = self.y
	if t == nil then
		t = 0
		--randX = 50--self.x
		--randY = 50--self.y
	end
	--if math.sqrt ((self.x-randX)^2 + (self.y-randY)^2) < self.r then
	if t<=0 then
		t = 3
		randX = math.random (800)
		randY = math.random (600)
		--print (randX, randY)
	elseif self.x < randX and t>0 then
		--for i = 1, #u do
			--if u[i].kind == "wall" --[[and coll.obj2obj(self,u[i]) == false]] then
				t = t - dt
				self.x = self.x + 0.05
			--elseif coll.obj2obj(self,u[i]) then self.x = oldx
			--end
		--end
	elseif self.y < randY and t>0 then
		--for i = 1, #u do
			--if u[i].kind == "wall" --[[and coll.obj2obj(self,u[i]) == false]] then
				t = t - dt
				self.y = self.y + 0.05
			--elseif coll.obj2obj(self,u[i]) then self.y = oldy
			--end
		--end
	elseif self.x > randX and t>0 then
		--for i = 1, #u do
			--if u[i].kind == "wall" --[[and coll.obj2obj(self,u[i]) == false]] then
				t = t - dt
				self.x = self.x - 0.05
			--elseif coll.obj2obj(self,u[i]) then self.x = oldx
			--end
		--end
	elseif self.y > randY and t>0 then
		--for i = 1, #u do
			--if u[i].kind == "wall" --[[and coll.obj2obj(self,u[i]) == false]] then
				t = t - dt
				self.y = self.y - 0.05
			--elseif coll.obj2obj(self,u[i]) then self.y = oldy
			--end
		--end
	end
	
	
	
	
	
	--[[
	local s = self
	--print("##", s.id, s.kind, s.r, s.w, s.x, s.y, s.angleC)
	if s.angleC then
		s.x = s.randXc+(s.randR * math.cos (s.angleC))
		s.y = s.randYc+(s.randR * math.sin (s.angleC))
		s.angleC = s.angleC+2*math.pi / 360
		if s.angleC == 2*math.pi then
			s.angleC = 0
		end
	end]]
	
	
	
	
	
	
--		end
--	end
	--print (self.x, self.y)
	--[[for i = 1, #u do
		if u[i].subkind == 'thief' then
			if self.x > u[i].x then
				self.x = self.x - 50 * dt
				--self.noize = self.noize + 15 * dt
				for i = 1, #u do
		if u[i].kind == "wall" then
			if coll.obj2obj(self,u[i]) == true then
				self.x = oldx
			end
		end
	end
end
if self.x < u[i].x then
	self.x = self.x + 50 * dt
	--self.noize = self.noize + 15 * dt
	for i = 1, #u do
		if u[i].kind == "wall" then
			if coll.obj2obj(self,u[i]) == true then
				self.x = oldx
			end
		end
	end
end
if self.y > u[i].y then
	self.y = self.y - 50 * dt
	--self.noize = self.noize + 15 * dt
	for i = 1, #u do
		if u[i].kind == "wall" then
			if coll.obj2obj(self,u[i]) == true then
				self.y = oldy
			end
		end
	end
end
if self.y < u[i].y then
	self.y = self.y + 50 * dt
	--self.noize = self.noize + 15 * dt
	for i = 1, #u do
		if u[i].kind == "wall" then
			if coll.obj2obj(self,u[i]) == true then
				self.y = oldy
			end
		end
	end
end
else
end
end]]
end
return {brainAnimal = brainAnimal}