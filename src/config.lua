config = {
	borders = {
		--  This is for bbLeanSkin/TrueTransparency(?) users.
		--  Comment out to disable
		top = 3,
		bottom = 3,
		left = 3,
		right = 3
	},
	borderexclusions = {
		"chrome.exe", --  Window classes that don't use bbLeanSkin/TT
	},
	padding = 10, --  Space between windows
	exclude = {
		--  Window classes to exclude from tiling
		"Skype.exe:Internet Explorer_Hidden",
		"explorer.exe:WorkerW",
		"explorer.exe:Shell_TrayWnd",
		"explorer.exe:CabinetWClass",
		"explorer.exe:Progman",
		"explorer.exe:EdgeUiInputTopWndClass",
		"blackbox.exe:DesktopBackgroundClass",
		"Skype.exe:TConversationForm",
		"Skype.exe:tSkMainForm",
		"bbstylemaker.exe",
		"cmd.exe"
	},
	favor = {
		"chrome.exe"
	},
	tiles = {
		"left"
	}
}