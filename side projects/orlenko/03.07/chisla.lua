
kolichestvomistakes=0
--lg=love.graphics
otveta=false
otvetb=true
otvetc=true

x=333
y=444
math.randomseed (os.time())
local function rand(n)
	local a = math.random()*n
	a = math.floor(a)
	return a
end	

--a = math.floor(math.random()+0.5)	

--a = rand(5)
--print(a)
--a = rand(5)
--print(a)
--a = rand(5)
--print(a)

--a = rand
--x,y = love.mouse.getPosition()

a=rand(5)

--if love.keyboard.isDown("1") then
--	if a==1 then
--		lg.print (" you are right,you made" kolichestvomistakes "misstakes")
--	else
--		lg.print ("it is not right ):")
--		kolichestvomistakes=kolichestvomistakes+1
--	end
--end

local b = io.read()
b=tonumber(b)

while a~=b do
if a==b then
	print("you are right")
else
	print("it,is notright")
	--print(a)
	end
end