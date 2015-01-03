local borders = ahk.getwindowborders()

function getwindows()
	local windows = {}

	for _,window in pairs(ahk.winlist()) do
		local x,y,w,h = ahk.getpos(window)
		windows[window] = {
			pname = ahk.getprocessname(window),
			class = ahk.getclass(window),
			title = ahk.gettitle(window),
			position = {x,y},
			size = {w,h}
		}
	end

	return windows
end

windows = getwindows()

for id,window in pairs(windows) do
	ahk.print(id..":")
	for key,value in pairs(window) do
		ahk.print("  "..key.." "..(tostring(value) or "NaS"))
	end
	ahk.print("\n")
end