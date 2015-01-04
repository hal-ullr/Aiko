
__ahk_winlist(L)
{
	WinGet, id, list
	Loop, %id%
	{
	    this_id := id%A_Index%
		lua_getglobal(L, "__lua_winlist_callback")
		lua_pushstring(L, this_id)
		lua_call(L, 1, 0)
	}
}

__ahk_getwindowborders(L)
{
	SysGet, borderx, 32 
	SysGet, bordery, 33
	SysGet, borderh, 4
	lua_pushnumber(L, borderx)
	lua_pushnumber(L, bordery)
	lua_pushnumber(L, borderh)
	Return, 3
}

__ahk_getarea(L)
{
	SysGet, Area, MonitorWorkArea
	lua_pushnumber(L, AreaTop)
	lua_pushnumber(L, AreaBottom)
	lua_pushnumber(L, AreaLeft)
	lua_pushnumber(L, AreaRight)
	Return, 4
}



__ahk_print(L)
{
	n := lua_gettop(L)
	str := lua_tostring(L, n)
	FileAppend, %str%`n, con
}



lua_register(L, "__ahk_winlist", RegisterCallback("__ahk_winlist","C"))
lua_register(L, "__ahk_getwindowborders", RegisterCallback("__ahk_getwindowborders","C"))
lua_register(L, "__ahk_getarea", RegisterCallback("__ahk_getarea","C"))
lua_register(L, "__ahk_print", RegisterCallback("__ahk_print","C"))