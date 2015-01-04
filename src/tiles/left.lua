local tile = {}

function tile.newscheme(area,n,config)

	print(area.x,area.y,area.w,area.h)
	print(config.padding)

	return {tile = function() end}
end

return tile