-- server.lua
sock = require "sock"
require "conf"
local time = 1
local table = {}
function love.load()

	server = sock.newServer("192.168.0.102", 22122)
	-- Called when someone connects to the server
	server:on("connect", function(data, client)
			-- Send a message back to the connected client
			print("Client connected")
			local msg = "Hello from the server"
			client:send("hello", msg)
			client:send("units", table)
		end)
	server:on("greeting1", function(msg)
			print(msg)
		end)
	server:on("table",function(u)
			for i=1,#u do
				table[i] = {x = u[i].x, y = u[i].y, kind = u[i].kind, subkind = u[i].subkind, w = u[i].w,
					h = u[i].h, r = u[i].r, delay = u[i].delay, delay1 = u[i].delay1, id = u[i].id}
				table[i].draw, table[i].update = nil,nil
			end
			end)
end
function love.draw()
end

function love.update(dt)
	server:update()

	time = time - dt


	if time < 0 then
		server:sendToAll("units",table)	
	time = 1
	end
end