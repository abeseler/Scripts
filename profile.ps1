oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/amro.omp.json" | Invoke-Expression
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

if ($null -eq $env:DEVDRIVE) {
	Write-Error "Missing environment variable: DEVDRIVE"
	return
}

$basePath = $env:DEVDRIVE.Replace("\", "/")
if (Test-Path "$basePath/Scripts/PowerShell") {
	Get-ChildItem "$basePath/Scripts/PowerShell/*.ps1" | ForEach-Object { . $_.FullName }
}
else {
	Write-Error "Missing PowerShell scripts folder: $basePath/Scripts/PowerShell"+-
}