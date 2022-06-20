$Cred = get-credential

$server_list = Get-Content -Path server_list.txt

#$script ={Get-NetAdapter}

ForEach ($server in $server_list)
{

#Invoke-COmmand -ScriptBlock $script -credential $cred -ComputerName $server
$export+=get-netadapter -CimSession $server

}

$export | Export-Csv -path .\exportNic.csv
