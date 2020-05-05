# Enterprise Class Documentation

The `Enterprise` class inherits from the `PSAttck` class and is scoped for accessing the Mitre ATT&CK Enterprise Framework.

The following child classes inherit from the `Enterprise` class:

* [EnterpriseActor](EnterpriseActor.md)
* [EnterpriseMalware](EnterpriseMalware.md)
* [EnterpriseMitigation](EnterpriseMitigation.md)
* [EnterpriseTactic](EnterpriseTactic.md)
* [EnterpriseTechnique](EnterpriseTechnique.md)
* [EnterpriseTool](EnterpriseTool.md)

## Parent Class Methods

The `Enterprise` class has the following methods which all child classes can access and use to format and generate data for their objects:

### Constructor

The constructor will determine if a static property named `relationships` does not have a value.  If it does not, which is the default when it is instantiated for the first time, it will generate a relationship object for all items within the Mitre ATT&CK Framework

Additionally, the following default properties are created for any object or class inheriting from this class.  These are standard properties across all data objects:

* Id
* Name
* Alias
* Description
* Reference
* Created
* Modified
* Stix
* Type
* Wiki
* Contributor

### Additional Methods

The following methods are also within this parent class, which most child classes utilize:

* SetIdAttribute
* SetListAttribute
* SetAttribute
* SetDateTimeAttribute
* SetWikiAttribute
* SetReferenceAttribute