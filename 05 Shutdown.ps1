$server_list = Get-Content -Path server_list.txt

ForEach ($server in $server_list) 
{
    Stop-Computer -ComputerName $server -Force
}

Pause
