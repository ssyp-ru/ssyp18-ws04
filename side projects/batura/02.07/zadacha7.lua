--Повторятель
s2 = ""
print("введите слово")
s = io.read()
print("введите число сколько раз его повторить")
r = io.read()
print("я повторяю слово "..r.." раз")
while r~=0 do
	s2 = s2 .. s
	r=r-1
end
print(s2)
