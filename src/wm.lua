require("src/lib")
require("src/config")

local tile = require("src/tiles/left")

local area = ahk.deskarea()

local windowstotile = getwindows()

windowstotile = excludeClasses(windowstotile,config.exclude)
windowstotile = excludeIDs(windowstotile,minimized(windowstotile))

local tiler = tile.newscheme(area,length(windowstotile))

tiler:tile(windowstotile)
--dumpwindows(windowstotile)