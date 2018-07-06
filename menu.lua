local btnsNew = {}
local btnsLoad = {}
local btnsSave = {}
btnsLoad.x = 300
btnsLoad.y = 100
btnsLoad.w = 50
btnsLoad.h = 30
btnsLoad.click = true
btnsSave.x = 100
btnsSave.y = 300
btnsSave.w = 50
btnsSave.h = 30
btnsSave.click = true
btnsNew.x = 200
btnsNew.y = 300
btnsNew.w = 50
btnsNew.h = 30
btnsNew.click = true
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
end
local function check (dt)
	local mx = love.mouse.getX()
	local my = love.mouse.getY()
	if down then
		if mx > btnsLoad.x and mx < btnsLoad.x + btnsLoad.w and my > btnsLoad.y and
		my < btnsLoad.y + btnsLoad.h and
		btnsLoad.click then
			print('LOAD')
			btnsLoad.click = false
		end
		if mx > btnsNew.x and mx < btnsNew.x + btnsNew.w and my > btnsNew.y and
		my < btnsNew.y + btnsNew.h and
		btnsNew.click then
			print('NEW')
			btnsNew.click = false
		end
		if mx > btnsSave.x and mx < btnsSave.x + btnsSave.w and my > btnsSave.y and 
		my < btnsSave.y + btnsSave.h and
		btnsSave.click then
			print('SAVE')
			btnsSave.click = false
		end
	end
end
return {check = check, drawAll = drawAll}