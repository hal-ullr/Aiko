local layouts = require "modules/layouts"

window = {
	borders = {
		--  This is for bbLeanSkin/TrueTransparency(?) users.
		top = 23,
		bottom = 4,
		left = 4,
		right = 4
	}
}

tile = {
	layouts = {
		layouts.floating,
		layouts.stacks
	}
}