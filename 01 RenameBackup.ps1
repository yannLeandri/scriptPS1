$server_list = Get-Content -Path server_list.txt
ForEach ($server in $server_list)
{
    $wmi = Get-WmiObject -ComputerName $server -Class Win32_NetworkAdapter -Filter "NetConnectionID = 'Backup'"
    $wmi.NetConnectionID = 'Backup-Commvault'
    $wmi.Put()
    Get-WmiObject -ComputerName $server -Class Win32_NetworkAdapter -Filter "NetConnectionID = 'Backup-Commvault'"
}
