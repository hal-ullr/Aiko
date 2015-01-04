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
	local winy = 3 -- ((h - (n * p)) / (n - 1)) * (i - 1) + (p * i)

	-- The number of windows required to be a pixel taller
	-- than the average to fill the screen
	
	local lwins = h - (winh * (n - 1) + p*n)

	for i = 1,n-1 do
		winspace = {
			x = x + math.floor(w / 2 + (p / 2)),
			y = winy,
			w = math.ceil(w / 2 - (1.5 * p)),
			h = winh + (i <= lwins and 1 or 0)
			-- Currently the windows that need to be a pixel larger go at the top
		}

		winy = winy + winspace.h + 3

		table.insert(tile.winspaces,winspace)
	end

	tile.tile = function(self,windows)

		local order = {}

		for _,window in pairs(config.favor) do
			for rkey,rwindow in pairs(windows) do
				if ID(rwindow) == window then
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
			WinMove(ahkID(order[key]),_,x,y,w,h)
		end
	end

	return tile
end

return tile