# PowerShell Script for Data Accessibility Review

# Function to audit file access permissions
function Audit-FileAccess {
    param (
        [string[]]$Paths
    )

    foreach ($path in $Paths) {
        if (Test-Path $path) {
            $acl = Get-Acl $path
            foreach ($access in $acl.Access) {
                if ($access.FileSystemRights -match "FullControl|Write") {
                    # Report any full control or write permissions
                    Write-Host "Potential issue at $path: $($access.IdentityReference) has $($access.FileSystemRights)"
                }
            }
        }
    }
}

# Function to audit AD group memberships
function Audit-ADGroupMembership {
    param (
        [string[]]$Groups
    )

    foreach ($group in $Groups) {
        $members = Get-ADGroupMember -Identity $group -ErrorAction SilentlyContinue
        if ($members) {
            foreach ($member in $members) {
                # Check if member is unexpected or unauthorized
                # Placeholder for actual logic to determine unexpected members
                Write-Host "Group $group has member: $($member.Name)"
            }
        }
    }
}

# Paths and groups to audit
$auditPaths = @("C:\path\to\audit", "D:\another\path")
$auditGroups = @("ADGroupName1", "ADGroupName2")

# Perform audits
Audit-FileAccess -Paths $auditPaths
Audit-ADGroupMembership -Groups $auditGroups
