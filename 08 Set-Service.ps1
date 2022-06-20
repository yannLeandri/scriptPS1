$server_list  = Get-Content -Path server_list.txt
$svcCommvaultDeamon = "GxFWD(Instance001)" # Commvault? TBD
$svcCommvaultCommunication = "GxCVD(Instance001)"
$svcCommvaultClient = "GxClMgrS(Instance001)"

ForEach ($server in $server_list) 
{
   Write-Host $server ": "

      # Display current config
      Get-Service $svcCommvaultDeamon -ComputerName $server | Select-Object -Property Name, StartType, Status
      Get-Service $svcCommvaultCommunication -ComputerName $server | Select-Object -Property Name, StartType, Status
      Get-Service $svcCommvaultClient -ComputerName $server | Select-Object -Property Name, StartType, Status

      # Stop service
      # Set-Service -Name $svcCommvaultDeamon -ComputerName $server -Status Stopped -force
      Get-Service -ComputerName $server -Name $svcCommvaultDeamon | Stop-Service -Force

      # Change the startup type
      Set-Service -Name $svcCommvaultDeamon  -ComputerName $server -StartupType Disabled
      Set-Service -Name $svcCommvaultCommunication  -ComputerName $server -StartupType Disabled
      Set-Service -Name $svcCommvaultClient  -ComputerName $server -StartupType Disabled


      # Display new config
      Get-Service $svcCommvaultDeamon -ComputerName $server | Select-Object -Property Name, StartType, Status
      Get-Service $svcCommvaultCommunication -ComputerName $server | Select-Object -Property Name, StartType, Status
      Get-Service $svcCommvaultClient -ComputerName $server | Select-Object -Property Name, StartType, Status

   Write-Host "================================================================="
}
