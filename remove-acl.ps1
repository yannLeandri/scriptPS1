$newPath = "N:\PARTIE6\REP_PERS"

$Acl = Get-Acl -Path $newpath 


#$Ace = ($Acl.Access | Where-Object {($_.IdentityReference.value -eq 'builtin\Users') -and -not ($_.IsInherited)})[0]
$Ace = ($Acl.Access | Where-Object {($_.IdentityReference.value -eq 'creator owner') -and -not ($_.IsInherited)})[0]

$Acl.RemoveAccessRule($Ace)

Set-Acl -Path $newPath -AclObject $Acl
