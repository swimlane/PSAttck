# Enterprise Technique Class Documentation

The `EnterpriseTechnique` class inherits from the [Enterprise](Enterprise.md) class and is focused on generating `PSAttck.Enterprise.Technique` objects from MITRE ATT&CK data.

A typical `EnterpriseTechnique` object has the following properties:

* CreatedByReference
* Platform
* Permission
* Bypass
* EffectivePermissions
* ShortName
* Id
* Name
* Aliases
* Description
* Reference
* Created
* Modified
* Stix
* Type
* Wiki
* Contributor
* Network
* Remote
* SystemRequirements
* Detection
* DataSource

These additional properties are available from external data sources and enable you to view additional context data to help defend or attack using PSAttck:

* CommandList
* Commands
* Queries
* Datasets
* Detections

Additionally, every `EnterpriseTechnique` object has methods available.  These methods give you the ability to access related objects based on the selected Technique object.

* Tactics
* Actors
* Mitigations