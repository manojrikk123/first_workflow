# Define parameters
param (
    [string]$pcfenv = "dev-pcf",
    [string]$channel = "xyz",
    [string]$space = "ymz",
    [string[]]$appnames = @("manoj", "Srin", "sou", "man"),
    [string]$foundation = "myz01"
)

# Define the base command
$baseCommand = "dws pcf operation action --pcfenv $pcfenv --channel $channel --space $space --action=stop --foundation $foundation"

# Loop through each appname and construct the full command
foreach ($appname in $appnames) {
    $fullCommand = "$baseCommand --appname $appname"
    Write-Host "Executing command: $fullCommand"
    Invoke-Expression $fullCommand
    Write-Host "Command executed for $appname."
}

Write-Host "All microservices stopped successfully."
