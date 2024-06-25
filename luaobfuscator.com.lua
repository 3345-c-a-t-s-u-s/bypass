local oldpcall = pcall;
local errortext = "attempt to index nil with number";
local new = tostring(script:GetFullName())..':1:'..errortext;

getfenv().pcall = function(a,b)
	local l,m = oldpcall(a,b);
	if m and string.find(m,errortext,1,true) then
		return l,new;
	end;
	return l,m;
end;

-- code here
