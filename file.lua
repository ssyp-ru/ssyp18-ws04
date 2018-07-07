json=require"json"
local function save(q,file)
	for o=1,#u do
		u[o].draw=nil
		u[o].update=nil
	end
	local f = io.open(file,"w")
	local x=json.encode(q)
	f:write(x)
	f:close()
end
local function rabota(file, x)
	local jol=love.filesystem.lines(file)
	local x=json.decode(jol())
	for i=1,#x do
		x[i].draw,x[i].update=obj.getFuncByKind(x[i])
	end
	return x
end
return {rabota=rabota,save=save}
