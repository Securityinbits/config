### PowerShell template profile 
### Version 1.00
### 
### Current User, All Hosts - Windows - $HOME\Documents\PowerShell\Profile.ps1
### This file should be stored in $PROFILE.CurrentUserAllHosts
### If $PROFILE.CurrentUserAllHosts doesn't exist, you can make one with the following:
### New-Item -ItemType File -Path $PROFILE.CurrentUserAllHosts -Force
### This will create the file and the containing subdirectory if it doesn't already
###
### As a reminder, to enable unsigned script execution of local scripts on client Windows, 
### you need to run this line (or similar) from an elevated PowerShell prompt:
###   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
### This is the default policy on Windows Server 2012 R2 and above for server Windows. For 
### more information about execution policies, run Get-Help about_Execution_Policies.


# Useful shortcuts for traversing directories
# Thanks to https://gist.github.com/timsneath/19867b12eee7fd5af2ba
function cd...  { cd ..\.. }
function cd.... { cd ..\..\.. }

# Get md5,sha256 and file name , input support multiple string with wildcard
function hashes {
    Get-ChildItem -Path $args -Force -Recurse -File |
    Select-Object @{Name='MD5';E={(Get-FileHash -Algorithm MD5 $_).Hash}}, 
    @{N='SHA256';E={(Get-FileHash -Algorithm SHA256 $_).Hash}},Name
}
function md5 {
    Get-ChildItem -Path $args -Force -Recurse -File | 
    Select-Object @{Name='MD5';E={(Get-FileHash -Algorithm MD5 $_).Hash}}, Name
}
function sha256 {
    Get-ChildItem -Path $args -Force -Recurse -File | 
    Select-Object @{Name='SHA256';E={(Get-FileHash -Algorithm SHA256 $_).Hash}}, Name
}