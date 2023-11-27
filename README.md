# Data-Accessibility-Review
Notes:
File Access Audit: This part of the script checks for directories with permissions like FullControl or Write for non-privileged users. Replace $auditPaths with the actual paths you want to audit.

AD Group Membership Audit: This part retrieves and lists members of specified AD groups. Replace $auditGroups with the actual group names you want to audit. The placeholder logic should be replaced with actual criteria to identify unexpected or unauthorized members.

Error Handling: Basic error handling is included (e.g., Test-Path for file paths, ErrorAction for AD queries). Consider enhancing it based on specific needs.

Reporting: The script currently writes findings to the console. For a production environment, consider outputting to a structured file like CSV or a log file for easier analysis.

Running the Script: Ensure you have the necessary permissions to access file ACLs and AD group information. This script might require running as an administrator or with specific AD privileges.

Customizing: Adjust the logic in Audit-FileAccess and Audit-ADGroupMembership according to your organization's security policies and standards.
