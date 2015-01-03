config = {
	window = {
		borders = {
			--  This is for bbLeanSkin/TrueTransparency(?) users.
	--[[	top = 23,
			bottom = 4,
			left = 4,
			right = 4	]]
		},
		borderexclusions = {
			--  Window classes that don't use bbLeanSkin/TT
		},
		padding = 3, --  Space between windows
		exclude = {
			--  Window classes to exclude from tiling
			"Internet Explorer_Hidden",
			"WorkerW",
			"EdgeUiInputTopWndClass"
		},
	}
}