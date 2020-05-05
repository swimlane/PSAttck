# Enterprise Mitigation Class Documentation

The `EnterpriseMitigation` class inherits from the [Enterprise](Enterprise.md) class and is focused on generating `PSAttck.Enterprise.Mitigation` objects from MITRE ATT&CK data.

A typical `EnterpriseMitigation` object has the following properties:

* CreatedByReference
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

Additionally, every `EnterpriseMitigation` object has methods available.  These methods give you the ability to access related objects based on the selected Mitigation object.

* Techniques