require "src/config"

local borders = ahk.getwindowborders()

function getwindows()
	local windows = {}

	for _,window in pairs(ahk.winlist()) do
		local x,y,w,h = ahk.getpos(window)
		local min,max = ahk.getminmax(window)
		windows[window] = {
			pname = ahk.getprocessname(window),
			class = ahk.getclass(window),
			title = ahk.gettitle(window),
			position = ("%s,%s"):format(x,y),
			min = min,
			max = max,
			size = ("%s,%s"):format(w,h)
		}
	end

	return windows
end

function dumpwindows(windows)
	for id,window in pairs(windows) do
		print(id..":")
		for key,value in pairs(window) do
			print("  "..key.." "..(tostring(value) or "NaS"))
		end
		print("\n")
	end
end

function contains(arr,val)
	for key,cval in pairs(arr) do
		if val == cval then
			return true
		end
	end
end

windows = getwindows()

for key,window in pairs(windows) do
	if contains(config.window.exclude,window.class) then
		windows[key] = nil
	end
end

dumpwindows(windows)