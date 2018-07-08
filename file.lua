json=require"json"
local function save(q,file)
	for o=1,#u do
		u[o].draw=nil
		u[o].update=nil
	end
	local x=json.encode(q)
	love.filesystem.write(file,x,all)
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