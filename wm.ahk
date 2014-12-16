/*

  Aiko - some kind of shit wot never was any good.

*/

NAME  := "Aiko"
VERSION := "1"

#include vendor\lua.ahk

#SingleInstance, force

hDll := lua_loadDll("lua51.dll")
L := luaL_newstate()
OnExit, OnExit
luaL_openlibs(L)
lua_registerAhkFunction(L)

luaL_dofile(L, "wm.lua")

OnExit:
	lua_close(L)
	lua_UnloadDll(hDll)
	ExitApp
Return

