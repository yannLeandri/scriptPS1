$csvNIC=Import-Csv .\SetNic.csv

ForEach ($l in $csvNIC)
{
    Echo "Debut"
    $server = $l.ServerName
    $nicName= $l.NicName
    $IP= $l.IP

    $wmi = Get-WmiObject -ComputerName $server -Class Win32_NetworkAdapter -Filter "NetConnectionID = '$nicname'"
    $wmi.NetConnectionID = 'Backup'
    $wmi.Put()

    $Nic=get-NetIPAddress -CimSession $server -InterfaceAlias 'Backup' -AddressFamily IPv4
    $index=$Nic.interfaceindex
    New-NetIPAddress -CimSession $server -InterfaceIndex $index -IPAddress $IP
    Set-NetIPAddress -CimSession $server -InterfaceIndex $index -IPAddress $IP -PrefixLength 20
    Echo "Complet"
}
