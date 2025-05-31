# step 1 -- create a backup folder
$backupFolder = "DevOpsWorkshop_" + (Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")            
New-Item -itemType Directory -Path C:\inetpub\wwwroot\Backup -Name $backupFolder
$backupFolder = "C:\inetpub\wwwroot\Backup\" + $backupFolder 

# step-2 -- copy files to the backup folder
$DevOpsWorkshopFolderPath = "C:\inetpub\wwwroot\DevOpsWorkshop\"
Copy-Item -Path $DevOpsWorkshopFolderPath -Destination $backupFolder -Force -Recurse

# step 3 Cleanup the UI folder files 
function DeleteIfExistsAndCreateEmptyFolder($dir )
{
    if ( Test-Path $dir ) {    
           Get-ChildItem -Path  $dir -Force -Recurse | Remove-Item -Force -Recurse          
    }
}
DeleteIfExistsAndCreateEmptyFolder($UIFolderPath )


# step 4 copy the new files to api folder
$dllpath = "C:\inetpub\wwwroot\DevOpsWorkshop\*"
Copy-Item $dllpath $DevOpsWorkshopFolderPath -Force -Recurse
