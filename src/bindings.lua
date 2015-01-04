ahk = {}

do
	local windows = {}

	function __lua_winlist_callback(id)
		table.insert(windows,id)
	end

	ahk.winlist = function()
		windows = {}
		__ahk_winlist()
		return windows
	end
end

ahk.getwindowborders = function()
	x,y,h = __ahk_getwindowborders()
	return {top = y+h,bottom=y,left=x,right=x}
end

ahk.id = function(str)
	return "ahk_id "..str
end



function print(...)
	__ahk_print(table.concat({...},"\009"))
end