# Import Active Directory Module
Import-Module ActiveDirectory

# Make Sure it is Complex per policy
$AccountPassword =Read-Host -AsSecureString -Prompt "Enter Temp Password for New Users"

# Imports user data
$csv = Import-Csv -Path C:\Users\ttruong\Documents\projects\psedu\adusers.csv

# Loops through users
foreach ($user in $csv) {
   
    # Splat
    $UserInfo = @{
        SamAccountName = $user.Name
        Name = $user.Name
        DisplayName = $user.GivenName
        GivenName = $user.SurName
        SurName = $user.SamAccountName
        
        Title = $user.Title
        Department = $user.Department
        Company = $user.Company
        
        EmailAddress = $user.EmailAddress
        AccountPassword = $AccountPassword
        ChangePasswordAtLogon = $true
        Enabled = $true
        
        Path = $user.Path
    }

    #Creates new users
    New-ADUser @UserInfo

}