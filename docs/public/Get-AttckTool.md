# SYNOPSIS

Get-AttckTool gives the user access to all Tool defined within the MITRE ATT&CK framework

## DESCRIPTION

Get-AttckTool can access all Tool defined within the MITRE ATT&CK framework.
You can also select a single Tool object by providing a Name value

## PARAMETERS

### PARAMETER Name

A argument completer parameter to retrieve data about a specific Tool by Name

## EXAMPLES

### EXAMPLE Access All Tool Information

```powershell
C:/> Get-AttckTool
```

```output
Id          : S0099
Name        : Arp
Aliases     : 
Description : [Arp](https://attack.mitre.org/software/S0099) displays information about a system's Address Resolution Protocol (ARP) cache. (Citation: TechNet Arp)
Reference   : {@{Description=No description attribute found; Url=https://attack.mitre.org/software/S0099; ExternalId=S0099; SourceName=mitre-attack}, 
              @{Description=Microsoft. (n.d.). Arp. Retrieved April 17, 2016.; Url=https://technet.microsoft.com/en-us/library/bb490864.aspx; ExternalId=No 
              external_id attribute found; SourceName=TechNet Arp}}
Created     : 05/31/2017 21:33:02
Modified    : 10/17/2018 00:14:20
Stix        : tool--30489451-5886-4c46-90c9-0dff9adc5252
Type        : tool
Wiki        : https://attack.mitre.org/software/S0099
Contributor : 

Id          : S0190
Name        : BITSAdmin
Aliases     : 
Description : [BITSAdmin](https://attack.mitre.org/software/S0190) is a command line tool used to create and manage [BITS 
              Jobs](https://attack.mitre.org/techniques/T1197). (Citation: Microsoft BITSAdmin)
Reference   : {@{Description=No description attribute found; Url=https://attack.mitre.org/software/S0190; ExternalId=S0190; SourceName=mitre-attack}, 
              @{Description=Microsoft. (n.d.). BITSAdmin Tool. Retrieved January 12, 2018.; Url=https://msdn.microsoft.com/library/aa362813.aspx; ExternalId=No 
              external_id attribute found; SourceName=Microsoft BITSAdmin}}
Created     : 04/18/2018 17:59:24
Modified    : 10/14/2019 16:18:11
Stix        : tool--64764dc6-a032-495f-8250-1e4c06bdc163
Type        : tool
Wiki        : https://attack.mitre.org/software/S0190
Contributor : Edward Millington

Id          : S0119
Name        : Cachedump
Aliases     : 
Description : [Cachedump](https://attack.mitre.org/software/S0119) is a publicly-available tool that program extracts cached password hashes from a system’s registry. 
              (Citation: Mandiant APT1)
Reference   : {@{Description=No description attribute found; Url=https://attack.mitre.org/software/S0119; ExternalId=S0119; SourceName=mitre-attack}, 
              @{Description=Mandiant. (n.d.). APT1 Exposing One of China’s Cyber Espionage Units. Retrieved July 18, 2016.; 
              Url=https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/mandiant-apt1-report.pdf; ExternalId=No external_id attribute found; 
              SourceName=Mandiant APT1}}
Created     : 05/31/2017 21:33:10
Modified    : 10/17/2018 00:14:20
Stix        : tool--c9cd7ec9-40b7-49db-80be-1399eddd9c52
Type        : tool
Wiki        : https://attack.mitre.org/software/S0119
Contributor : 

...
```

### EXAMPLE Retrieve a specific Tool by Name

```powershell
C:/> Get-AttckTool -Name 'Arp'
```

