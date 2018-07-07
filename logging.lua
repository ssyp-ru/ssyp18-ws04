local function init(u)
	prov = true
	days = os.date (day)
	months = os.date (month)
	hours = os.date (hour)
	mins = os.date (min)
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
	if prov then
		f:write(months..'============\n')
		prov = false
		for i=1, #log do
			f:write('#'..i..'	'..log[i].sensor.subkind..'\n')
		end
	end
	for i=1, #log do
		if log[i].oldstate ~= log[i].sensor.state then
			f:write('#'..i..' '..log[i].sensor.subkind..'	'..tostring(log[i].sensor.state)..'\n')
			log[i].oldstate = log[i].sensor.state
		end
	end
end
--
return {init=init,checkState=checkState,updateLog=updateLog}