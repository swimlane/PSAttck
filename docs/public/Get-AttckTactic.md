# SYNOPSIS

Get-AttckTactic gives the user access to all Tactic defined within the MITRE ATT&CK framework

## DESCRIPTION

Get-AttckTactic can access all Tactic defined within the MITRE ATT&CK framework.
You can also select a single Tactic object by providing a Name value

## PARAMETERS

### PARAMETER Name

A argument completer parameter to retrieve data about a specific Tactic by Name

## EXAMPLES

### EXAMPLE Access All Tactic Information

```powershell
C:/> Get-AttckTactic
```

```output
CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
ShortName          : collection
Id                 : TA0009
Name               : Collection
Aliases            : 
Description        : The adversary is trying to gather data of interest to their goal.
                     
                     Collection consists of techniques adversaries may use to gather information and the sources information is collected from that are relevant to 
                     following through on the adversary's objectives. Frequently, the next goal after collecting data is to steal (exfiltrate) the data. Common target 
                     sources include various drive types, browsers, audio, video, and email. Common collection methods include capturing screenshots and keyboard 
                     input.
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/tactics/TA0009; ExternalId=TA0009; SourceName=mitre-attack}}
Created            : 10/17/2018 00:14:20
Modified           : 07/19/2019 17:44:53
Stix               : x-mitre-tactic--d108ce10-2419-4cf9-a774-46161d6c6cfe
Type               : x-mitre-tactic
Wiki               : https://attack.mitre.org/tactics/TA0009
Contributor        : 

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
ShortName          : command-and-control
Id                 : TA0011
Name               : Command and Control
Aliases            : 
Description        : The adversary is trying to communicate with compromised systems to control them.
                     
                     Command and Control consists of techniques that adversaries may use to communicate with systems under their control within a victim network. 
                     Adversaries commonly attempt to mimic normal, expected traffic to avoid detection. There are many ways an adversary can establish command and 
                     control with various levels of stealth depending on the victim’s network structure and defenses.
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/tactics/TA0011; ExternalId=TA0011; SourceName=mitre-attack}}
Created            : 10/17/2018 00:14:20
Modified           : 07/19/2019 17:45:30
Stix               : x-mitre-tactic--f72804c5-f15a-449e-a5da-2eecd181f813
Type               : x-mitre-tactic
Wiki               : https://attack.mitre.org/tactics/TA0011
Contributor        : 

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
ShortName          : credential-access
Id                 : TA0006
Name               : Credential Access
Aliases            : 
Description        : The adversary is trying to steal account names and passwords.

...
```

### EXAMPLE Retrieve a specific Tactic by Name

```powershell
C:/> Get-AttckTactic -Name 'Collection'
```

```output

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
ShortName          : collection
Id                 : TA0009
Name               : Collection
Aliases            : 
Description        : The adversary is trying to gather data of interest to their goal.
                     
                     Collection consists of techniques adversaries may use to gather information and the sources information is collected from that are relevant to 
                     following through on the adversary's objectives. Frequently, the next goal after collecting data is to steal (exfiltrate) the data. Common target 
                     sources include various drive types, browsers, audio, video, and email. Common collection methods include capturing screenshots and keyboard 
                     input.
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/tactics/TA0009; ExternalId=TA0009; SourceName=mitre-attack}}
Created            : 10/17/2018 00:14:20
Modified           : 07/19/2019 17:44:53
Stix               : x-mitre-tactic--d108ce10-2419-4cf9-a774-46161d6c6cfe
Type               : x-mitre-tactic
Wiki               : https://attack.mitre.org/tactics/TA0009
Contributor        : 
```

### EXAMPLE Retrieve which techniques are associated with a Tactic

```powershell
C:/> (Get-AttckTactic -Name 'Collection').Techniques()
```

