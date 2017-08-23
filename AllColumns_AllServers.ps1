$servers = Invoke-Sqlcmd -ServerInstance DataMgmtDBPRD -Database DDMCMDB -Query "select InstanceName from MasterInstanceList"

Invoke-SqlCmd -ServerInstance DataMgmtDBPRD -DatabaseName DataMgmt -Query "TRUNCATE TABLE ColumnList"

foreach ($server in $servers)
{
   
    $dbName = Invoke-Sqlcmd -ServerInstance $server.InstanceName -Database Master -Query "select name from sys.databases where database_id > 4 and name not in('DataMgmt')"

    foreach($db in $dbName)
    {
      $coldata =  Invoke-Sqlcmd -ServerInstance $server.InstanceName -Database $db.name -Query "select @@SERVERNAME AS ServerName,DB_NAME() AS DBName,A.TABLE_NAME,COLUMN_NAME,DATA_TYPE
                                                                                from INFORMATION_SCHEMA.columns A
                                                                                JOIN INFORMATION_SCHEMA.TABLES B
                                                                                on A.TABLE_SCHEMA = B.TABLE_SCHEMA
                                                                                AND A.TABLE_NAME = B.TABLE_NAME
                                                                                where B.TABLE_TYPE = 'BASE TABLE'"

    Write-SqlTableData -ServerInstance DataMgmtDBPRD -DatabaseName DataMgmt -SchemaName dbo -TableName ColumnList -InputData $coldata


    }

}