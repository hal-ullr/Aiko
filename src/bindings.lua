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

do
	local table = {}

	function __lua_wb_callback(...)
		table = {...}
	end

	ahk.getwindowborders = function()
		table = nil
		__ahk_getwindowborders()
		x,y,h = unpack(table)
		return {top = y+h,bottom=y,left=x,right=x}
	end
end

do
	local title

	function __lua_gt_callback(str)
		title = str
	end

	function ahk.gettitle(id)
		__ahk_gettitle(id)
		return title
	end
end

do
	local class

	function __lua_gc_callback(str)
		class = str
	end

	function ahk.getclass(id)
		__ahk_getclass(id)
		return class
	end
end

do
	local processname

	function __lua_gprocname_callback(str)
		processname = str
	end

	function ahk.getprocessname(id)
		__ahk_getprocessname(id)
		return processname
	end
end

do
	local x,y,w,h

	function __lua_gpos_callback(px,py,pw,ph)
		x,y,w,h = px,py,pw,ph
	end

	function ahk.getpos(id)
		__ahk_getpos(id)
		return x,y,w,h
	end
end

function ahk.print(str)
	__ahk_print(str)
end