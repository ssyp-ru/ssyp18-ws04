--edti = require 'edit'
local furn = {}
local nemu = {}
local noth = {}
local wall = {}
local delete = {}
local door = {}
local movement = {}
local thief = {}
local cat = {}
local dat = 0.5
local dat1  = 0.5
local time = {}
for i = 1, 3 do
	time[i] = 5
end
local Mnu = {}
local btnsNew = {}
local btnsLoad = {}
local btnsSave = {}
btnsLoad.x = love.graphics.getWidth() - 100
btnsLoad.y = 0
btnsLoad.w = 50
btnsLoad.h = 30
btnsSave.x = love.graphics.getWidth() - 50
btnsSave.y = 0
btnsSave.w = 50
btnsSave.h = 30
btnsNew.x = love.graphics.getWidth() - 150
btnsNew.y = 0
btnsNew.w = 50
btnsNew.h = 30
Mnu.x = love.graphics.getWidth() - 125
Mnu.y = 30
Mnu.x1 = love.graphics.getWidth() - 100
Mnu.y1 = 50
Mnu.x2 = love.graphics.getWidth() - 50
Mnu.x3 = love.graphics.getWidth() - 25
Mnu.x4 = love.graphics.getWidth() - 88
Mnu.y4 = 37
Mnu.x5 = love.graphics.getWidth() - 62
Mnu.y5 = 43
wall.x = 0
wall.y = love.graphics.getHeight() - 70
wall.w = 50
wall.h = 70
delete.x = 50
delete.w = 50
delete.h = 70
door.x = 100
door.w = 50
door.h = 70
movement.x = 150
movement.w = 50
movement.h = 70
thief.x = 200
thief.w = 50
thief.h = 70
cat.x = 250
cat.w = 50
cat.h = 70
nemu.x = 350
nemu.y = love.graphics.getHeight() - 65
nemu.x1 = 370
nemu.y1 = love.graphics.getHeight() - 47
nemu.y2 = love.graphics.getHeight() - 23
nemu.y3 = love.graphics.getHeight() - 5
nemu.x4 = 356
nemu.y4 = love.graphics.getHeight() - 47
nemu.x5 = 364
nemu.y5 = love.graphics.getHeight() - 23
noth.x = 300
noth.w = 50
noth.h = 70
local function drawNoth (x, y, w, h)
	love.graphics.setColor (0, 0, 0, 50)
	love.graphics.rectangle ('fill', x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle('line', x, y, w, h)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print('nothing', x + 1, y + 25)
end
local function drawWall(x, y, w, h)
	love.graphics.setColor (0, 0, 0, 50)
	love.graphics.rectangle ('fill', x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle ('line', x, y, w, h/2)
	love.graphics.rectangle ('line', x, y+35, w, h/2)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print('Wall', x + 10, y + 12)
	love.graphics.print('Tree', x + 10, y + 45)
end
local function drawDelete(x, y, w, h)
	love.graphics.setColor (0, 0, 0, 50)
	love.graphics.rectangle ('fill', x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle ('line', x, y, w, h)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print('Delete', x + 5, y + 25)
end
local function drawDoor(x, y, w, h)
	love.graphics.setColor (0, 0, 0, 50)
	love.graphics.rectangle ('fill', x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle('line', x, y, w, h/2)
	love.graphics.rectangle('line', x, y+35, w, h/2)
	love.graphics.rectangle ('line', x, y, w, h)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print('Door', x + 10, y + 12)
	love.graphics.print('Laser', x + 10, y + 40)
end
local function drawMovement(x, y, w, h)
	love.graphics.setColor (0, 0, 0, 50)
	love.graphics.rectangle ('fill', x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle ('line', x, y, w, h/2)
	love.graphics.rectangle ('line', x, y+35, w, h/2)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print('Move', x + 5, y + 3)
	love.graphics.print('ment', x + 5, y + 15)
	love.graphics.print('Desk', x + 7, y + 45)
end
local function drawThief(x, y, w, h)
	love.graphics.setColor (0, 0, 0, 50)
	love.graphics.rectangle ('fill', x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle ('line', x, y, w, h/2)
	love.graphics.rectangle ('line', x, y+35, w, h/2)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print('Thief', x + 10, y + 12)
	love.graphics.print('Bed', x + 14, y + 45)
end
local function drawCat(x, y, w, h)
	love.graphics.setColor (0, 0, 0, 50)
	love.graphics.rectangle ('fill', x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle ('line', x, y, w, h/2)
	love.graphics.rectangle ('line', x, y+35, w, h/2)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print('Cat', x + 13, y + 12)
	love.graphics.print('Fridge', x + 6, y + 45)
end
local function drawNm (x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7)
	love.graphics.setColor (0, 0, 0)
	love.graphics.line(x, y, x1, y1, x2, y2, x3, y3)
	love.graphics.line(x4, y4, x5, y5)
	love.graphics.line(x6, y6, x7, y7)
end
local function drawMn (x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5)
	love.graphics.setColor (0, 0, 0)
	love.graphics.line (x, y, x1, y1, x2, y2, x3, y3)
	love.graphics.line (x4, y4, x5, y4)
	love.graphics.line (x4, y5, x5, y5)
end
local function drawSave (x, y, w, h)
	love.graphics.setColor (0, 0, 0, 50)
	love.graphics.rectangle ('fill', x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle ('line', x, y, w, h)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print('Save', x + 10, y + 10)
end
local function drawNew (x, y, w, h)
	love.graphics.setColor (0, 0, 0, 50)
	love.graphics.rectangle ('fill', x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle ('line', x, y, w, h)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print ('New', x + 10, y + 10)
end

local function drawLoad (x, y, w, h)
	love.graphics.setColor (0, 0, 0, 50)
	love.graphics.rectangle ('fill', x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle ('line', x, y, w, h)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print ('Load', x + 10, y + 10)
end
local function drawAll ()
	drawSave (btnsSave.x, btnsSave.y, btnsSave.w, btnsSave.h)
	drawLoad (btnsLoad.x, btnsLoad.y, btnsLoad.w, btnsLoad.h)
	drawNew (btnsNew.x, btnsNew.y, btnsNew.w, btnsNew.h)
	drawMn (Mnu.x,Mnu.y,Mnu.x1,Mnu.y1,Mnu.x2,Mnu.y1,Mnu.x3,Mnu.y, Mnu.x4, Mnu.y4, Mnu.x5, Mnu.y5)
	drawWall(wall.x, wall.y, wall.w, wall.h)
	drawDelete(delete.x, wall.y, delete.w, delete.h)
	drawDoor(door.x, wall.y, door.w, door.h)
	drawMovement(movement.x, wall.y, movement.w, movement.h)
	drawThief(thief.x, wall.y, thief.w, thief.h)
	drawCat(cat.x, wall.y, cat.w, cat.h)
	drawNm(nemu.x, nemu.y, nemu.x1, nemu.y1, nemu.x1, nemu.y2, nemu.x, nemu.y3, nemu.x4,
		nemu.y4, nemu.x4, nemu.y5, nemu.x5, nemu.y4, nemu.x5, nemu.y5)
	drawNoth(noth.x, wall.y, noth.w, noth.h)
end
local function check (dt)
	local mx = love.mouse.getX()
	local my = love.mouse.getY()
	time[1] = time[1] - dt
	time[2] = time[2] - dt
	time[3] = time[3] - dt
	if down then
		if mx >= btnsLoad.x and mx <= btnsLoad.x + btnsLoad.w and my >= btnsLoad.y and
		my <= btnsLoad.y + btnsLoad.h and
		time[1] < 0 then
			u=file.rabota("save.txt", {})
			time[1] = 5
		end
		if mx >= btnsNew.x and mx <= btnsNew.x + btnsNew.w and my >= btnsNew.y and
		my <= btnsNew.y + btnsNew.h and
		time[2] < 0 then
			u=file.rabota("new.txt", {})
			time[2] = 5
		end
		if mx >= btnsSave.x and mx <= btnsSave.x + btnsSave.w and my >= btnsSave.y and 
		my <= btnsSave.y + btnsSave.h and
		time[3] < 0 then
			time[3] = 5
			file.save(u,'save.txt')
			print("saved")
			for i=1,#u do
				u[i].draw,u[i].update=obj.getFuncByKind(u[i])
			end
		end
		if mx >= door.x and mx <= door.x + door.w and my >= wall.y+35 and my <= wall.y + door.h/2 then
			state = "Laser"
		end
		if mx >= noth.x and mx <= noth.x + noth.w and my >= wall.y and my <= wall.y + noth.h then
			state = "Point"
		end
		if mx >= wall.x and mx <= wall.x + wall.w and my >= wall.y+35 and my <= wall.y+35 + wall.h/2 then
			state = "Tree"
		end
		if mx >= wall.x and mx <= wall.x + wall.w and my >= wall.y and my <= wall.y + wall.h/2 then
			state = "Wall"
		end
		if mx >= delete.x and mx <= delete.x + delete.w and my >= wall.y and
		my <= wall.y + delete.h then
			state = "Delete"
		end
		if mx >= door.x and mx <= door.x + door.w and my >= wall.y+35 and my <= wall.y+35 + door.h/2 then
			state = "Laser"
		end
		if mx >= door.x and mx <= door.x + door.w and my >= wall.y and my <= wall.y + door.h/2 then
			state = "Door"
		end
		if mx >= movement.x and mx <= movement.x + movement.w and my >= wall.y+35 and
		my <= wall.y+35 + movement.h/2 then
			state = "Desk"
		end
		if mx >= movement.x and mx <= movement.x + movement.w and my >= wall.y and
		my <= wall.y + movement.h/2 then
			state = "Movement"
		end
		if mx >= thief.x and mx <= thief.x + thief.w and my >= wall.y+35 and
		my <= wall.y+35 + thief.h/2 then
			state = "Bed"
		end
		if mx >= thief.x and mx <= thief.x + thief.w and my >= wall.y and my <= wall.y + thief.h/2 then
			state = "Thief"
		end
		if mx >= cat.x and mx <= cat.x + cat.w and my >= wall.y + 35 and my <= wall.y + 35 + cat.h/2 then
			state = "Fridge"
		end
		if mx >= cat.x and mx <= cat.x + cat.w and my >= wall.y and my <= wall.y + cat.h/2 then
			state = "Animal"
		end
	end
	dat = dat - dt
	if mx >= btnsNew.x and mx <= 800 and my >= 0 and my <= Mnu.y1  and dat > 0 then
		dat = 0.5
		btnsSave.y = btnsSave.y + 100 * dt
		btnsNew.y = btnsNew.y + 100 * dt
		btnsLoad.y = btnsLoad.y + 100 * dt
		Mnu.y = Mnu.y + 100 * dt
		Mnu.y1 = Mnu.y1 + 100 * dt
		Mnu.y4 = Mnu.y4 + 100 * dt
		Mnu.y5 = Mnu.y5 + 100 * dt
		if btnsLoad.y > 0 and btnsNew.y > 0 and btnsSave.y > 0 then
			btnsLoad.y, btnsNew.y, btnsSave.y = 0, 0, 0
		end
		if Mnu.y > 30 then Mnu.y = 30 end
		if Mnu.y1 > 50 then Mnu.y1 = 50 end
		if Mnu.y4 > 37 then Mnu.y4 = 37 end
		if Mnu.y5 > 43 then Mnu.y5 = 43 end
	else
		if dat < 0 then
			btnsSave.y = btnsSave.y - 100 * dt
			btnsNew.y = btnsNew.y - 100 * dt
			btnsLoad.y = btnsLoad.y - 100 * dt
			Mnu.y = Mnu.y - 100 * dt
			Mnu.y1 = Mnu.y1 - 100 * dt
			Mnu.y4 = Mnu.y4 - 100 * dt
			Mnu.y5 = Mnu.y5 - 100 * dt
			if btnsLoad.y < -31 and btnsNew.y < - 31 and btnsSave.y < -31 then
				btnsLoad.y, btnsNew.y, btnsSave.y = -31, -31, -31
			end
			if Mnu.y < 0 then Mnu.y = 0 end
			if Mnu.y1 < 20 then Mnu.y1 = 20 end
			if Mnu.y4 < 7 then Mnu.y4 = 7 end
			if Mnu.y5 < 13 then Mnu.y5 = 13 end
			if mx >= btnsNew.x and mx <= 800 and my >= 0 and my <= Mnu.y1 then
				dat = 0.5
			end
		end
	end
	dat1 = dat1 - dt
	if mx >= wall.x and mx <= nemu.x1 and my >= wall.y and my <= wall.y + wall.h and dat1 > 0 then
		dat1 = 0.5
		wall.x = wall.x + 500 * dt
		delete.x = delete.x + 500 * dt
		door.x = door.x + 500 * dt
		movement.x = movement.x + 500 * dt
		thief.x = thief.x + 500 * dt
		cat.x = cat.x + 500 * dt
		noth.x = noth.x + 500 * dt
		nemu.x = nemu.x + 500 * dt
		nemu.x1 = nemu.x1 + 500 * dt
		nemu.x4 = nemu.x4 + 500 * dt
		nemu.x5 = nemu.x5 + 500 * dt
		if wall.x > 0 and delete.x > 50 and door.x > 100 and movement.x > 150 and thief.x > 200 and
		cat.x > 250 and noth.x > 300 and nemu.x > 350 and nemu.x1 > 370 and nemu.x4 > 356 and
		nemu.x5 > 364 then
			wall.x = 0
			delete.x = 50
			door.x = 100
			movement.x = 150
			thief.x = 200
			cat.x = 250
			nemu.x = 350
			nemu.x1 = 370
			nemu.x4 = 356
			nemu.x5 = 364
			noth.x = 300
		end
	else
		if dat1 < 0 then
			wall.x = wall.x - 500 * dt
			delete.x = delete.x - 500 * dt
			door.x = door.x - 500 * dt
			movement.x = movement.x - 500 * dt
			thief.x = thief.x - 500 * dt
			cat.x = cat.x - 500 * dt
			noth.x = noth.x - 500 * dt
			nemu.x = nemu.x - 500 * dt
			nemu.x1 = nemu.x1 - 500 * dt
			nemu.x4 = nemu.x4 - 500 * dt
			nemu.x5 = nemu.x5 - 500 * dt
			if wall.x < -350 then
				wall.x = -350
				delete.x = -300
				door.x = -250
				movement.x = -200
				thief.x = -150
				cat.x = -100
				nemu.x = 0
				nemu.x1 = 20
				nemu.x4 = 6
				nemu.x5 = 14
				noth.x = -50
			end
			if mx >= nemu.x and mx <= nemu.x1 and my >= wall.y and
			my <= wall.y + wall.h then
				dat1 = 0.5
			end
		end
	end
end
return {check = check, drawAll = drawAll}