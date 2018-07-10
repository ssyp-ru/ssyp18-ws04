local function rand(n)
	local a = math.random()* n
	a = math.floor(a)
	return a
end	
local b = io.read()
b=tonumber(b)
	
a=rand(b)
 print(a)