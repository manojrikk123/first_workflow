# Define parameters
param (
    [string]$pcfenv = "dev-pcf",
    [string]$channels,  # Comma-separated list of channels provided by TeamCity
    [string]$space = "ymz",
    [string]$foundation = "myz01",
    [string]$appnames  # Comma-separated list of appnames provided by TeamCity
)

# Check if channels and appnames parameters are provided
if (-not $channels -or -not $appnames) {
    Write-Host "Error: 'channels' and 'appnames' parameters are required."
    Exit 1
}

# Split the channels and appnames strings into arrays
$channelsArray = $channels -split ','
$appnamesArray = $appnames -split ','

# Loop through each channel
foreach ($channel in $channelsArray) {
    # Define the base command for this channel
    $baseCommand = "dws pcf operation action --pcfenv $pcfenv --channel $channel --space $space --action=stop --foundation $foundation"

    # Loop through each appname and construct the full command
    foreach ($appname in $appnamesArray) {
        $fullCommand = "$baseCommand --appname $appname"
        Write-Host "Executing command: $fullCommand"
        Invoke-Expression $fullCommand
        Write-Host "Command executed for $appname in channel $channel."
    }
}

Write-Host "All microservices stopped successfully for all channels."
