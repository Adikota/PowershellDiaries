# Location to Save the outlook attachments
$save = 'C:\output\'
 
Add-type -assembly "Microsoft.Office.Interop.Outlook" | out-null

$olFolders = "Microsoft.Office.Interop.Outlook.olDefaultFolders" -as [type]



$outlook = new-object -comobject outlook.application

$namespace = $outlook.GetNameSpace("MAPI")

$folder = $namespace.getDefaultFolder($olFolders::olFolderInbox)

$folItems = $folder.Items

$folFilteredItems = $folItems.Restrict("[UnRead] = True")

ForEach ($objMessage in $folFilteredItems)
 {
    $intCount = $objMessage.Attachments.Count
    If ($intCount -gt 0) 
    {
        For ($i=1; $i -le $intCount; $i++) 
        {
            $objMessage.Attachments.Item($i).SaveAsFile($save +
                $objMessage.Attachments.Item($i).FileName)
        }
    }
    $objMessage.Unread = $false
}


#if you want to write the email content to the database but not the attachment since it is a COM object and to handle a comobject we need openrowset custom sql script

#$Inputdata = $folder.items | Select-Object -Property SenderName,ReceivedTime,Subject,body | Select-Object -first 100 


#Write-SqlTableData -ServerInstance RDBDDM06DEV -DatabaseName AlwaysEncrypted -SchemaName dbo -TableName EmailSave -InputData $Inputdata