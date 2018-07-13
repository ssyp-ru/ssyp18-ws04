sock = require "sock"
cost = require "constructor"
local table = {}
local time = 1
local function start()
	client = sock.newClient("192.168.0.102", 22122)
	client:on("connect", function(data)
			print("Client connected to the server.")
			for i=1,#u do
				table[i] = {x = u[i].x,y = u[i].y,kind = u[i].kind,subkind = u[i].subkind,w = u[i].w,
					h = u[i].h, r = u[i].r,delay = u[i].delay,delay1 = u[i].delay1,id = u[i].id}
				table[i].draw,table[i].update = nil,nil
			end
			client:send("table",table)
		end)
	client:on("disconnect", function(data)
			print("Client disconnected from the server.")
		end)
	client:on("hello", function(msg)
			print("The server replied: " .. msg)
		end)
	client:on("units",function(table)
			for i=1,#table do
				u[i] = {x = table[i].x, y = table[i].y, kind = table[i].kind,
					subkind = table[i].subkind, w = table[i].w,
					h = table[i].h, r = table[i].r, delay = table[i].delay, delay1 = table[i].delay1,
					id = table[i].id}
				u[i].draw, u[i].update = cost.getFuncByKind(table[i])
			end
		end)
	client:connect()
end

local function update(dt)
	client:update()
	time = time - dt
--	print(time)
	if time < 0 then
		for i=1,#u do
					time = 1
			print("has been send")
			table[i] = {x = u[i].x,y = u[i].y,kind = u[i].kind,subkind = u[i].subkind,w = u[i].w,
				h = u[i].h, r = u[i].r,delay = u[i].delay,delay1 = u[i].delay1,id = u[i].id}
			table[i].draw,table[i].update = nil,nil
		end
		client:send("table",table)
	end
end
return {start = start, update = update}