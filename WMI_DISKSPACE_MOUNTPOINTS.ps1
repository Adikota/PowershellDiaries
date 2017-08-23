Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" -ComputerName ServerName1,ServerName2,ServerName3 | Select SystemName,DeviceID,VolumeName,@{Name="Size";Expression={"{0:N1}" -f($_.size/1gb)}},@{Name="FreeSpace";Expression={"{0:N1}"-f($_.freespace/1gb)}},@{Name="FreespacePcnt";Expression={"{0:N1}"-f((($_.freespace/1gb)/($_.size/1gb)*100.00))}} | Out-GridView

