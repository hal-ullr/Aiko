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

ahk.deskarea = function()
	top,bottom,left,right = __ahk_getarea()
	return {
		x = left,
		y = top,
		w = right-left,
		h = bottom-top
	}
end