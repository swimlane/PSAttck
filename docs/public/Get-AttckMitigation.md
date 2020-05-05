# SYNOPSIS

Get-AttckMitigation gives the user access to all Mitigation defined within the MITRE ATT&CK framework

## DESCRIPTION

Get-AttckMitigation can access all Mitigation defined within the MITRE ATT&CK framework.
You can also select a single Mitigation object by providing a Name value

## PARAMETERS

### PARAMETER Name

A argument completer parameter to retrieve data about a specific Mitigation by Name

## EXAMPLES

### EXAMPLE Access All Mitigation Information

```powershell
C:/> Get-AttckMitigation
```

```output

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Id                 : T1156
Name               : .bash_profile and .bashrc Mitigation
Aliases            : 
Description        : Making these files immutable and only changeable by certain administrators will limit the ability for adversaries to easily create user level 
                     persistence.
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/mitigations/T1156; ExternalId=T1156; SourceName=mitre-attack}}
Created            : 10/17/2018 00:14:20
Modified           : 07/24/2019 14:02:53
Stix               : course-of-action--4f170666-7edb-4489-85c2-9affa28a72e0
Type               : course-of-action
Wiki               : https://attack.mitre.org/mitigations/T1156
Contributor        : 

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Id                 : T1134
Name               : Access Token Manipulation Mitigation
Aliases            : 
Description        : Access tokens are an integral part of the security system within Windows and cannot be turned off. However, an attacker must already have 
                     administrator level access on the local system to make full use of this technique; be sure to restrict users and accounts to the least privileges 
                     they require to do their job.
                     
                     Any user can also spoof access tokens if they have legitimate credentials. Follow mitigation guidelines for preventing adversary use of [Valid 
                     Accounts](https://attack.mitre.org/techniques/T1078). Limit permissions so that users and user groups cannot create tokens. This setting should 
                     be defined for the local system account only. GPO: Computer Configuration > [Policies] > Windows Settings > Security Settings > Local Policies > 
                     User Rights Assignment: Create a token object. (Citation: Microsoft Create Token) Also define who can create a process level token to only the 
                     local and network service through GPO: Computer Configuration > [Policies] > Windows Settings > Security Settings > Local Policies > User Rights 
                     Assignment: Replace a process level token. (Citation: Microsoft Replace Process Token)
                     
                     Also limit opportunities for adversaries to increase privileges by limiting Privilege Escalation opportunities.
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/mitigations/T1134; ExternalId=T1134; SourceName=mitre-attack}, 
                     @{Description=Brower, N., Lich, B. (2017, April 19). Create a token object. Retrieved December 19, 2017.; 
                     Url=https://docs.microsoft.com/windows/device-security/security-policy-settings/create-a-token-object; ExternalId=No external_id attribute found; 
                     SourceName=Microsoft Create Token}, @{Description=Brower, N., Lich, B. (2017, April 19). Replace a process level token. Retrieved December 19, 
                     2017.; Url=https://docs.microsoft.com/windows/device-security/security-policy-settings/replace-a-process-level-token; ExternalId=No external_id 
                     attribute found; SourceName=Microsoft Replace Process Token}}
Created            : 10/17/2018 00:14:20
Modified           : 07/24/2019 14:29:27
Stix               : course-of-action--c61fee9f-16fb-4f8c-bbf0-869093fcd4a6
Type               : course-of-action
Wiki               : https://attack.mitre.org/mitigations/T1134
Contributor        : 

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Id                 : T1015
Name               : Accessibility Features Mitigation
Aliases            : 
Description        : To use this technique remotely, an adversary must use it in conjunction with RDP. Ensure that Network Level Authentication is enabled to force 
                     the remote desktop session to authenticate before the session is created and the login screen displayed. It is enabled by default on Windows 
                     Vista and later. (Citation: TechNet RDP NLA)
                     
                     If possible, use a Remote Desktop Gateway to manage connections and security configuration of RDP within a network. (Citation: TechNet RDP 
                     Gateway)
                     
                     Identify and block potentially malicious software that may be executed by an adversary with this technique by using whitelisting (Citation: 
                     Beechey 2010) tools, like AppLocker, (Citation: Windows Commands JPCERT) (Citation: NSA MS AppLocker) or Software Restriction Policies (Citation: 
                     Corio 2008) where appropriate. (Citation: TechNet Applocker vs SRP)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/mitigations/T1015; ExternalId=T1015; SourceName=mitre-attack}, 
                     @{Description=Microsoft. (n.d.). Configure Network Level Authentication for Remote Desktop Services Connections. Retrieved June 6, 2016.; 
                     Url=https://technet.microsoft.com/en-us/library/cc732713.aspx; ExternalId=No external_id attribute found; SourceName=TechNet RDP NLA}, 
                     @{Description=Microsoft. (n.d.). Overview of Remote Desktop Gateway. Retrieved June 6, 2016.; 
                     Url=https://technet.microsoft.com/en-us/library/cc731150.aspx; ExternalId=No external_id attribute found; SourceName=TechNet RDP Gateway}, 
                     @{Description=Beechey, J. (2010, December). Application Whitelisting: Panacea or Propaganda?. Retrieved November 18, 2014.; 
                     Url=http://www.sans.org/reading-room/whitepapers/application/application-whitelisting-panacea-propaganda-33599; ExternalId=No external_id 
                     attribute found; SourceName=Beechey 2010}…}
Created            : 10/17/2018 00:14:20
Modified           : 07/24/2019 14:03:37
Stix               : course-of-action--c085476e-1964-4d7f-86e1-d8657a7741e8
Type               : course-of-action
Wiki               : https://attack.mitre.org/mitigations/T1015
Contributor        : 

...
```

