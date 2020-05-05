# Enterprise Actor Class Documentation

The `EnterpriseActor` class inherits from the [Enterprise](Enterprise.md) class and is focused on generating `PSAttck.Enterprise.Actor` objects from MITRE ATT&CK data.

A typical `EnterpriseActor` object has the following properties:

* CreatedByReference
* Revoked
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

Certain `EnterpriseActor` objects will contain additional properties from external datasources:

- Dataset
- Country
- Operations
- AttributionLinks
- KnownTools
- Targets
- AdditionalComments
- ExternalDescription

Additionally, every `EnterpriseActor` object has methods available.  These methods give you the ability to access related objects based on the selected Actor object.

* Techniques
* Malwares
* Tools

