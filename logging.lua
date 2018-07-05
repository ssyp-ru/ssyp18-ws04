local function init(u)
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
local function updateLog (dt)
	for i=1, #log do
		if log[i].oldstate ~= log[i].sensor.state then
			--print ('DETECT')
			break
		end
	end
end

return {init=init,checkState=checkState,updateLog=updateLog}