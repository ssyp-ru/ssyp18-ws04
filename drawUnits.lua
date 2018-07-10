--Version 1.1
local function wall (self)
	love.graphics.setColor (141, 107, 33)
	love.graphics.rectangle ("fill", self.x, self.y, self.w, self.h)
end
local function thief (self)
	love.graphics.setColor (0, 0, 0, 255)
	love.graphics.circle ("fill", self.x, self.y, self.r)
end
local function tree (self)
	love.graphics.setColor (255,255,255)
	love.graphics.draw(sprtree1, self.x, self.y)
end
local function bed (self)
	love.graphics.setColor (255,255,255)
	if self.angle==1 then
		love.graphics.draw(sprtree2, self.x, self.y)
	elseif self.angle==2 then
		love.graphics.draw(sprtree2, self.x, self.y,math.pi*0.5)
	elseif self.angle==3 then
		love.graphics.draw(sprtree2, self.x, self.y,math.pi)
	elseif self.angle==4 then
		love.graphics.draw(sprtree2, self.x, self.y,math.pi*1.5)
	end
end
local function fridge (self)
	love.graphics.setColor (255,255,255)
	if self.angle==1 then
		love.graphics.draw(sprtree3, self.x, self.y)
	elseif self.angle==2 then
		love.graphics.draw(sprtree3, self.x, self.y,math.pi*0.5)
	elseif self.angle==3 then
		love.graphics.draw(sprtree3, self.x, self.y,math.pi)
	elseif self.angle==4 then
		love.graphics.draw(sprtree3, self.x, self.y,math.pi*1.5)
	end
end
local function desk (self)
	love.graphics.setColor (255,255,255)
	if self.angle==1 then
		love.graphics.draw(sprtree4, self.x, self.y)
	elseif self.angle==2 then
		love.graphics.draw(sprtree4, self.x, self.y,math.pi*0.5)
	elseif self.angle==3 then
		love.graphics.draw(sprtree4, self.x, self.y,math.pi)
	elseif self.angle==4 then
		love.graphics.draw(sprtree4, self.x, self.y,math.pi*1.5)
	end
end
local function animal (self)
	love.graphics.setColor (125, 125, 125)
	love.graphics.circle ("fill", self.x, self.y, self.r)
end
local function movement (self)
	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("line", self.x, self.y, 25, 25)
	love.graphics.line (self.x + 4, self.y + 21, self.x + 4, self.y + 3, self.x + 12, self.y + 12,
		self.x + 21, self.y + 3, self.x + 21, self.y + 21)
	love.graphics.setColor (255, 0, 0, 100)
	if self.state then
		love.graphics.rectangle ('fill', self.x, self.y, self.w, self.h)	
	else
		love.graphics.rectangle ('line', self.x, self.y, self.w, self.h)
	end
	love.graphics.setColor (255, 0, 0, 255)
end
local function door (self)
	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("line", self.x, self.y, 25, 25)
	love.graphics.line (self.x + 3, self.y + 3, self.x + 3, self.y + 23, self.x + 23, self.y + 13, self.x+ 3, self.y + 3)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.rectangle ('fill', self.x, self.y, self.w, self.h)
	love.graphics.setColor (255, 0, 0, 255)
end
local function lazer (self)
	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("line", self.x, self.y, 25, 25)
	if self.angle==1 then
		love.graphics.rectangle ("line", self.x+12, self.y+12,self.w,self.h+12)
	elseif self.angle==2 then
		love.graphics.rectangle ("line", self.x+12, self.y+12,-self.h-12,self.w)
	elseif self.angle==3 then
		love.graphics.rectangle ("line", self.x+12, self.y+12,self.w,-self.h-12)
	elseif self.angle==4 then
		love.graphics.rectangle ("line", self.x+12, self.y+12,self.h+12,-self.w)
	end
	love.graphics.line (self.x + 20, self.y + 5, self.x + 5, self.y + 5, self.x + 5, self.y + 12,
		self.x + 20, self.y + 12, self.x + 20, self.y + 20, self.x + 5, self.y + 20)
end

local function dangerIndicator(x, y)
	if not totalDanger then
        totalDanger = 0
    end
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle('line', x, y, 50, -300)
	love.graphics.setColor(255, 0, 0, 127)
	love.graphics.rectangle("fill", x, y, 50, -3 * totalDanger)
end

return {wall = wall, thief = thief, animal = animal, movement = movement,
	door = door, lazer = lazer,tree=tree,desk=desk,fridge=fridge,bed=bed,
	dangerIndicator = dangerIndicator}