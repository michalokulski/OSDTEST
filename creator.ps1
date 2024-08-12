$HLLogo = @"
              %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
             %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
            %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
           %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
         %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
      %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
       %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
         %%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%%%%
"@

$text = @"
`n WARNING !
If you proceed further, ALL content on your disk drive might be PERMANENTLY DELETED.
`n
"@

# Define the commands for each input
$command1 = { StartOSDCloud -OSName 'Windows 10 22H2 x64' -OSLanguage en-us -OSEdition Enterprise -OSActivation Volume -Restart -ZTI }
$command2 = { StartOSDCloud -FindImageFile -OSImageIndex 1 -Restart -ZTI }
$command3 = { New-OSDCloudUSB -fromIsoUrl https://github.com/michalokulski/OSDTEST/releases/download/WinRE/HLAG.iso }
$command4 = { Update-OSDCloudUSB -DriverPack * -OS -OSActivation Volume -OSLanguage en-us -OSName "Windows 10 22H2 x64" -OSEdition Enterprise -Restart -ZTI }

# Function to execute the appropriate command based on input
function Execute-Command {
    param (
        [Parameter(Mandatory=$true)]
        [int]$input
    )

    switch ($input) {
        1 { & $command1 }
        2 { & $command2 }
        3 { & $command3 }
        4 { & $command4 }
        default { Write-Output "Invalid input" }
    }
}

# Create a new PowerShell process
# Display warning message in red
Write-Host $HLLogo -ForegroundColor Cyan
Write-Host $text -ForegroundColor Red
Write-Host "1 - Rebuild Windows OS using Azure `n" -ForegroundColor Yellow
Write-Host "2 - Rebuild Windows OS using Offline Windows 10 Image `n" -ForegroundColor Yellow
Write-Host "3 - Create Windows OS reinstallation USB `n" -ForegroundColor Yellow
Write-Host "4 - Update Windows OS reinstallation USB `n" -ForegroundColor Yellow

# Example usage
$input = Read-Host "Enter input (1, 2, 3, or 4)"
if ($input -match '^[1-4]$') {
    Execute-Command -input [int]$input
} else {
    Write-Output "Invalid input"
}
