# Define an array of commands to stop each microservice
$commands = @(
    "dws pcf operation action --pcfenv dev-pcf --channel xyz --space ymz --appname manoj --action=stop --foundation=myz01",
    "dws pcf operation action --pcfenv dev-pcf --channel xyz --space ymz --appname Srin --action=stop --foundation=myz01",
    "dws pcf operation action --pcfenv dev-pcf --channel xyz --space ymz --appname sou --action=stop --foundation=myz01",
    "dws pcf operation action --pcfenv dev-pcf --channel xyz --space ymz --appname man --action=stop --foundation=myz01"
)

# Loop through each command and execute it
foreach ($command in $commands) {
    Write-Host "Executing command: $command"
    Invoke-Expression $command
    Write-Host "Command executed."
}

Write-Host "All microservices stopped successfully."
