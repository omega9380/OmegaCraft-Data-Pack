$time = Get-Date -UFormat %H%M%S
$date = Get-Date -UFormat %Y%m%d
$timestamp = $date + "T" + $time
$zipfile = "omegadata.zip"
#$location = "Q:\games\Minecraft\textureedit"
$zip = ".\release\" + $zipfile
$destination = ".\backup\backup_omegadata_" + $timestamp + ".zip"
$working = ".\omegadata"
$git = "."

if (!(Test-Path "./backup")){
	New-Item -Path . -Name "backup" -ItemType "directory"
	}

if (!(Test-Path "./release")){
	New-Item -Path . -Name "release" -ItemType "directory"
	}	

# Backup resource pack
	if (Test-Path $zip){
		Write-Host "Backing up $zip..."
		Copy-Item -Path $zip -Destination $destination
		Write-Host "Done."
	}
	else {
		Write-Host "$zip not found.  Creating a new one..."
	}

# Create new pack and move it
	if (!(Test-Path $zip)) {
		7z a $zip "$working\*"
	}
	else {
		7z u -up0q0r2x2y2z1w2 $zip "$working\*"
	}
	
#	Move-Item -Path "$location\omegacraft14.zip" -Destination "$location\omegacraft14.zip" -Force

# Calculate SHA1 hash for server deployment
	$Hash = Get-FileHash -Algorithm SHA1 $zip
	Write-Host "`nSHA1 Hash: " $Hash.Hash
	Set-Clipboard -Value $Hash.Hash
	Write-Host "`nSHA1 Hash copied to clipboard."

# Copy resource pack to resource pack folder
	# Copy-Item $zip -Destination "$env:appdata\.minecraft\resourcepacks" -Force
	# Write-Host "`nCopied $zip to Minecraft resourcepacks folder."

# Send the resource pack to the server
	# scp -P 23466 $zip root@www:/var/www/snipeit/public/minecraft
	# ssh -p 23466 root@www 'chown -v snipeitapp:apache /var/www/snipeit/public/minecraft/omegacraft14.zip'
	# Write-Host "`nCopied to web server."

Write-Host "`nPress any key to continue...";
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

