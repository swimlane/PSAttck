![PowerShell Core](https://github.com/swimlane/PSAttck/workflows/PowerShell%20Core/badge.svg?branch=master)
![Windows PowerShell](https://github.com/swimlane/PSAttck/workflows/Windows%20PowerShell/badge.svg?branch=master)

# PSAttck


**PSAttck** is a light-weight framework for the MITRE ATT&CK Framework. This package extracts details about MITRE ATT&CK Tactics, Techniques, Actors/Groups, Tools, Malware, and Mitigations provided by MITRE.

## DESCRIPTION

Currently `PSAttck` supports the Enterprise Mitre ATT&CK Framework
with future plans to support additional frameworks.

By default, `PSAttck` downloads data about the Mitre ATT&CK framework from
an external source.  Additionally, additional generated data sets are downloaded as well.

You can set an alternate path to retrieve these data sets from by using 
the `Set-PSAttckConfiguration` function.
        
## COMPATIBILITY

`PSAttck` is compatible with Windows PowerShell 5 and PowerShell Core.

`PSAttck` utilizes PowerShell Classes to generate and create standard objects
across all ATT&CK data categories.

## FEATURES

The **PSAttck** package retrieves all Tactics, Techniques, Actors, Malware, Tools, and Mitigations from the MITRE ATT&CK Enterprise framework as well as any defined relationships within the MITRE ATT&CK dataset. In addition, Techniques, Actors, and Tools (if applicable) now have collected data from third-party resources that are accessible via properties on a technique. For more detailed information about these features, see [External Datasets](docs/external-data/README.md).

The **PSAttck** package allows you to:

  * Update or sync the external datasets by calling the `update()` method on an `Attck` object. By default it checks for updates every 30 days.
  * Specify a local file path for the MITRE ATT&CK Enterprise Framework json, generated dataset, and/or a config.yml file.
  * Retrieve an image_logo of an actor (when available). If an image_logo isn't available, it generates an ascii_logo.
  * Search the external dataset for external commands that are similar using `search_commands`.

## FUNCTIONS

To see what functions are provided by `PSAttck`, execute the command:

```powershell
Get-Command -Module PSAttck 
```

In addition to the below functions, you can also retrieve relationship data objects
defined within the Mitre ATT&CK Framework.  

Available functions and their related data objects are defined below:

### Get-Attck

Select an ATT&CK data type and FilterBy a property name and it's value (if desired)

### Get-AttckActor

Retrieve all or a specific Actor by name

Related Data Objects:

+ Malwares
+ Tools
+ Techniques

### Get-AttckMalware

Retrieve all or a specific Malware by name

Related Data Objects:

+ Techniques
+ Actors

### Get-AttckMitigation

Retrieve all or a specific Mitigation by name

Related Data Objects:

+ Techniques

### Get-AttckTactic

Retrieve all or a specific Tactic by name

Related Data Objects:

+ Techniques

### Get-AttckTechnique

Retrieve all or a specific Technique by name

Related Data Objects:

+ Techniques
+ Actors
+ Mitigations
+ Datasets

### Get-AttckTool

Retrieve all or a specific Tool by name

Related Data Objects:

+ Techniques
+ Actors


## Installation

You can install **PSAttk** on OS X, Linux, or Windows. 


```powershell
Install-Module -Name PSAttck
```

You can also install it directly from the source. To install, see the commands under the relevant operating system heading, below.

## ADDITIONAL FEATURES

`PSAttck` also allows you to retrieve external data sets related to Techniques.

For example, every Technique object has additional (non-standard) properties 
which allow you to access:

- Commands
    - Source
    - Command
    - Name (if applicable)
- CommandList
    - command from Commands['command']
- RawDatasets
    - Raw dataset data
- Queries
    - Product
    - Query
    - Name (if applicable)
- RawDetections
    - Raw detection data source


## Running the tests

Tests within this project should cover all available properties and methods.  As this project grows the tests will become more robust but for now we are testing that they exist and return outputs.

## Contributing

Please read [CONTRIBUTING.md](https://github.com/swimlane/PSAttck/blob/master/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. 

## Change Log

Please read [CHANGELOG.md](https://github.com/swimlane/PSAttck/blob/master/CHANGELOG.md) for details on features for a specific version of `PSAttck`

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/swimlane/PSAttck/blob/master/LICENSE.md) file for details

## FEEDBACK

Please submit any feedback, including defects and enhancement requests at: 

[Issues](https://github.com/swimlane/PSAttck/issues)

## CREDITS

This is a list of people and/or groups who have directly or indirectly
helped by offering significant suggestions & code without which `PSAttck`
would be a lesser product. In no particular order:


Name: Mathias Jessen
Twitter: [@IISResetMe](https://twitter.com/IISResetMe)
Blog: [https://blog.iisreset.me/](https://blog.iisreset.me/)


## Authors

* Josh Rickard - *Initial work* - [MSAdministrator](https://github.com/msadministrator)

See also the list of [contributors](https://github.com/swimlane/PSAttck/contributors) who participated in this project.


## Acknowledgments

First of all, I would like to thank everyone who contributes to open-source projects, especially the maintainers and creators of these projects.  Without them, this capability would not be possible.

This data set is generated from many different sources. As we continue to add more sources, we will continue to add them here.  Again thank you to all of these projects.  In no particular order, `PSAttck` utilizes data from the following projects:


* [Mitre ATT&CK APT3 Adversary Emulation Field Manual](https://attack.mitre.org/docs/APT3_Adversary_Emulation_Field_Manual.xlsx)
* [Atomic Red Team (by Red Canary)](https://github.com/redcanaryco/atomic-red-team)
* [Atomic Threat Coverage](https://github.com/atc-project/atomic-threat-coverage)
* [attck_empire (by dstepanic)](https://github.com/dstepanic/attck_empire)
* [sentinel-attack (by BlueTeamLabs)](https://github.com/BlueTeamLabs/sentinel-attack)
* [Litmus_test (by Kirtar22)](https://github.com/Kirtar22/Litmus_Test)
* [nsm-attack (by oxtf)](https://github.com/0xtf/nsm-attack)
* [osquery-attck (by teoseller)](https://github.com/teoseller/osquery-attck)
* [Mitre Stockpile](https://github.com/mitre/stockpile)
* [SysmonHunter (by baronpan)](https://github.com/baronpan/SysmonHunter)
* [ThreatHunting-Book (by 12306Bro)](https://github.com/12306Bro/Threathunting-book)
* [threat_hunting_tables (by dwestgard)](https://github.com/dwestgard/threat_hunting_tables)
* [APT Groups & Operations](https://docs.google.com/spreadsheets/d/1H9_xaxQHpWaa4O_Son4Gx0YOIzlcBWMsdvePFX68EKU/edit#gid=1864660085)
* [C2Matrix (by @jorgeorchilles, @brysonbort, @adam_mashinchi)](https://www.thec2matrix.com/)

    
## SEE ALSO

For more information, please visit [https://swimlane.com](https://swimlane.com)

Additionally, most of the functions have help associated with them e.g.:

```powershell
PS> Get-Help Get-Attck
```