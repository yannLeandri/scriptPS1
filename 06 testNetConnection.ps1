$server_list = Get-Content -Path server_list.txt
ForEach ($server in $server_list)
{
Write-Host $server ": " -NoNewline
    if (Test-Connection $server -quiet -count 1)
    {
        Write-Host "OK"
    }
    else
    {
        Write-Host "===== NOT OK ====="
    }
}
