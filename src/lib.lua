function print(...)
	local args = {...}
	
	for k,v in pairs(args) do
		args[k] = tostring(v) or "NaS"
	end

	__ahk_print(table.concat(args,"\009"))
end

function ahkID(str)
	return "ahk_id "..str
end

function compare(arr1,arr2)
	local keys = {}
	for key,_ in pairs(arr1) do table.insert(keys,key) end
	for key,_ in pairs(arr2) do table.insert(keys,key) end
	for _,key in pairs(keys) do
		if not (arr1[key] == arr2[key]) then
			return false
		end
	end
	return true
end

function ID(window)
	return table.concat({window.pname,window.class},":")
end

function winmatch(cwindow,window)
	return (
		table.concat({cwindow.pname,cwindow.class},":") == window
	) or (
		cwindow.pname == window
	)
end

function getwindows()
	local windows = {}

	for _,window in pairs(ahk.winlist()) do
		local x,y,w,h = WinGetPos(ahkID(window))

		windows[window] = {
			pname = WinGet("ProcessName",ahkID(window)),
			class = WinGetClass(ahkID(window)),
			title = WinGetTitle(window),
			position = ("%s,%s"):format(x,y),
			minmax = WinGet("MinMax",ahkID(window)),
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
	return false
end

function excludeClasses(arr,arr2)
	for key,val in pairs(arr) do
		if contains(arr2,ID(val)) or contains(arr2,val.pname) then
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