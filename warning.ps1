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

$text = "`n WARNING !`n" + `
"If you proceed further, ALL content on your disk drive will be PERMANENTLY DELETED.`n" + `
"This includes but is not limited to:`n" + `
"- All installed applications`n" + `
"- All personal and system files`n" + `
"- All system configurations`n" + `
"Data that is deleted CANNOT BE RECOVERED. `n" + `
"If you have any files or data that you wish to keep, please ensure that you have created a secure backup.`n" + `
"Please consider the consequences carefully before proceeding.`n" + `
"Once the data is deleted, it will be gone forever. Proceed with extreme caution.`n"

# Create a new PowerShell process
    # Display warning message in red
    Write-Host $HLLogo -ForegroundColor DarkBlue
    Write-Host $text -ForegroundColor Red
    Write-Host "If you want to CANCEL type NO or CANCEL or manually reboot notebook! `n" -ForegroundColor Yellow
    Write-Host "If you want to proceed type UNDERSTAND `n" -ForegroundColor Red
    

    # Loop until the user enters "UNDERSTAND"
    while ($true) {
        # Prompt the user for input
        $input = Read-Host "Enter a command (type UNDERSTAND to wipe disk and continue with Windows OS Reinstallation)"

        # If the user entered "UNDERSTAND", exit the script
        if ($input -eq "UNDERSTAND") {
            exit
        }
        else {
            # If the user entered anything other than "UNDERSTAND", restart the computer
            Restart-Computer -Force
        }
    }
