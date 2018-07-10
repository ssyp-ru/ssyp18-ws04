
miss=0
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


--print("i zagadal chislo 0-5 you dolchen nayty ego")

--a = math.floor(math.random()+0.5)	

--a = rand(5)
--print(a)
--a = rand(5)
--print(a)
--a = rand(5)
--print(a)

--a = rand
--x,y = love.mouse.getPosition
print("napischi chilo do kotorgo I zagdayu")
local god = io.read()
god=tonumber(god)
a=rand(god)
--print("i zagadal chislo 0  you dolchen nayty ego")
--a=3
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
	--	if a==b then
	--		print("you are right")
	--	else
	--		print("it,is notright")
	--		--print(a)
	--		local b = io.read()
	--		b=tonumber(b)
	if a<b then
		print("mensche")
		b = io.read()
		b=tonumber(b)
		miss=miss+1
	elseif a>b then
		print("bolsche")
		b = io.read()
		b=tonumber(b)
		miss=miss+1
	end
end
if miss==0 then
	print("good,idealno")
else
	print("good ,misstakes:"..miss)
end