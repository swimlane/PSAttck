# PSAttck Functions

`PSAttck` is a PowerShell Module that interacts with the MITRE ATT&CK Framework

Currently, PSAttck supports access to the MITRE ATT&CK Enterprise framework with plans to add additional frameworks in the near future.

## DESCRIPTION

By default, PSAttck downloads data about the MITRE ATT&CK framework from
an external source.  Additional generated data sets are downloaded as well

You can set an alternate path to retrieve these data sets from by using 
the Set-PSAttckConfiguration Cmdlet

## COMPATIBILITY

PSAttck is compatible with Windows PowerShell 5 and PowerShell Core.

PSAttck utilizes PowerShell Classes to generate and create standard objects
across all ATT&CK data categories.

## FUNCTIONS

To see what functions are provided by PSAttck, execute the command:
Get-Command -Module PSAttck 

In addition to the below functions, you can also retrieve related data objects
defined within the MITRE ATT&CK Framework.  

Available functions and their related data objects are defined below:

* [Get-Attck](Get-Attck.md)
    * Select an ATT&CK data type and FilterBy a property name and its value (if desired)

* [Get-AttckActor](Get-AttckActor.md)
    * Retrieve all or a specific Actor by name
    * Related Data Objects:
        * Malwares
        * Tools
        * Techniques

* [Get-AttckMalware](Get-AttckMalware.md)
    * Retrieve all or a specific Malware by name
        *Related Data Objects:
            * Techniques
            * Actors


* [Get-AttckMitigation](Get-AttckMitigation.md)
    * Retrieve all or a specific Mitigation by name
        * Related Data Objects:
            * Techniques

* [Get-AttckTactic](Get-AttckTactic.md)
    * Retrieve all or a specific Tactic by name
        * Related Data Objects:
            * Techniques

* [Get-AttckTechnique](Get-AttckTechnique.md)
    * Retrieve all or a specific Technique by name
        * Related Data Objects:
            * Techniques
            * Actors
            * Mitigations
            * Datasets

* [Get-AttckTool](Get-AttckTool.md)
    * Retrieve all or a specific Tool by name
        * Related Data Objects:
            * Techniques
            * Actors

## MISCELLANEOUS FEATURES

PSAttck also allows you to retrieve [external data sets](../external-data/README.md) related to Techniques
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

## FEEDBACK

Please submit any feedback, including defects and enhancement requests at: 

https://github.com/swimlane/PSAttck/issues

## CREDITS
    
This is a list of people and/or groups who have directly or indirectly
helped by offering significant suggestions & code without which PSAttck
would be a lesser product. In no particular order:

Name: Mathias Jessen
Twitter: @IISResetMe
Blog: https://blog.iisreset.me/

## SEE ALSO
    
For more information, please visit https://swimlane.com 

Additionally, most of the functions have help associated with 
them e.g.:

```powershell
PS> Get-Help Get-Attck
```