### EXAMPLE Retrieve a specific Mitigation by Name

```powershell
C:/> Get-AttckMitigation -Name 'Account Discovery Mitigation'
```

```output
CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Id                 : T1087
Name               : Account Discovery Mitigation
Aliases            : 
Description        : Prevent administrator accounts from being enumerated when an application is elevating through UAC since it can lead to the disclosure of account 
                     names. The Registry key is located <code>HKLM\ SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI\EnumerateAdministrators</code>. It can 
                     be disabled through GPO: Computer Configuration > [Policies] > Administrative Templates > Windows Components > Credential User Interface: E 
                     numerate administrator accounts on elevation. (Citation: UCF STIG Elevation Account Enumeration)
                     
                     Identify unnecessary system utilities or potentially malicious software that may be used to acquire information about system and domain accounts, 
                     and audit and/or block them by using whitelisting (Citation: Beechey 2010) tools, like AppLocker, (Citation: Windows Commands JPCERT) (Citation: 
                     NSA MS AppLocker) or Software Restriction Policies (Citation: Corio 2008) where appropriate. (Citation: TechNet Applocker vs SRP)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/mitigations/T1087; ExternalId=T1087; SourceName=mitre-attack}, 
                     @{Description=UCF. (n.d.). The system must require username and password to elevate a running application.. Retrieved December 18, 2017.; 
                     Url=https://www.stigviewer.com/stig/microsoft_windows_server_2012_member_server/2013-07-25/finding/WN12-CC-000077; ExternalId=No external_id 
                     attribute found; SourceName=UCF STIG Elevation Account Enumeration}, @{Description=Beechey, J. (2010, December). Application Whitelisting: 
                     Panacea or Propaganda?. Retrieved November 18, 2014.; 
                     Url=http://www.sans.org/reading-room/whitepapers/application/application-whitelisting-panacea-propaganda-33599; ExternalId=No external_id 
                     attribute found; SourceName=Beechey 2010}, @{Description=Tomonaga, S. (2016, January 26). Windows Commands Abused by Attackers. Retrieved 
                     February 2, 2016.; Url=http://blog.jpcert.or.jp/2016/01/windows-commands-abused-by-attackers.html; ExternalId=No external_id attribute found; 
                     SourceName=Windows Commands JPCERT}…}
Created            : 10/17/2018 00:14:20
Modified           : 07/24/2019 14:30:29
Stix               : course-of-action--5c49bc54-9929-48ca-b581-7018219b5a97
Type               : course-of-action
Wiki               : https://attack.mitre.org/mitigations/T1087
Contributor        : 
```

