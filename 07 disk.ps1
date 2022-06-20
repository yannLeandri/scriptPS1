Connect-VIServer pzgesnf487.desjardins.com

$server_list = Get-Content -Path server_list.txt

foreach ($server in $server_list){
   $qtd=Get-HardDisk -VM $server
   $qtnb=$qtd.count
   #$qtnb
   $i=2
   Do {
       Get-HardDisk -VM $server | where {$_.Name -eq "Hard disk $i"} | Set-harddisk -Persistence "IndependentPersistent" -Confirm:$false
       $i++
       }
   Until ($i -gt $qtnb)
   Start-VM $server
   }
