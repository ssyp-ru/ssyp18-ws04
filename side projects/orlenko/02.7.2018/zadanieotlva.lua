--for i=1,100,1 do
--	for y=0,100,3 do
--		for a=0,100,5 do
--			for b=0,100,15 do
--				if i~=y or i~=a or i~=b then
--					print (i)
--				else
--					if i==y then
--						print ("fiz")
--					else
--						if i==a then
--							print(bass)
--							if i==b then
--								print(fizbass)
--							end
--						end
--					end
--				end
--			end
--		end
--	end
--end

for i = 1,100,1 do
	if  i%3==0 and i%5==0 then
		print ("fizbass")
	end
	if i%3==0 then
		print("fiz")
	end
	if i%5==0 then
		print("bass")
	end
	
	if 	 i%5~=0 and  i%3~=0 then
		print (i)
	end

end


