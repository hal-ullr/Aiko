require "src/config"
require "src/lib"

local windows = exclude(getwindows(),config.exclude)

dumpwindows(windows)