```output
Id          : S0099
Name        : Arp
Aliases     : 
Description : [Arp](https://attack.mitre.org/software/S0099) displays information about a system's Address Resolution Protocol (ARP) cache. (Citation: TechNet Arp)
Reference   : {@{Description=No description attribute found; Url=https://attack.mitre.org/software/S0099; ExternalId=S0099; SourceName=mitre-attack}, 
              @{Description=Microsoft. (n.d.). Arp. Retrieved April 17, 2016.; Url=https://technet.microsoft.com/en-us/library/bb490864.aspx; ExternalId=No 
              external_id attribute found; SourceName=TechNet Arp}}
Created     : 05/31/2017 21:33:02
Modified    : 10/17/2018 00:14:20
Stix        : tool--30489451-5886-4c46-90c9-0dff9adc5252
Type        : tool
Wiki        : https://attack.mitre.org/software/S0099
Contributor : 
```

### EXAMPLE Including ToolsDataset from external sources

```powershell
C:/> Get-AttckTool -Name 'Mimikatz'
```

```output
C2Matrix           : {}
ToolsDataset       : {@{links=System.Object[]; names=System.Object[]; family=System.Object[]; comments=Password Dumper, PTH, DCSync, 
                     SkeletonKey, Golden/Silver Tickets}}
AdditionalNames    : {Powerkatz, Mimikatz}
AttributionLinks   : {https://github.com/gentilkiwi/mimikatz}
Family             : {}
AdditionalComments : {Password Dumper, PTH, DCSync, SkeletonKey, Golden/Silver Tickets}
Actively Maint.    : 
Agent              : 
API                : 
ATT&CK Mapping     : 
Chaining           : 
Custom Profile     : 
Dashboard          : 
Date               : 
DNS                : 
DoH                : 
DomainFront        : 
Evaluator          : 
FTP                : 
GH Issues          : 
GitHub             : 
How-To             : 
HTTP               : 
HTTP2              : 
HTTP3              : 
ICMP               : 
IMAP               : 
Implementation     : 
Jitter             : 
Kali               : 
Key Exchange       : 
Kill Date          : 
License            : 
Linux              : 
Logging            : 
macOS              : 
MAPI               : 
Multi-User         : 
c2Name             : 
Notes              : 
Price              : 
Proxy Aware        : 
Server             : 
Site               : 
Slack              : 
Slack Members      : 
SMB                : 
Stego              : 
TCP                : 
Twitter            : 
UI                 : 
Version Reviewed   : 
Windows            : 
Working Hours      : 
Id                 : S0002
Name               : Mimikatz
Aliases            : 
Description        : [Mimikatz](https://attack.mitre.org/software/S0002) is a credential dumper capable of obtaining plaintext Windows account 
                     logins and passwords, along with many other features that make it useful for testing the security of networks. (Citation: 
                     Deply Mimikatz) (Citation: Adsecurity Mimikatz Guide)
Reference          : {@{ExternalId=S0002; Url=https://attack.mitre.org/software/S0002; Description=No description attribute found; 
                     SourceName=mitre-attack}, @{ExternalId=No external_id attribute found; Url=https://github.com/gentilkiwi/mimikatz; 
                     Description=Deply, B. (n.d.). Mimikatz. Retrieved September 29, 2015.; SourceName=Deply Mimikatz}, @{ExternalId=No 
                     external_id attribute found; Url=https://adsecurity.org/?page_id=1821; Description=Metcalf, S. (2015, November 13). 
                     Unofficial Guide to Mimikatz & Command Reference. Retrieved December 23, 2015.; SourceName=Adsecurity Mimikatz Guide}}
Created            : 05/31/2017 21:32:11
Modified           : 04/24/2019 23:36:42
Stix               : tool--afc079f3-c0ea-4096-b75d-3f05338b7f60
Type               : tool
Wiki               : https://attack.mitre.org/software/S0002
Contributor        : Vincent Le Toux
```

### EXAMPLE Including C2Matrix data from external sources

```powershell
C:/> Get-AttckTool -Name 'Prismatica'
```