```output
CreatedByReference   : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Platform             : {Linux, macOS, Windows}
Permission           : {User}
Bypass               : {}
EffectivePermissions : {}
CommandList          : {powershell.exe -Command WindowsAudioDevice-Powershell-Cmdlet
                       }
Commands             : {System.Object[]}
Queries              : {System.Object[]}
Datasets             : {System.Object[]}
Detections           : {$null}
Network              : No x_mitre_network_requirements attribute found
Remote               : No x_mitre_remote_support attribute found
SystemRequirements   : No x_mitre_system_requirements attribute found
Detection            : Detection of this technique may be difficult due to the various APIs that may be used. Telemetry data regarding API use may not be useful 
                       depending on how a system is normally used, but may provide context to other potentially malicious activity occurring on a system.
                       
                       Behavior that could indicate technique use include an unknown or unusual process accessing APIs associated with devices or software that 
                       interact with the microphone, recording devices, or recording software, and a process periodically writing files to disk that contain audio 
                       data.
DataSource           : {API monitoring, Process monitoring, File monitoring}
Id                   : T1123
Name                 : Audio Capture
Aliases              : 
Description          : An adversary can leverage a computer's peripheral devices (e.g., microphones and webcams) or applications (e.g., voice and video call services) 
                       to capture audio recordings for the purpose of listening into sensitive conversations to gather information.
                       
                       Malware or scripts may be used to interact with the devices through an available API provided by the operating system or an application to 
                       capture audio. Audio files may be written to disk and exfiltrated later.
Reference            : {@{Description=No description attribute found; Url=https://attack.mitre.org/techniques/T1123; ExternalId=T1123; SourceName=mitre-attack}, 
                       @{Description=No description attribute found; Url=https://capec.mitre.org/data/definitions/634.html; ExternalId=CAPEC-634; SourceName=capec}}
Created              : 05/31/2017 21:31:34
Modified             : 06/18/2019 13:16:53
Stix                 : attack-pattern--1035cdf2-3e5f-446f-a7a7-e8f6d7925967
Type                 : attack-pattern
Wiki                 : https://attack.mitre.org/techniques/T1123
Contributor          : 

CreatedByReference   : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Platform             : {Linux, macOS, Windows}
Permission           : {User}
Bypass               : {}
EffectivePermissions : {}
CommandList          : {dir c: /b /s .docx | findstr /e .docx
                       for /R c: %f in (*.docx) do copy %f c:\temp\
                        Get-ChildItem -Recurse -Include *.doc | % {Copy-Item $_.FullName -destination c:\temp}
                        Get-Service > $env:TEMP\T1119_1.txt
                       Get-ChildItem Env: > $env:TEMP\T1119_2.txt
                       Get-Process > $env:TEMP\T1119_3.txt
                        sc query type=service > %TEMP%\T1119_1.txt
                       doskey /history > %TEMP%\T1119_2.txt
                       wmic process list > %TEMP%\T1119_3.txt
                       tree C:\AtomicRedTeam\atomics > %TEMP%\T1119_4.txt
                        cmd.exe dir c: /b /s .docx | findstr /e .docx}
Commands             : {    }
Queries              : {System.Object[]}
Datasets             : { }
Detections           : {$null}
Network              : No x_mitre_network_requirements attribute found
Remote               : No x_mitre_remote_support attribute found
SystemRequirements   : Permissions to access directories and files that store information of interest.
Detection            : Depending on the method used, actions could include common file system commands and parameters on the command-line interface within batch files 
                       or scripts. A sequence of actions like this may be unusual, depending on the system and network environment. Automated collection may occur 
                       along with other techniques such as [Data Staged](https://attack.mitre.org/techniques/T1074). As such, file access monitoring that shows an 
                       unusual process performing sequential file opens and potentially copy actions to another location on the file system for many files at once may 
                       indicate automated collection behavior. Remote access tools with built-in features may interact directly with the Windows API to gather data. 
                       Data may also be acquired through Windows system management tools such as [Windows Management 
                       Instrumentation](https://attack.mitre.org/techniques/T1047) and [PowerShell](https://attack.mitre.org/techniques/T1086).
DataSource           : {File monitoring, Data loss prevention, Process command-line parameters}
Id                   : T1119
Name                 : Automated Collection
Aliases              : 
Description          : Once established within a system or network, an adversary may use automated techniques for collecting internal data. Methods for performing 
                       this technique could include use of [Scripting](https://attack.mitre.org/techniques/T1064) to search for and copy information fitting set 
                       criteria such as file type, location, or name at specific time intervals. This functionality could also be built into remote access tools. 
                       
                       This technique may incorporate use of other techniques such as [File and Directory Discovery](https://attack.mitre.org/techniques/T1083) and 
                       [Remote File Copy](https://attack.mitre.org/techniques/T1105) to identify and move files.
Reference            : {@{Description=No description attribute found; Url=https://attack.mitre.org/techniques/T1119; ExternalId=T1119; SourceName=mitre-attack}}
Created              : 05/31/2017 21:31:27
Modified             : 07/16/2019 19:44:07
Stix                 : attack-pattern--30208d3e-0d6b-43c8-883e-44462a514619
Type                 : attack-pattern
Wiki                 : https://attack.mitre.org/techniques/T1119
Contributor          : 

...
```

## OUTPUTS

PSAttck.Enterprise.Tactic

## NOTES

Created By: Josh Rickard (MSAdministrator)
Date: 21JAN2020
