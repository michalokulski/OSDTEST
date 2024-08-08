$HLLogo       = @"

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
$command1 = { Write-Output "Executing Command 1" }
$command2 = { Write-Output "Executing Command 2" }
$command3 = { Write-Output "Executing Command 3" }
$command4 = { Write-Output "Executing Command 4" }

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
        default { Write-Output "Invalid input" }
    }
}


# Create a new PowerShell process
    # Display warning message in red
    Write-Host $HLLogo -ForegroundColor DarkBlue
    Write-Host $text -ForegroundColor Red
    Write-Host "1 - Rebuild Windows OS using Azure `n" -ForegroundColor Yellow
    Write-Host "1 - Rebuild Windows OS using Offline Windows 10 Image `n" -ForegroundColor Yellow
    Write-Host "1 - Create Windows OS reinstallation USB `n" -ForegroundColor Yellow
    Write-Host "1 - Update Windows OS reinstallation USB `n" -ForegroundColor Yellow
# Example usage
    $input = Read-Host "Enter input (1, 2, or 3)"
    Execute-Command -input $input
    
