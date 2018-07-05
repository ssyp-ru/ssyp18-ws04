--Version 1.0
local function wall (self)
	love.graphics.setColor (141, 107, 33)
	love.graphics.rectangle ("fill", self.x, self.y, self.w, self.h)
end
local function thief (self)
	love.graphics.setColor (0, 0, 0, 255)
	love.graphics.circle ("fill", self.x, self.y, self.r)
	love.graphics.print (self.id, self.x, self.y + 20)
end
local function animal (self)
	love.graphics.setColor (125, 125, 125)
	love.graphics.circle ("fill", self.x, self.y, self.r)
end
local function movement (self)
	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("line", self.x, self.y, 25, 25)
	love.graphics.line (self.x + 2, self.y + 23, self.x + 2, self.y + 3, self.x + 12, self.y + 12,
		self.x + 22, self.y + 3, self.x + 22, self.y + 23)
	love.graphics.setColor (255, 0, 0, 140)
	if self.state then
		love.graphics.rectangle ('fill', self.x, self.y, self.w, self.h)	
	else
		love.graphics.rectangle ('line', self.x, self.y, self.w, self.h)
	end
	love.graphics.setColor (255, 0, 0, 255)
end
local function noise (self)
	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("line", self.x, self.y, 25, 25)
	love.graphics.line (self.x + 5, self.y + 23, self.x + 5, self.y + 3, self.x + 20, self.y + 23,
		self.x + 20, self.y + 3)
	love.graphics.setColor (255, 0, 0, 140)
	if self.state then
		love.graphics.rectangle ('fill', self.x, self.y, self.w, self.h)
		love.graphics.setColor (255, 0, 0, 255)
	else
	love.graphics.rectangle ('line', self.x, self.y, self.w, self.h)
	love.graphics.setColor (255, 0, 0, 255)
	end
end
local function door (self)
	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("line", self.x, self.y, 25, 25)
	love.graphics.line (self.x + 3, self.y + 3, self.x + 3, self.y + 23, self.x + 23, self.y + 13, self.x
		+ 3, self.y + 3)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.rectangle ('fill', self.x, self.y, self.w, self.h)
	love.graphics.setColor (255, 0, 0, 255)
end
local function light (self)
	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("line", self.x, self.y, 25, 25)
	love.graphics.line (self.x + 20, self.y + 5, self.x + 5, self.y + 5, self.x + 5, self.y + 12,
		self.x + 20, self.y + 12, self.x + 20, self.y + 20, self.x + 5, self.y + 20)
end

return {wall = wall, thief = thief, animal = animal, movement = movement,
	noise = noise, door = door, light = light}