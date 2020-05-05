# PSAttck Classes

PSAttck utilizes PowerShell classes to generate and construct objects in a standard format across all data types.

The main class in PSAttck is the [PSAttck.psm1](PSAttck.md) class.  Currently this class has no methods, but it is a placeholder for future expansion.

All Mitre ATT&CK frameworks will inherit the [PSAttck.psm1](PSAttck.md).  

## Mitre ATT&CK Enterprise Framework

The Mitre ATT&CK Enterprise Framework main entry point is the [Enterprise](enterprise/Enterprise.md) class which inherits from [PSAttck.psm1](PSAttck.md) class.  All other sub-classes under the scope of [Enterprise](enterprise/Enterprise.md) inherit from it.  The following classes inherit from the [Enterprise](enterprise/Enterprise.md) class.  You can find their respective documentation below:

* [EnterpriseActor](enterprise/EnterpriseActor.md)
* [EnterpriseMalware](enterprise/EnterpriseMalware.md)
* [EnterpriseMitigation](enterprise/EnterpriseMitigation.md)
* [EnterpriseTactic](enterprise/EnterpriseTactic.md)
* [EnterpriseTechnique](enterprise/EnterpriseTechnique.md)
* [EnterpriseTool](enterprise/EnterpriseTool.md)


The [Enterprise](enterprise/Enterprise.md) class has shared methods that child classes (like [EnterpriseTool](enterprise/EnterpriseTool.md)) will inherit and have the ability to use to format and parse data.  You can find documentation for the [Enterprise class here](enterprise/Enterprise.md).
