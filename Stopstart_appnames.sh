# Define parameters
param (
    [string]$pcfenv = "dev-pcf",
    [string]$channel = "xyz",
    [string]$space = "ymz",
    [string]$foundation = "myz01",
    [string]$appnames  # No default value specified, will be provided by TeamCity
)

# Check if appnames parameter is provided
if (-not $appnames) {
    Write-Host "Error: 'appnames' parameter is required."
    Exit 1
}

# Define the base command
$baseCommand = "dws pcf operation action --pcfenv $pcfenv --channel $channel --space $space --action=stop --foundation $foundation"

# Split the appnames string into an array
$appnamesArray = $appnames -split ','

# Loop through each appname and construct the full command
foreach ($appname in $appnamesArray) {
    $fullCommand = "$baseCommand --appname $appname"
    Write-Host "Executing command: $fullCommand"
    Invoke-Expression $fullCommand
    Write-Host "Command executed for $appname."
}

Write-Host "All microservices stopped successfully."
