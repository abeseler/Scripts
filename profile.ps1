oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/amro.omp.json" | Invoke-Expression
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

if ($null -eq $env:DEVDRIVE) {
	Write-Error "Missing environment variable: DEVDRIVE"
}	

Import-Module "$env:DEVDRIVE\Scripts\db.ps1"
Import-Module "$env:DEVDRIVE\Scripts\vs.ps1"