```output
C2Matrix           : {@{HTTP=Yes; Implementation=Docker; DomainFront=No; Multi-User=Yes; SMB=; Kill Date=No; macOS=Yes; 
                     GitHub=https://github.com/Project-Prismatica; Key Exchange=None; Chaining=Yes; Price=NA; TCP=Yes; Proxy Aware=Yes; 
                     HTTP3=No; HTTP2=No; Date=11/13/2019; Evaluator=@0sm0s1z; Working Hours=No; Slack=No; FTP=No; Version Reviewed=0.01; 
                     Logging=Yes; Name=Prismatica; License=MIT; Windows=Yes; Stego=No; Notes=A few issues came up when poking this. Prismatica 
                     is a marketplace and not a c2 in and of itself. Prismatica has multliple c2 applications that can be used, but I haven't 
                     been able to get them working. Git merge errors and sparse/incomplete instructions have made getting accurate information 
                     about this c2 cumbersome.; Server=Javascript/Python; Actively Maint.=Yes; Dashboard=Yes; DNS=No; Custom Profile=Yes; 
                     ICMP=No; Slack Members=NA; IMAP=No; DoH=No; Jitter=Yes; How-To=; ATT&CK Mapping=No; Kali=; Twitter=@PPrismatica; MAPI=No; 
                     Site=http://prismatica.io/; Agent=JScript/.NET/Rust; API=Yes; UI=GUI; Linux=Yes; GH Issues=1}}
ToolsDataset       : {}
AdditionalNames    : {}
AttributionLinks   : {}
Family             : {}
AdditionalComments : {}
Actively Maint.    : Yes
Agent              : JScript/.NET/Rust
API                : Yes
ATT&CK Mapping     : No
Chaining           : Yes
Custom Profile     : Yes
Dashboard          : Yes
Date               : 11/13/2019
DNS                : No
DoH                : No
DomainFront        : No
Evaluator          : @0sm0s1z
FTP                : No
GH Issues          : 1
GitHub             : https://github.com/Project-Prismatica
How-To             : 
HTTP               : Yes
HTTP2              : No
HTTP3              : No
ICMP               : No
IMAP               : No
Implementation     : Docker
Jitter             : Yes
Kali               : 
Key Exchange       : None
Kill Date          : No
License            : MIT
Linux              : Yes
Logging            : Yes
macOS              : Yes
MAPI               : No
Multi-User         : Yes
c2Name             : Prismatica
Notes              : A few issues came up when poking this. Prismatica is a marketplace and not a c2 in and of itself. Prismatica has multliple 
                     c2 applications that can be used, but I haven't been able to get them working. Git merge errors and sparse/incomplete 
                     instructions have made getting accurate information about this c2 cumbersome.
Price              : NA
Proxy Aware        : Yes
Server             : Javascript/Python
Site               : http://prismatica.io/
Slack              : No
Slack Members      : NA
SMB                : 
Stego              : No
TCP                : Yes
Twitter            : @PPrismatica
UI                 : GUI
Version Reviewed   : 0.01
Windows            : Yes
Working Hours      : No
Id                 : S0110
Name               : Prismatica
Aliases            : 
Description        : [at](https://attack.mitre.org/software/S0110) is used to schedule tasks on a system to run at a specified date or time. 
                     (Citation: TechNet At)
Reference          : {@{ExternalId=S0110; Url=https://attack.mitre.org/software/S0110; Description=No description attribute found; 
                     SourceName=mitre-attack}, @{ExternalId=No external_id attribute found; 
                     Url=https://technet.microsoft.com/en-us/library/bb490866.aspx; Description=Microsoft. (n.d.). At. Retrieved April 28, 
                     2016.; SourceName=TechNet At}}
Created            : 05/31/2017 21:33:06
Modified           : 10/17/2018 00:14:20
Stix               : tool--0c8465c0-d0b4-4670-992e-4eee8d7ff952
Type               : tool
Wiki               : https://attack.mitre.org/software/S0110
Contributor        : 
```

### EXAMPLE Retrieve techniques for a given Tool

```powershell
C:/> (Get-AttckTool -Name 'Arp').Techniques()
```

