$server_list = Get-Content -Path server_list.txt

Connect-VIServer pzgesnf487.desjardins.com

ForEach ($server in $server_list) 

{

$vm= get-vm -name $server

if($vm.PowerState -eq "PoweredOn"){

               write-host $vm est: ON
               }
else
               {Write-host $vm est: OFF
}
}

Disconnect-VIServer *
