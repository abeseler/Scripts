Set-Alias -Name vs -Value Invoke-VisualStudio
function Invoke-VisualStudio {
	param (
		[string]$repo
	)
	$basePath = $env:DEVDRIVE.Replace("\", "/")
	
	if ($null -eq $repo) {
		$path = Get-Location
		$solution = Get-ChildItem -Path $path -Filter *.sln | Select-Object -First 1
	}
	elseif (Test-Path "$basePath/$repo") {
		$path = "$basePath/$repo"
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