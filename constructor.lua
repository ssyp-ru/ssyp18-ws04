brAnimal = require "brainAnimal"
con = require "control"
coll = require "collision"
drawUnits = require "drawUnits"

local function addDangerTable(t2, maxDanger, maxTime)
	local t = { currentDanger = 0, maxDanger = maxDanger or 10, time = 0, maxTime = maxTime or 3}
	t2.danger = t
end

local function offDanger(t)
    local d  = t.danger
    d.currentDanger = 0
    --d.time = d.maxTime
end

local function onDanger(t)
    local d  = t.danger
    d.currentDanger = d.maxDanger
    d.time = d.maxTime
end

local function updateDanger(dt, t)
    local d  = t.danger
    d.time = d.time - dt
    if t.state then
        onDanger(t)
    elseif d.time <=0 then --and d.currentDanger == 0
        offDanger(t)
    end
    totalDanger = totalDanger + d.currentDanger
end

local function createWall(x,y,w,h)
	maxid = maxid + 1 
	return {x=x,y=y,angle=1,kind="wall",subKind="none",id=maxid,w=w,h=h,
		update=updateWall,draw=drawUnits.wall}
end
local function updateWall(dt)
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
	return {kind='animal',subkind='none',id=maxid,draw=drawUnits.animal,
			update=updateAnimal,x=x,y=y,angle=1,r=r,delay=4,delay1=20}
end
local function updateThief(thief, dt)
	con.conThief(thief, dt)
end
local function createThief(x,y,r)
	maxid = maxid + 1
	return {kind="human",subkind='thief',id=maxid,draw=drawUnits.thief,
			update=updateThief,x=x,y=y,angle=1,r=r}
end
local function updateBed(self, dt)
end
local function createBed(x,y)
	maxid = maxid + 1
	return {kind="bed",subkind=2,id=maxid,draw=drawUnits.bed,
			update=updateBed, x=x,y=y,angle=1,r=r}
end
local function updateFridge(self, dt)
end
local function createFridge(x,y)
	maxid = maxid + 1
	return {kind="fridge",subkind=3,id=maxid,draw=drawUnits.fridge,
			update=updateFridge, x=x,y=y,angle=1,r=r}
end
local function updateDesk(self, dt)
end
local function createDesk(x,y)
	maxid = maxid + 1
	return {kind="desk",subkind=4,id=maxid,draw=drawUnits.desk,
			update=updateDesk, x=x,y=y,angle=1,r=r}
end
local function updateTree(self, dt)
end
local function createTree(x,y,r)
	maxid = maxid + 1
	return {kind="tree",subkind=1,id=maxid,draw=drawUnits.tree,
			update=updateTree, x=x,y=y,angle=1,r=r}
end
local function updateMovement(self,dt)
    updateDanger(dt, self)
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
	local t =  {kind='sensor',subkind='movement',id=maxid,state=false,
			draw=drawUnits.movement,update=updateMovement,x=x,y=y,w=w,h=h,angle=1 }
    addDangerTable(t)
    return t
end
local function updateDoor(self , dt)
    updateDanger(dt, self)
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
	local t ={kind='sensor', subkind='door', id=maxid, draw=drawUnits.door, update=updateDoor,
			x=x, y=y, w=w,h=h,angle=1,state=false }
    addDangerTable(t)
    return t
end
local function updateLazer(self,dt)
    updateDanger(dt, self)
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
	local t = {kind='sensor',subkind='lazer',id=maxid,draw=drawUnits.lazer,update=updateLazer,
			x=x,y=y,angle=1,state=false,h=h,w=w}
    addDangerTable(t)
    return t
end
local function getFuncByKind(t)
	if t.kind == "sensor" and t.subkind == "movement" then
		return drawUnits.movement, updateMovement
	end
	if t.kind == "sensor" and t.subkind == "noise" then
		return drawUnits.noise, updateNoise
	end
	if t.kind == "sensor" and t.subkind == "door" then
		return drawUnits.door, updateDoor
	end
	if t.kind == "sensor" and t.subkind == "lazer" then
		return drawUnits.lazer, updateLazer
	end
	if t.kind == "human" and t.subkind == "thief" then
		return drawUnits.thief, updateThief
	end
	if t.kind == "animal" and t.subkind == "none" then
		return drawUnits.animal, updateAnimal
	end
	if t.kind == "wall" then
		return drawUnits.wall, updateWall
	end
	if t.kind == "tree" then
		return drawUnits.tree, updateTree
	end
	if t.kind == "desk" then
		return drawUnits.desk, updateDesk
	end
	if t.kind == "fridge" then
		return drawUnits.fridge, updateFridge
	end
	if t.kind == "bed" then
		return drawUnits.bed, updateBed
	end
end

return {createAnimal=createAnimal,createThief=createThief,createMovement=createMovement,
	createDoor=createDoor,createLazer=createLazer,createWall = createWall,
	updateThief=updateThief,updateMovement=updateMovement,
	updateLazer=updateLazer,updateDoor=updateDoor,updateAnimal=updateAnimal,getFuncByKind=getFuncByKind,
	createTree = createTree,createBed=createBed,updateBed=updateBed,updateFridge=updateFridge,
	createFridge=createFridge,updateDesk=updateDesk,createDesk=createDesk}