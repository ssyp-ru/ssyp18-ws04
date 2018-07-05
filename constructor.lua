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
		w = w1, h = h1,r = nil,
		name = "wall"..maxid,
		update = wall_update,
		draw = drawUnits.wall
	}
	return t
end
local function wall_update(dt)
end
local function updateAnimal(animal, dt)
	animal.delay = animal.delay - dt
	if animal.delay < 0 then
		animal.delay1 = animal.delay1 - dt
		brAnimal.brainAnimal (animal, dt, x, y)
		if animal.delay1 < 0 then
			animal.delay = 3
			animal.delay1 = 20
		end
	end
end
local function createAnimal(x,y,r)
	maxid = maxid + 1
	local t = {
		kind='animal',
		subkind='none',
		id=maxid,
		draw=drawUnits.animal,
		update=updateAnimal,
		x=x, y=y,
		angel=0,
		noize = 0,
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
		kind = "human",
		subkind = 'thief',
		id = maxid,
		draw = drawUnits.thief,
		update = updateThief,
		x = x,
		y = y,
		angle = 0,
		r = r,
		noize = 0
	}
	return t
end
local function updateMovement(self,dt)
	for i = 1, #u do
		if (u[i].kind == "human" or u[i].kind == "animal")  then
			if coll.obj2obj(u[i],self) then
				self.state = true
				break
			else
				self.state = false
			end
		end
	end
end
local function createMovement(x,y,w,h)
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
local function updateNoise(self ,dt)
	local AllNoize
	for i = 1, #u do
		AllNoize = 0
		if u[i].kind == "human" or u[i].kind == "animal" then
			if coll.obj2obj(u[i], self) then
				AllNoize = AllNoize + u[i].noize
			end
		end
		if AllNoize > 150 then
			self.state = true
			break
		else
			self.state = false
		end
	end
end
local function createNoise(x,y,w,h)
	maxid = maxid + 1
	local t = {
		kind='sensor',
		subkind='noise',
		id=maxid,
		draw=drawUnits.noise,
		update=updateNoise,
		x=x, y=y,
		w=w, h=h,
		angle=0,
		state = false
	}
	return t
end
local function updateDoor(self , dt)
	for i = 1, #u do
		if (u[i].kind == "human" or u[i].kind == "animal")  then
			if coll.obj2obj(u[i],self) then
				self.state = true
				break
			else
				self.state = false
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
		angle=0,
		state=false
	}
	return t
end
local function updateLazer(self,dt)
	for i = 1, #u do
		if (u[i].kind == "human" or u[i].kind == "animal")  then
			if coll.obj2obj(u[i],self) then
				self.state = true
				break
			else
				self.state = false
			end
		end
	end
end
local function createLazer(x,y,w,h)
	maxid = maxid + 1
	local t = {
		kind='sensor',
		subkind='lazer',
		id=maxid,
		draw=drawUnits.lazer,
		update=updateLazer,
		x=x,
		y=y,
		angel=0,
		state=false,
		h=h,
		w=w
	}
	return t
end
return {createAnimal=createAnimal,createThief=createThief,createMovement=createMovement,
	createNoise=createNoise,createDoor=createDoor,createLazer=createLazer,createWall = createWall,
	updateThief=updateThief,updateMovement=updateMovement,updateNoise=updateNoise,
	updateLazer=updateLazer,updateDoor=updateDoor,updateAnimal=updateAnimal}