$newPath = "D:\OracleTestACL\Middleware\Oracle_Home2"
# Create a folder for this user:

$acl = Get-Acl $newpath

# Set an Access rule for 'Subfolders and files' only
$permission = "everyone",'ReadAndExecute','ContainerInherit, ObjectInherit', 'InheritOnly', "Allow"
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
$acl.SetAccessRule($rule)
     
# Add an Access rule for 'This folder' only.
$permission = "everyone",'ReadAndExecute','none', 'InheritOnly', "Allow"
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
$acl.AddAccessRule($rule)

# Save the access rules to disk:
$acl | Set-Acl $newpath
