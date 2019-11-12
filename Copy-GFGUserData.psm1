<#Copy Google Chrome Bookmarks, Desktop, Documents, Favorites, Links, Pictures, Videos#>
function Copy-GFGUserData{    
param (
        [CmdletBinding()]
        [Parameter(Mandatory=$true)]
        [string]$source,
        [Parameter(Mandatory=$true)]
        [string]$destination,
        [Parameter(Mandatory=$true)]
        [string]$user
               
    )
    
#RemoteCopy
<#Chrome needs to be launched first on new machine before script runs or it will not transfer the bookmarks, 
instead leaves an invalid Chrome Profile#>
Copy-Item "\\$source\c$\users\$user\AppData\Local\Google\Chrome\User Data\Default\Bookmarks" -Destination "\\$destination\c$\users\$user\AppData\Local\Google\Chrome\User Data\Default" -Verbose
Copy-Item "\\$source\c$\users\$user\Desktop\*" -Recurse -Force -Destination "\\$destination\c$\users\$user\Desktop\" -Verbose
Copy-Item "\\$source\c$\users\$user\Documents\*" -Recurse -Force -Exclude "My Music","My Pictures","My Videos" -Destination "\\$destination\c$\users\$user\Documents\" -Verbose
Copy-Item "\\$source\c$\users\$user\Downloads\*" -Recurse -Force -Destination "\\$destination\c$\users\$user\Downloads\" -Verbose
Copy-Item "\\$source\c$\users\$user\Favorites\*" -Recurse -Force -Destination "\\$destination\c$\users\$user\Favorites\" -Verbose
Copy-Item "\\$source\c$\users\$user\Links\*" -Recurse -Force -Destination "\\$destination\c$\users\$user\Links\" -Verbose
Copy-Item "\\$source\c$\users\$user\Pictures\*" -Recurse -Force -Destination "\\$destination\c$\users\$user\Pictures\" -Verbose
Copy-Item "\\$source\c$\users\$user\Videos\*" -Recurse -Force -Destination "\\$destination\c$\users\$user\Videos\" -Verbose

} #EndFunction