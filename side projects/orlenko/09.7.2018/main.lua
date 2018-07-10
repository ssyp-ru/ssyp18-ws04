--made by orlenko andrew
math.randomseed (os.time())
local function rand(n)
	local a = math.random()*n
	a = math.floor(a)
	return a
end	
a=rand(100)
b=rand(10)
time1=os.time()
print (a.."*"..b)
d=io.read()
d=tonumber(d)
time2=os.time()
time3=time2-time1
otvet=a*b
if d==otvet then
	if time3<=2 then
		print("kruteyshuy")
	elseif time3>2 and time3<=6 then
		print ("molodec")
	elseif time3>6 and time3<=10 then
		print ("norm")
	elseif time3>10 then
		print("ne ochen")
	end
end
if d~=otvet then
	print("otvet ne pravilnuy")
	end