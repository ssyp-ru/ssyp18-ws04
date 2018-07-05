local function init(u)
	local days = os.date (day)
	local months = os.date (month)
	f = io.open('logs.txt', 'a')
	log={}
	for i=1, #u do
		if u[i].kind == 'sensor' then
			log[#log+1]={
				oldstate=u[i].state,
				sensor=u[i]
			}
		end
	end
end
local function checkState()
end
--[[f = io.open('rtujm.txt', 'w')
f:write('zapis')
f:flush()
f:close()--]]
local function updateLog (dt)
	--[[for i=1, #log do
		f:write(tostring(log[i].oldstate)..'\n'..log[i].sensor.subkind..'\n')
	end--]]
	for i=1, #log do
		if log[i].oldstate ~= log[i].sensor.state then
			f:write(log[i].sensor.subkind..'	'..tostring(log[i].sensor.state)..'\n')
		end
	end
	f:write()
end

return {init=init,checkState=checkState,updateLog=updateLog}