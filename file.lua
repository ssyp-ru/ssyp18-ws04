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
		if x[i].kind == "wall" or x[i] == "movement" or x[i] == "door" then
			if (x[i].w < 0 and x[i].h < 0) then
				x[i].x,x[i].y = x[i].x + x[i].w,x[i].y + x[i].h
				x[i].w = -x[i].w
				x[i].h = -x[i].h
			elseif x[i].w < 0 then
				x[i].x = x[i].x + x[i].w
				x[i].w = -x[i].w
			elseif x[i].h < 0 then
				x[i].y = x[i].y + x[i].h
				x[i].h = -x[i].h
			end
		end
	end
	return x
end
return {rabota=rabota,save=save}