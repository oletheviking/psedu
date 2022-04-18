# Import Active Directory Modules
Import-Module ActiveDirectory

# Create Root OU
# New-ADOrganizationalUnit "Corporate"

# Create Child OUs in Corporate
$OUs = @(
    'Users'
    'Groups'
    'Computers'
    'Servers'
)
foreach ($OU in $OUs) {
    New-ADOrganizationalUnit -Path 'OU=Corporate,DC=starwars,DC=local' -Name $OU
    
}