local dat = 2
local Mnu = {}
local btnsNew = {}
local btnsLoad = {}
local btnsSave = {}
btnsLoad.x = 700
btnsLoad.y = 0
btnsLoad.w = 50
btnsLoad.h = 30
btnsLoad.click = true
btnsSave.x = 750
btnsSave.y = 0
btnsSave.w = 50
btnsSave.h = 30
btnsSave.click = true
btnsNew.x = 650
btnsNew.y = 0
btnsNew.w = 50
btnsNew.h = 30
btnsNew.click = true
Mnu.x = 675
Mnu.y = 30
Mnu.x1 = 700
Mnu.y1 = 50
Mnu.x2 = 750
Mnu.x3 = 775
Mnu.x4 = 712
Mnu.y4 = 37
Mnu.x5 = 738
Mnu.y5 = 43
local function drawMn (x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5)
	love.graphics.line (x, y, x1, y1, x2, y2, x3, y3)
	love.graphics.line (x4, y4, x5, y4)
	love.graphics.line (x4, y5, x5, y5)
end
local function drawSave (x, y, w, h)
	love.graphics.rectangle ('line', x, y, w, h)
	love.graphics.print('Save', x + 10, y + 10)
end
local function drawNew (x, y, w, h)
	love.graphics.rectangle ('line', x, y, w, h)
	love.graphics.print ('New', x + 10, y + 10)
end

local function drawLoad (x, y, w, h)
	love.graphics.rectangle ('line',x, y, w, h)
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
	if down then
		if mx >= btnsLoad.x and mx <= btnsLoad.x + btnsLoad.w and my >= btnsLoad.y and
		my <= btnsLoad.y + btnsLoad.h and
		btnsLoad.click then
			print('LOAD')
			btnsLoad.click = false
		end
		if mx >= btnsNew.x and mx <= btnsNew.x + btnsNew.w and my >= btnsNew.y and
		my <= btnsNew.y + btnsNew.h and
		btnsNew.click then
			print('NEW')
			btnsNew.click = false
		end
		if mx >= btnsSave.x and mx <= btnsSave.x + btnsSave.w and my >= btnsSave.y and 
		my <= btnsSave.y + btnsSave.h and
		btnsSave.click then
			print('SAVE')
			btnsSave.click = false
		end
	end
	dat = dat - dt
	if mx >= btnsNew.x and mx <= 800 and my >= 0 and my <= Mnu.y1  and dat > 0 then
		dat = 2
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
				dat = 2
			end
		end
	end
end
return {check = check, drawAll = drawAll}