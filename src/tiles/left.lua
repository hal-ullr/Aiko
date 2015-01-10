local tile = {}

function tile.newscheme(area,n)

	--  print(area.x,area.y,area.w,area.h)
	--  print(config.padding)

	local x,y,w,h = area.x,area.y,area.w,area.h
	local p = config.padding

	local tile = {winspaces = {}}

	table.insert(tile.winspaces, {
		x = x + p,
		y = y + p,
		w = math.floor(w / 2 - (1.5 * p)),
		h = h - (2 * p)
	})

	local winh = math.floor((h - (n * p)) / (n - 1))
	local winy = p -- ((h - (n * p)) / (n - 1)) * (i - 1) + (p * i)

	-- The number of windows required to be a pixel taller
	-- than the average to fill the screen
	
	-- bbLean
	local borders = ahk.getwindowborders()
	local cborders = config.borders
	local mborders = {left = 0, right = 0, top = 0, bottom = 0}

	if not compare(borders,cborders) and cborders.top then
		local l,r = borders.left - cborders.left, borders.right - cborders.right
		local t,b = borders.top - cborders.top, borders.bottom - cborders.bottom
		print(l,r,t,b)
		mborders.left,mborders.right = l,r
		mborders.top,mborders.bottom = t,b
	end

	tile.mborders = mborders

	local lwins = h - (winh * (n - 1) + p*n)

	for i = 1,n-1 do
		winspace = {
			x = x + math.floor(w / 2 + (p / 2)),
			y = winy,
			w = math.ceil(w / 2 - (1.5 * p)),
			h = winh + (i <= lwins and 1 or 0)
			-- Currently the windows that need to be a pixel larger go at the top
		}

		winy = winy + winspace.h + p

		table.insert(tile.winspaces,winspace)
	end

	tile.tile = function(self,windows)

		local order = {}

		for _,window in pairs(config.favor) do
			for rkey,rwindow in pairs(windows) do
				if winmatch(rwindow,window) then
					table.insert(order,rkey)
				end
			end
		end

		for key,_ in pairs(windows) do
			if not contains(order,key) then
				table.insert(order,key)
			end
		end

		for key,winspace in pairs(tile.winspaces) do
			x,y,w,h = winspace.x,winspace.y,winspace.w,winspace.h
			-- Account for bbLean

			for _,id in pairs(config.borderexclusions) do
				local classch = ID(windows[order[key]]) == id
				local namech = windows[order[key]].pname == id
				if not (namech or classch) then
					local l,r = tile.mborders.left,tile.mborders.right
					local t,b = tile.mborders.top,tile.mborders.bottom
					print(t+b)
					y = y - t
					x = x - l
					h = h + (t + b)
					w = w + (l + r)
				end
			end

			WinMove(ahkID(order[key]),_,x,y,w,h)
		end
	end

	return tile
end

return tile