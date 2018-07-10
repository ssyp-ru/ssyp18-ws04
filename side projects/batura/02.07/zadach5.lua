--print("Напиши своё имя")
--ima = io.read()
--print("Привет, ", ima)
--print("разгадайте число от одного до пяти")
--zagadal = 3
--chislo = io.read()

--if zagadal==chislo then
--	print("вы угадали")
--else
--	print("вы не угадали")
--end
ugadal=0

print("сколько тебе лет?")
chislolet = tonumber(io.read())
class = chislolet-6
if chislolet<6 then
	print("ты в детском садике")
elseif chislolet>17 then
	print("ты слишком большой")
else
	print("ты в ".. class .." классе")
end

--chislolet = 12



print("сколько ног у козы?")
otveti = io.read()
if otveti == 4 then
	ugadal=ugadal+1
end
print("сколько будет 2+2*2")
otveti2 = io.read()
if otveti2 == 6 then
	ugadal=ugadal+1
end
print("из  чего можно сделать стекло")
print(" 1 - железо, 2 - бетон, 3 - песок")
otveti3 = io.read()
if otveti3 == 3 then
	ugadal=ugadal+1
end
print("как называется угол похожий на прямую")
print(" 1 - острый , 2 - развёрнутый, 3 - тупой")
otveti4 = io.read()
if otveti4 == "развёрнутый" then
	ugadal=ugadal+1
end
if ugadal==0 then
	print("оценка 5")
end
if ugadal==1 then
	print("оценка 4")
end
if ugadal==2 then
	print("оценка 3")
end
if ugadal==3 then
	print("оценка 2")
end
if ugadal==4 then
	print("оценка 1")
end

