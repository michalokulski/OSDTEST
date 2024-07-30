Start-Process powershell -ArgumentList @'
    # Display warning message
    Write-Host "`n⚠️ WARNING ⚠️"
    Write-Host "If you proceed with the provided input, ALL content on your disk drive will be PERMANENTLY DELETED. This includes but is not limited to:"
    Write-Host "- All installed applications"
    Write-Host "- All personal and system files"
    Write-Host "- All system configurations"
    Write-Host "Data that is deleted in this manner CANNOT BE RECOVERED. If you have any files or data that you wish to keep, please ensure that you have created a secure backup."
    Write-Host "Please consider the consequences carefully before proceeding. Once the data is deleted, it will be gone forever. Proceed with extreme caution.`n"

    # Loop until the user enters "UNDERSTAND"
    while ($true) {
        # Prompt the user for input
        $input = Read-Host "Enter a command (type UNDERSTAND if you are sure!)"

        # If the user entered "UNDERSTAND", exit the script
        if ($input -eq "UNDERSTAND") {
            exit
        }
        else {
            # If the user entered anything other than "UNDERSTAND", restart the computer
            #Restart-Computer -Force
        }
    }
'@
