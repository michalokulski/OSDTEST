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


# Create a new PowerShell process
    # Display warning message in red
    Write-Host $HLLogo -ForegroundColor DarkBlue
    Write-Host "`n WARNING !" -ForegroundColor Red
    Write-Host "If you proceed with the provided input, ALL content on your disk drive will be PERMANENTLY DELETED." -ForegroundColor Red
    Write-Host "This includes but is not limited to:" -ForegroundColor Red
    Write-Host "- All installed applications" -ForegroundColor Red
    Write-Host "- All personal and system files" -ForegroundColor Red
    Write-Host "- All system configurations" -ForegroundColor Red
    Write-Host "Data that is deleted in this manner CANNOT BE RECOVERED. " -ForegroundColor Red
    Write-Host "If you have any files or data that you wish to keep, please ensure that you have created a secure backup." -ForegroundColor Red
    Write-Host "Please consider the consequences carefully before proceeding." -ForegroundColor Red
    Write-Host "Once the data is deleted, it will be gone forever. Proceed with extreme caution.`n" -ForegroundColor Red

    Write-Host "`n"
    Write-Host "If you do NOT WANT to Continue type NO or manually reboot notebook! `n" -ForegroundColor Yellow

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
