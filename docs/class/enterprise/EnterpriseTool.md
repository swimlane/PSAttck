# Enterprise Tool Class Documentation

The `EnterpriseTool` class inherits from the [Enterprise](Enterprise.md) class and is focused on generating `PSAttck.Enterprise.Tool` objects from MITRE ATT&CK data.

A typical `EnterpriseTool` object has the following properties:

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

Certain `EnterpriseTool` objects will contain additional properties from external data sources:

- ToolsDataset
- AdditionalNames
- AttributionLinks
- Family
- AdditionalComments
- C2Matrix
- {Actively Maint.}
- Agent
- API
- {ATT&CK Mapping}
- Chaining
- {Custom Profile}
- Dashboard
- Date
- DNS
- DoH
- DomainFront
- Evaluator
- FTP
- {GH Issues}
- GitHub
- {How-To}
- HTTP
- HTTP2
- HTTP3
- ICMP
- IMAP
- Implementation
- Jitter
- Kali
- {Key Exchange}
- {Kill Date}
- License
- Linux
- Logging
- macOS
- MAPI
- {Multi-User}
- c2Name
- Notes
- Price
- {Proxy Aware}
- Server
- Site
- Slack
- {Slack Members}
- SMB
- Stego
- TCP
- Twitter
- UI
- {Version Reviewed}
- Windows
- {Working Hours}


Additionally, every `EnterpriseTool` object has methods available.  These methods give you the ability to access related objects based on the selected Tool object.

* Techniques
* Actors