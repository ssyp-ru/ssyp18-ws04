json=require"json"
local function save(q,file)
	for o=1,#u do
		u[o].draw=nil
		u[o].update=nil
	end
	local f = io.open(file,"w");
	local x=json.encode(q)
	f:write(x)
	f:close()
end
local function rabota(q,file)
	local f = io.open(file,"r+");
	local x=json.decode(q)
	f:close()
	return x
end
return {rabota=rabota,save=save}