```output

CreatedByReference   : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Platform             : {Linux, macOS, Windows}
Permission           : {User}
Bypass               : {}
EffectivePermissions : {}
CommandList          : {ipconfig /all shell ipconfig ipconfig
                       post/windows/gather/enum_domains arp -a
                       route print shell arp -a route nbtstat -a {IP | COMP_NAME } shell c:\windows\sysnative\nbstat.exe -a {IP | COMP_NAME} ipconfig /all
                       netsh interface show
                       arp -a
                       nbtstat -n
                       net config
                        netsh advfirewall firewall show rule name=all
                        arp -a
                       netstat -ant | awk '{print $NF}' | grep -v '[a-z]' | sort | uniq -c
                       ifconfig
                        ipconfig /all
                       net config workstation
                       net view /all /domain
                       nltest /domain_trusts     }
Commands             : {                }
Queries              : {System.Object[]}
Datasets             : {        }
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
DataSource           : {Process monitoring, Process command-line parameters}
Id                   : T1016
Name                 : System Network Configuration Discovery
Aliases              : 
Description          : Adversaries will likely look for details about the network configuration and settings of systems they access or through information discovery 
                       of remote systems. Several operating system administration utilities exist that can be used to gather this information. Examples include 
                       [Arp](https://attack.mitre.org/software/S0099), 
                       [ipconfig](https://attack.mitre.org/software/S0100)/[ifconfig](https://attack.mitre.org/software/S0101), 
                       [nbtstat](https://attack.mitre.org/software/S0102), and [route](https://attack.mitre.org/software/S0103).
                       
                       Adversaries may use the information from [System Network Configuration Discovery](https://attack.mitre.org/techniques/T1016) during automated 
                       discovery to shape follow-on behaviors, including whether or not the adversary fully infects the target and/or attempts specific actions.
Reference            : {@{Description=No description attribute found; Url=https://attack.mitre.org/techniques/T1016; ExternalId=T1016; SourceName=mitre-attack}, 
                       @{Description=No description attribute found; Url=https://capec.mitre.org/data/definitions/309.html; ExternalId=CAPEC-309; SourceName=capec}}
Created              : 05/31/2017 21:30:27
Modified             : 08/12/2019 19:44:26
Stix                 : attack-pattern--707399d6-ab3e-4963-9315-d9d3818cd6a0
Type                 : attack-pattern
Wiki                 : https://attack.mitre.org/techniques/T1016
Contributor          : 
```

### EXAMPLE Retrieve actors who are known to use a given Tool

```powershell
C:/> (Get-AttckTool -Name 'Arp').Actors()
```

