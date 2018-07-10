--Калькулятор
q=0
w=0

print("введите число 1")
q=io.read()
print("введите число 2")
w=io.read()

print("сложить, вводи + ")
print("вычесть, вводи - ")
print("умножить, вводи * ")
print("разделить, вводи / ")
znak = io.read()

if znak == '+' then
	print("= "..q+w)
elseif znak == '-' then
print("= "..q-w)
elseif znak == '/' then
print("= "..q/w)
else
print("= "..q*w)
end