# Enterprise Tactic Class Documentation

The `EnterpriseTactic` class inherits from the [Enterprise](Enterprise.md) class and is focused on generating `PSAttck.Enterprise.Tactic` objects from MITRE ATT&CK data.

A typical `EnterpriseTactic` object has the following properties:

* CreatedByReference
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

Additionally, every `EnterpriseTactic` object has methods available.  These methods give you the ability to access related objects based on the selected Tactic object.

* Techniques