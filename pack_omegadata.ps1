$time = Get-Date -UFormat %H%M%S
$date = Get-Date -UFormat %Y%m%d
$timestamp = $date + "T" + $time
$zipfile = "omegadata.zip"
$location = "Q:\games\Minecraft\textureedit"
$zip = $location + "\packed\" + $zipfile
$working = $location + "\OmegaCraft-Data-Pack\omegadata"
$git = $location + "\OmegaCraft-Resource-Pack"

# Create new pack and move it
	if (!(Test-Path $zip)) {
		7z a $zip "$working\*"
	}
	else {
		7z u -up0q0r2x2y2z1w2 $zip "$working\*"
	}
	
Write-Host "`nPress any key to continue...";
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

