function getwindows()
	local windows = {}

	for _,window in pairs(ahk.winlist()) do
		local x,y,w,h = WinGetPos(ahk.id(window))

		windows[window] = {
			pname = WinGet("ProcessName",ahk.id(window)),
			class = WinGetClass(ahk.id(window)),
			title = WinGetTitle(window),
			position = ("%s,%s"):format(x,y),
			minmax = WinGet("MinMax",ahk.id(window)),
			size = ("%s,%s"):format(w,h)
		}
	end

	return windows
end

function ID(window)
	return table.concat({window.pname,window.class},":")
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

function excludeClasses(arr,arr2)
	for key,val in pairs(arr) do
		if contains(arr2,ID(val)) then
			arr[key] = nil
		end
	end
	return arr
end

function excludeIDs(arr,arr2)
	for _,key in pairs(arr2) do
		arr[key] = nil
	end
	return arr
end


function length(arr)
	i = 0
	for _,_ in pairs(arr) do
		i = i + 1
	end
	return i
end

function minimized(windows)
	local ids = {}
	for id,window in pairs(windows) do
		if window.minmax == "-1" then
			table.insert(ids,id)
		end
	end
	return ids
end