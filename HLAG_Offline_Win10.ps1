Set-ExecutionPolicy RemoteSigned -Force
Install-Module OSDBuilder -Force
Import-Module OSDBuilder -Force

#Init
Get-OSDBuilder

Import-OSMedia -BuildNetFX Enterprise -Update -SkipGrid

Update-OSMedia -Download -Execute

New-OSBuildTask -TaskName HLAG -CustomName HLAG
Update-OSMedia -Download -Execute
#Update optional updates
#Save-OSDBuilderDownload -UpdateOS 'Windows 10' -UpdateBuild 22H2 -UpdateArch x64 -UpdateGroup Optional -Download
New-OSBuild -ByTaskName HLAG -CreateISO -Download -Execute
