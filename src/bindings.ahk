__ahk_winlist()
{
	Global
	WinGet, id, list
	Loop, %id%
	{
	    this_id := id%A_Index%
		lua_getglobal(L, "__lua_winlist_callback")
		lua_pushstring(L, this_id)
		lua_call(L, 1, 0)
	}
}

__ahk_getwindowborders()
{
	Global
	SysGet, borderx, 32 
	SysGet, bordery, 33
	SysGet, borderh, 4
	lua_getglobal(L, "__lua_wb_callback")
	lua_pushnumber(L, borderx)
	lua_pushnumber(L, bordery)
	lua_pushnumber(L, borderh)
	lua_call(L, 3, 0)
}

__ahk_gettitle(L)
{
	n := lua_gettop(L)
	this_id := lua_tostring(L, n)
	WinGetTitle, this_title, ahk_id %this_id%
	lua_getglobal(L, "__lua_gt_callback")
	lua_pushstring(L, this_title)
	lua_call(L, 1, 0)
}

__ahk_getclass(L)
{
	n := lua_gettop(L)
	this_id := lua_tostring(L, n)
	WinGetClass, this_class, ahk_id %this_id%
	lua_getglobal(L, "__lua_gc_callback")
	lua_pushstring(L, this_class)
	lua_call(L, 1, 0)
}

__ahk_getprocessname(L)
{
	n := lua_gettop(L)
	this_id := lua_tostring(L, n)
	WinGet, pname, ProcessName, ahk_id %this_id%
	lua_getglobal(L, "__lua_gprocname_callback")
	lua_pushstring(L, pname)
	lua_call(L, 1, 0)
}

__ahk_getpos(L)
{
	n := lua_gettop(L)
	this_id := lua_tostring(L, n)
	WinGetPos, pX, pY, pW, pH, ahk_id %this_id%
	lua_getglobal(L, "__lua_gpos_callback")
	lua_pushstring(L, pX)
	lua_pushstring(L, pY)
	lua_pushstring(L, pW)
	lua_pushstring(L, pH)
	lua_call(L, 4, 0)
}

__ahk_getminmax(L)
{
	n := lua_gettop(L)
	this_id := lua_tostring(L, n)
	WinGet, state, MinMax, ahk_id %this_id%
	lua_getglobal(L, "__lua_gmm_callback")
	lua_pushstring(L, state)
	lua_call(L, 1, 0)
}



print(L)
{
	n := lua_gettop(L)
	str := lua_tostring(L, n)
	FileAppend, %str%`n, con
}



lua_register(L, "__ahk_winlist", RegisterCallback("__ahk_winlist","C"))
lua_register(L, "__ahk_getwindowborders", RegisterCallback("__ahk_getwindowborders","C"))
lua_register(L, "__ahk_gettitle", RegisterCallback("__ahk_gettitle","C"))
lua_register(L, "__ahk_getclass", RegisterCallback("__ahk_getclass","C"))
lua_register(L, "__ahk_getprocessname", RegisterCallback("__ahk_getprocessname","C"))
lua_register(L, "__ahk_getpos", RegisterCallback("__ahk_getpos","C"))
lua_register(L, "__ahk_getminmax", RegisterCallback("__ahk_getminmax","C"))
lua_register(L, "print", RegisterCallback("print","C"))