### EXAMPLE Retrieve which techniques apply to a specific Mitigation

```powershell
C:/> (Get-AttckMitigation -Name 'Account Discovery Mitigation').Techniques()
```

```output
CreatedByReference   : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Platform             : {Linux, macOS, Windows, Office 365…}
Permission           : {User}
Bypass               : {}
EffectivePermissions : {}
CommandList          : {net user [username] [/domain] shell net user [username] [/domain] post/windows/gather/enum_ad_users
                       auxiliary/scanner/smb/smb_enumusers dsquery group "ou=Domain Admins,dc=domain,dc=com"
                       dsquery user "dc=domain,dc=com"
                       dsquery * OU="Domain Admins",DC=domain,DC=com -scope base -attr SAMAccountName userPrincipalName Description
                       dsquery * -filter "(&(objectCategory=contact)(objectCategory=person)(mail=*)(objectClass=user))" -Attr samAccountName mail -Limit 0
                       dsquery * -filter "(&(objectCategory=group)(name=*Admin*))" -Attr name description members shell dsquery group "out=Domain 
                       Admins",dc=domain,dc=com"
                       shell dsquery user "dc=domain,dc=com"
                       shell dsquery * OU="Domain Admins",dc=domain,dc=com -scope base -attr SAMAccountName userPrincipleName Description
                       shell dsquery * -filter "(&(objectCategory=contact)(objectCategory=person)(mail=*)(objectClass=user))" -Attr samAccountName mail -Limit 0
                       shell dsquery * -filter "(&(objectCategory=group)(name=*Admin*))" -Attr name description members cat /etc/passwd > ~/loot.txt
                        cat /etc/sudoers > ~/loot.txt
                        grep 'x:0:' /etc/passwd > ~/loot.txt
                        username=$(echo $HOME | awk -F'/' '{print $3}') && lsof -u $username
                        lastlog > ~/loot.txt
                        groups
                       id
                        dscl . list /Groups
                       dscl . list /Users
                       dscl . list /Users | grep -v '_'
                       dscacheutil -q group
                       dscacheutil -q user
                        net user
                       net user /domain
                       dir c:\Users\
                       cmdkey.exe /list
                       net localgroup "Users"
                       net localgroup
                        net user
                       net user /domain
                       get-localuser
                       get-localgroupmember -group Users
                       cmdkey.exe /list
                       ls C:/Users
                       get-childitem C:\Users\
                       dir C:\Users\
                       get-aduser -filter *
                       get-localgroup
                       net localgroup
                        query user
                        query user
                           Net.exe localgroup "administrators" Net.exe group "domain admins" /domain Net.exe user * /domain wmic.exe useraccount get /ALL wmic.exe 
                       useraccount list wmic.exe qfe get description,installedOn /format:csv wmic.exe process get caption,executablepath,commandline wmic.exe service 
                       get name,displayname,pathname,startmode wmic.exe share list wmic.exe /node:"192.168.0.1" service where (caption like "%sql server (%") wmic.exe 
                       get-wmiobject -class "win32_share" -namespace "root\CIMV2" -computer "targetname" nltest.exe}
Commands             : {                              }
Queries              : {                }
Datasets             : {                 }
Detections           : {$null}
Network              : No x_mitre_network_requirements attribute found
Remote               : No x_mitre_remote_support attribute found
SystemRequirements   : No x_mitre_system_requirements attribute found
Detection            : System and network discovery techniques normally occur throughout an operation as an adversary learns the environment. Data and events should 
                       not be viewed in isolation, but as part of a chain of behavior that could lead to other activities, such as Lateral Movement, based on the 
                       information obtained.
                       
                       Monitor processes and command-line arguments for actions that could be taken to gather system and network information. Remote access tools with 
                       built-in features may interact directly with the Windows API to gather information. Information may also be acquired through Windows system 
                       management tools such as [Windows Management Instrumentation](https://attack.mitre.org/techniques/T1047) and 
                       [PowerShell](https://attack.mitre.org/techniques/T1086).
DataSource           : {Azure activity logs, Office 365 account logs, API monitoring, Process monitoring…}
Id                   : T1087
Name                 : Account Discovery
Aliases              : 
Description          : Adversaries may attempt to get a listing of local system or domain accounts. 
                       
                       ### Windows
                       
                       Example commands that can acquire this information are <code>net user</code>, <code>net group <groupname></code>, and <code>net localgroup 
                       <groupname></code> using the [Net](https://attack.mitre.org/software/S0039) utility or through use of 
                       [dsquery](https://attack.mitre.org/software/S0105). If adversaries attempt to identify the primary user, currently logged in user, or set of 
                       users that commonly uses a system, [System Owner/User Discovery](https://attack.mitre.org/techniques/T1033) may apply.
                       
                       ### Mac
                       
                       On Mac, groups can be enumerated through the <code>groups</code> and <code>id</code> commands. In mac specifically, <code>dscl . list 
                       /Groups</code> and <code>dscacheutil -q group</code> can also be used to enumerate groups and users.
                       
                       ### Linux
                       
                       On Linux, local users can be enumerated through the use of the <code>/etc/passwd</code> file which is world readable. In mac, this same file is 
                       only used in single-user mode in addition to the <code>/etc/master.passwd</code> file.
                       
                       Also, groups can be enumerated through the <code>groups</code> and <code>id</code> commands.
                       
                       ### Office 365 and Azure AD
                       
                       With authenticated access there are several tools that can be used to find accounts. The <code>Get-MsolRoleMember</code> PowerShell cmdlet can 
                       be used to obtain account names given a role or permissions group.(Citation: Microsoft msolrolemember)(Citation: GitHub Raindance)
                       
                       Azure CLI (AZ CLI) also provides an interface to obtain user accounts with authenticated access to a domain. The command <code>az ad user 
                       list</code> will list all users within a domain.(Citation: Microsoft AZ CLI)(Citation: Black Hills Red Teaming MS AD Azure, 2018) 
                       
                       The <code>Get-GlobalAddressList</code> PowerShell cmdlet can be used to obtain email addresses and accounts from a domain using an 
                       authenticated session.(Citation: Microsoft getglobaladdresslist)(Citation: Black Hills Attacking Exchange MailSniper, 2016)
Reference            : {@{Description=No description attribute found; Url=https://attack.mitre.org/techniques/T1087; ExternalId=T1087; SourceName=mitre-attack}, 
                       @{Description=No description attribute found; Url=https://capec.mitre.org/data/definitions/575.html; ExternalId=CAPEC-575; SourceName=capec}, 
                       @{Description=Microsoft. (n.d.). Get-MsolRoleMember. Retrieved October 6, 2019.; 
                       Url=https://docs.microsoft.com/en-us/powershell/module/msonline/get-msolrolemember?view=azureadps-1.0; ExternalId=No external_id attribute 
                       found; SourceName=Microsoft msolrolemember}, @{Description=Stringer, M.. (2018, November 21). RainDance. Retrieved October 6, 2019.; 
                       Url=https://github.com/True-Demon/raindance; ExternalId=No external_id attribute found; SourceName=GitHub Raindance}…}
Created              : 05/31/2017 21:31:06
Modified             : 10/08/2019 21:05:16
Stix                 : attack-pattern--72b74d71-8169-42aa-92e0-e7b04b9f5a08
Type                 : attack-pattern
Wiki                 : https://attack.mitre.org/techniques/T1087
Contributor          : Microsoft Threat Intelligence Center (MSTIC) Travis Smith, Tripwire
```

## OUTPUTS

PSAttck.Enterprise.Mitigation

## NOTES

Created By: Josh Rickard (MSAdministrator)
Date: 21JAN2020
