local dat = 0.5
local time = {}
for i = 1, 3 do
	time[i] = 0.2
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
local function drawMn (x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5)
	love.graphics.setColor (0, 0, 0)
	love.graphics.line (x, y, x1, y1, x2, y2, x3, y3)
	love.graphics.line (x4, y4, x5, y4)
	love.graphics.line (x4, y5, x5, y5)
end
local function drawSave (x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle ('line', x, y, w, h)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print('Save', x + 10, y + 10)
end
local function drawNew (x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle ('line', x, y, w, h)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print ('New', x + 10, y + 10)
end

local function drawLoad (x, y, w, h)
	love.graphics.setColor (0, 0, 0)
	love.graphics.rectangle ('line',x, y, w, h)
	love.graphics.setColor (255, 0, 0, 140)
	love.graphics.print ('Load', x + 10, y + 10)
end
local function drawAll ()
	drawSave (btnsSave.x, btnsSave.y, btnsSave.w, btnsSave.h)
	drawLoad (btnsLoad.x, btnsLoad.y, btnsLoad.w, btnsLoad.h)
	drawNew (btnsNew.x, btnsNew.y, btnsNew.w, btnsNew.h)
	drawMn (Mnu.x,Mnu.y,Mnu.x1,Mnu.y1,Mnu.x2,Mnu.y1,Mnu.x3,Mnu.y, Mnu.x4, Mnu.y4, Mnu.x5, Mnu.y5)
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
end
return {check = check, drawAll = drawAll}