```output

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Revoked            : No revoked attribute found
Id                 : G0010
Name               : Turla
Aliases            : Turla Waterbug WhiteBear VENOMOUS BEAR Snake Krypton
Description        : [Turla](https://attack.mitre.org/groups/G0010) is a Russian-based threat group that has infected victims in over 45 countries, spanning a range 
                     of industries including government, embassies, military, education, research and pharmaceutical companies since 2004. Heightened activity was 
                     seen in mid-2015. [Turla](https://attack.mitre.org/groups/G0010) is known for conducting watering hole and spearphishing campaigns and leveraging 
                     in-house tools and malware. [Turla](https://attack.mitre.org/groups/G0010)’s espionage platform is mainly used against Windows machines, but has 
                     also been seen used against macOS and Linux machines. (Citation: Kaspersky Turla) (Citation: ESET Gazer Aug 2017) (Citation: CrowdStrike VENOMOUS 
                     BEAR) (Citation: ESET Turla Mosquito Jan 2018)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/groups/G0010; ExternalId=G0010; SourceName=mitre-attack}, 
                     @{Description=(Citation: Kaspersky Turla); Url=No url attribute found; ExternalId=No external_id attribute found; SourceName=Turla}, 
                     @{Description=Based similarity in TTPs and malware used, Turla and Waterbug appear to be the same group.(Citation: Symantec Waterbug); Url=No url 
                     attribute found; ExternalId=No external_id attribute found; SourceName=Waterbug}, @{Description=WhiteBear is a designation used by Securelist to 
                     describe a cluster of activity that has overlaps with activity described by others as Turla, but appears to have a separate focus.(Citation: 
                     Securelist WhiteBear Aug 2017); Url=No url attribute found; ExternalId=No external_id attribute found; SourceName=WhiteBear}…}
Created            : 05/31/2017 21:31:49
Modified           : 07/14/2019 21:04:44
Stix               : intrusion-set--7a19ecb1-3c65-4de3-a230-993516aed6a6
Type               : intrusion-set
Wiki               : https://attack.mitre.org/groups/G0010
Contributor        : Edward Millington

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Revoked            : No revoked attribute found
Id                 : G0071
Name               : Orangeworm
Aliases            : Orangeworm
Description        : [Orangeworm](https://attack.mitre.org/groups/G0071) is a group that has targeted organizations in the healthcare sector in the United States, 
                     Europe, and Asia since at least 2015, likely for the purpose of corporate espionage. (Citation: Symantec Orangeworm April 2018)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/groups/G0071; ExternalId=G0071; SourceName=mitre-attack}, 
                     @{Description=(Citation: Symantec Orangeworm April 2018); Url=No url attribute found; ExternalId=No external_id attribute found; 
                     SourceName=Orangeworm}, @{Description=Symantec Security Response Attack Investigation Team. (2018, April 23). New Orangeworm attack group targets 
                     the healthcare sector in the U.S., Europe, and Asia. Retrieved May 8, 2018.; 
                     Url=https://www.symantec.com/blogs/threat-intelligence/orangeworm-targets-healthcare-us-europe-asia; ExternalId=No external_id attribute found; 
                     SourceName=Symantec Orangeworm April 2018}}
Created            : 10/17/2018 00:14:20
Modified           : 03/25/2019 15:36:46
Stix               : intrusion-set--5636b7b3-d99b-4edd-aa05-ee649c1d4ef1
Type               : intrusion-set
Wiki               : https://attack.mitre.org/groups/G0071
Contributor        : Elger Vinicius S. Rodrigues, @elgervinicius, CYBINT Centre

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Revoked            : No revoked attribute found
Id                 : G0050
Name               : APT32
Aliases            : APT32 SeaLotus OceanLotus APT-C-00
Description        : [APT32](https://attack.mitre.org/groups/G0050) is a threat group that has been active since at least 2014. The group has targeted multiple 
                     private sector industries as well as with foreign governments, dissidents, and journalists with a strong focus on Southeast Asian countries like 
                     Vietnam, the Philippines, Laos, and Cambodia. They have extensively used strategic web compromises to compromise victims. The group is believed 
                     to be Vietnam-based. (Citation: FireEye APT32 May 2017) (Citation: Volexity OceanLotus Nov 2017) (Citation: ESET OceanLotus)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/groups/G0050; ExternalId=G0050; SourceName=mitre-attack}, 
                     @{Description=(Citation: FireEye APT32 May 2017)(Citation: Volexity OceanLotus Nov 2017)(Citation: Cybereason Oceanlotus May 2017); Url=No url 
                     attribute found; ExternalId=No external_id attribute found; SourceName=APT32}, @{Description=(Citation: Cybereason Oceanlotus May 2017); Url=No 
                     url attribute found; ExternalId=No external_id attribute found; SourceName=SeaLotus}, @{Description=(Citation: FireEye APT32 May 2017) (Citation: 
                     Volexity OceanLotus Nov 2017)(Citation: Cybereason Oceanlotus May 2017); Url=No url attribute found; ExternalId=No external_id attribute found; 
                     SourceName=OceanLotus}…}
Created            : 12/14/2017 16:46:06
Modified           : 10/14/2019 16:39:36
Stix               : intrusion-set--247cb30b-955f-42eb-97a5-a89fef69341e
Type               : intrusion-set
Wiki               : https://attack.mitre.org/groups/G0050
Contributor        : Romain Dumont, ESET
```

## OUTPUTS

PSAttck.Enterprise.Tool

## NOTES

Created By: Josh Rickard (MSAdministrator)
Date: 21JAN2020
