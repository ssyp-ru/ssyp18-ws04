brAnimal = require "brainAnimal"
con = require "control"
coll = require "collision"
drawUnits = require "drawUnits"
local function createWall(x1,y1,w1,h1)
	maxid = maxid + 1
	local t = {
		x = x1, y = y1,
		angle = 0,
		kind = "wall",
		subKind = " ",
		id = maxid,
		w = w1, h = h1,
		name = "wall"..maxid,
		update = wall_update,
		draw = drawUnits.wall
	}
	return t
end
local function wall_update(dt)
end
<<<<<<< HEAD
local function updateAnimal(dt)
=======
local function updateAnimal(animal, dt)
	--drawUnits.animal (animal)
	animal.delay = animal.delay - dt
	if animal.delay < 0 then
		animal.delay1 = animal.delay1 - dt
		brAnimal.brainAnimal (animal, dt, x, y)
		if animal.delay1 < 0 then
			animal.delay = 4
			animal.delay1 = 20
		end
	end
>>>>>>> 52fbc3911b3bfc571d0aabb73442dc47748d0a2f
end
local function createAnimal(x,y,r)
	maxid = maxid + 1
	local t = {
		kind='animal',
		subkind='none',
		id=maxid,
		draw=drawUnits.animal,
		update=updateAnimal(),
		x=x,
		y=y,
		angel=0,
		r=r,
		delay = 4,
		delay1 = 20
	}
	return t
end
function updateThief(thief, dt)
	con.conThief(thief, dt)
end
local function createThief(x,y,r)
	maxid = maxid + 1
	local t = {
		kind='human',
		subkind='thief',
		id=maxid,
		draw=drawUnits.thief,
		update=updateThief,
		x=x,
		y=y,
		angel=0,
		r=r,
	}
	return t
end
<<<<<<< HEAD
local function updateMovement(self,dt)
	for i = 1, #u do
		if u[i].kind == "human" and coll.obj2obj(u[i],self) then
			self.state = true
		else
			self.state = false
		end
	end
=======
local function updateMovement(dt)
	--drawUnits.movement (movement, w, h)
>>>>>>> 52fbc3911b3bfc571d0aabb73442dc47748d0a2f
end
local function createMovement(x,y, w, h)
	maxid = maxid + 1
	local t = {
		kind='sensor',
		subkind='movement',
		id=maxid,
		state = false,
		draw=drawUnits.movement,
		update=updateMovement,
		x=x,
		y=y,
		w=w,
		h=h,
		angle=0
	}
	return t
end
local function updateNoise(dt)
<<<<<<< HEAD
=======
	--drawUnits.noise (noise, w, h)
>>>>>>> 52fbc3911b3bfc571d0aabb73442dc47748d0a2f
end
local function createNoise(x,y,w,h)
	maxid = maxid + 1
	local t = {
		kind='sensor',
		subkind='noise',
		id=maxid,
		draw=drawUnits.noise,
		update=updateNoise,
		x=x,
		y=y,
		w=w,
		h=h,
		angle=0
	}
	return t
end
local function updateDoor(dt)
	for i=1,#u do 
		if u[i].kind=='animal' or u[i].kind=='human' then
			if rect2circle (self, u[i])==true then
			end
		end
	end
end
local function createDoor(x,y,w,h)
	maxid = maxid + 1
	local t = {
		kind='sensor',
		subkind='door',
		id=maxid,
		draw=drawUnits.door,
		update=updateDoor,
		x=x,
		y=y,
		w=w,
		h=h,
		angle=0
	}
	return t
end
local function updateLight(dt)
<<<<<<< HEAD
=======
	--drawUnits.light (light)
>>>>>>> 52fbc3911b3bfc571d0aabb73442dc47748d0a2f
end
local function createLight(x,y)
	maxid = maxid + 1
	local t = {
		kind='sensor',
		subkind='light',
		id=maxid,
		draw=drawUnits.light,
		update=updateLight,
		x=x,
		y=y,
		angel=0
	}
	return t
end
--[[updateThief=updateThief,updateMovement=updateMovement,updateNoise=updateNoise,
updateLight=updateLight,updateDoor=updateDoor,updateAnimal=updateAnimal]]--
return {createAnimal=createAnimal,createThief=createThief,createMovement=createMovement,
	createNoise=createNoise,createDoor=createDoor,createLight=createLight,createWall = createWall}