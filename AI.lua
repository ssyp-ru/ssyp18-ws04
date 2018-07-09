local function init()
	local log={}
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
	for i=1, #u do
		if log[i].oldstate then
			
		end
	end
end