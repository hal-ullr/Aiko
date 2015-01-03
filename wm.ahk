#include vendor/lua.ahk
#SingleInstance, force



hDll := lua_loadDll("vendor/lua51.dll")
L := luaL_newstate()
OnExit, OnExit
luaL_openlibs(L)
lua_registerAhkFunction(L)
ATTACH_PARENT_PROCESS = 0x0ffffffff ;
DllCall("AttachConsole", "UInt", ATTACH_PARENT_PROCESS)



luaL_dofile(L, "src/bindings.lua")
#include src/bindings.ahk
luaL_dofile(L, "src/wm.lua")



OnExit:
	lua_close(L)
	lua_UnloadDll(hDll)
	FileAppend, `n, con
	DllCall("FreeConsole")
	ExitApp
Return