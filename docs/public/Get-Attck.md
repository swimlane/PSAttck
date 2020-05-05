# SYNOPSIS
    
Get-Attck is meant as an entry point to all MITRE ATT&CK data but it can also filter by property and value

## DESCRIPTION

Get-Attck can access all MITRE ATT&CK data.  You can also use the FilterBy and Value properties to filter through specific attributes and values.  Depending on the switch value you have selected, you can FilterBy property name
as well as select a specific property value.

## PARAMETERS

### PARAMETER Actor

A switch parameter to retrieve data about Actors

### PARAMETER Malware

A switch parameter to retrieve data about Malwares

### PARAMETER Tactic

A switch parameter to retrieve data about Tactics

### PARAMETER Technique

A switch parameter to retrieve data about Techniques

### PARAMETER Tool

A switch parameter to retrieve data about Tools

### PARAMETER FilterBy

A argument completer parameter that retrieves all properties on a given data object. This is based on the provided switch scope (e.g. Data object type)

### PARAMETER Value

A argumentt completer parameter that retrieves all values from the select FilterBy property.  This is based on the provided switch scope (e.g. Data object type)

## EXAMPLES

### EXAMPLE Access All Actor Information

```powershell
C:/> Get-Attck -Actor
```

```output

```

### EXAMPLE Retrieve a specific property from all Actors
    
```powershell
C:/> Get-Attck -Actor -FilterBy Name
```

```output

```

### EXAMPLE Retrieve a specific Actor based on a property and it's value
    
```powershell 
C:/> Get-Attck -Actor -FilterBy Name -Value 'OilRig'
```

```output

```

## OUTPUTS

PSAttck.Enterprise.Actor
PSAttck.Enterprise.Malware
PSAttck.Enterprise.Tactic
PSAttck.Enterprise.Technique
PSAttck.Enterprise.Tool

## NOTES
Both the FilterBy and Value properties will pre-populate values based on the selected Type of data you are filtering.

These properties are using ArgumentCompleters for ease of use