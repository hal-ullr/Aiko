config = {
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
		"Skype.exe:Internet Explorer_Hidden",
		"explorer.exe:WorkerW",
		"explorer.exe:Shell_TrayWnd",
		"explorer.exe:Progman",
		"explorer.exe:EdgeUiInputTopWndClass"
	},
	favor = {
		"chrome.exe:Chrome_WidgetWin_1"
	}
}