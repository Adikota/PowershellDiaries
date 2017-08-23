Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" -ComputerName RDBEDW01TS1,RDBEDW02TS1,RDBEDW03TS1| Select SystemName,DeviceID,VolumeName,@{Name="Size";Expression={"{0:N1}" -f($_.size/1gb)}},@{Name="FreeSpace";Expression={"{0:N1}"-f($_.freespace/1gb)}},@{Name="FreespacePcnt";Expression={"{0:N1}"-f((($_.freespace/1gb)/($_.size/1gb)*100.00))}} | Out-GridView



Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" -ComputerName RDBDDM06DEV| Select SystemName,DeviceID,VolumeName,@{Name="Size";Expression={"{0:N1}" -f($_.size/1gb)}},@{Name="FreeSpace";Expression={"{0:N1}"-f($_.freespace/1gb)}},@{Name="FreespacePcnt";Expression={"{0:N1}"-f((($_.freespace/1gb)/($_.size/1gb)*100.00))}} | Out-GridView



Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" -Credential $cred -ComputerName CLSOMA33ADEV.DEV.blueauth.com| Select SystemName,DeviceID,VolumeName,@{Name="Size";Expression={"{0:N1}" -f($_.size/1gb)}},@{Name="FreeSpace";Expression={"{0:N1}"-f($_.freespace/1gb)}},@{Name="FreespacePcnt";Expression={"{0:N1}"-f((($_.freespace/1gb)/($_.size/1gb)*100.00))}} | Out-GridView

