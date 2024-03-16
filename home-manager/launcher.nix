{ ... }:
{
	# app launcher used is tofi

	xdg.desktopEntries = {
		librewolf = {
			name = "LibreWolf";
			genericName = "Web Browser";
			exec = "librewolf";
			terminal = false;
			categories = [
				"Application"
				"Network"
				"WebBrowser"
			];
			mimeType = [
				"text/html"
				"text/xml"
			];
		};

		chromium = {
			name = "Chromium";
			genericName = "Web Browser";
			exec = "chromium";
			terminal = false;
			categories = [
				"Application"
				"Network"
				"WebBrowser"
			];
			mimeType = [
				"text/html"
				"text/xml"
			];
		};
	};
}
