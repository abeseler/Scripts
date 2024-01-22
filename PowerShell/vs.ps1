Set-Alias -Name vs -Value Invoke-VisualStudio
function Invoke-VisualStudio {
	param (
		[string]$repo
	)
	if ($null -eq $repo) {
		$path = Get-Location
		$solution = Get-ChildItem -Path $path -Filter *.sln | Select-Object -First 1
	}
	elseif (Test-Path "$env:DEVDRIVE\$repo") {
		$path = "$env:DEVDRIVE\$repo"
		$solution = Get-ChildItem -Path $path -Filter *.sln | Select-Object -First 1
	}
	elseif (Test-Path "$repo") {
		$path = "$repo"
		$solution = Get-ChildItem -Path $path -Filter *.sln | Select-Object -First 1
	}

	if ($null -eq $solution) {
		Write-Error "No solution found in $path"
	}
	else {
		$solution | Invoke-Item
	}
}