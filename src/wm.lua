require("src/lib")

local tile = require("src/tiles/left")
local config = require("src/config")



local area = ahk.deskarea()

local windowstotile = getwindows()

windowstotile = excludeClasses(windowstotile,config.exclude)
windowstotile = excludeIDs(windowstotile,minimized(windowstotile))

dumpwindows(windowstotile)

local tiler = tile.newscheme(area,length(windowstotile),config)

tiler:tile(windowstotile)