#
# Module manifest for module 'EnableSSHRemoting'
#

@{

# Script module or binary module file associated with this manifest.
RootModule = '.\EnableSSHRemoting.psm1'

# Version number of this module.
ModuleVersion = '0.1'

# ID used to uniquely identify this module
GUID = '45b6342f-04ad-4bae-91b8-ed783d553e74'

# Author of this module
Author = 'Paul Higinbotham'

# Description of the functionality provided by this module
Description = '
This module is the beginning of work to enable and test SSH based remoting on all PowerShell 6.0 supported 
platforms, which currently include Windows, Linux, and MacOS.  

PowerShell SSH remoting was implemented in PowerShell 6.0 but requries SSH (client) and SSHD (service) components 
to be installed.  In addition the sshd_config configuration file must be updated to define a PowerShell endpoint
as a subsystem.  Once this is done PowerShell remoting cmdlets can be used to establish a PowerShell remoting
session over SSH that works across platforms.

$session = New-PSSession -HostName LinuxComputer1 -UserName paulhig -SSHTransport

The module exports two functions: Enable-SSHRemoting, Test-SSHRemoting.

Enable-SSHRemoting:
This cmdlet does the following:
 - Detects platform
 - Detects PowerShell 6.0 on system (if a pwsh.exe path is not provided)
 - Verifies PowerShell operation and version
 - Detects SSH client on system
 - Detects SSHD service running on system
 - Detects sshd_config file
 - Updates sshd_config file to include PowerShell endpoint subsystem
 - Restarts SSHD service

The current status of this module is "alpha".  It has only been tested on Windows 10 and Linux Ubuntu platforms,
so it still needs to be tested other supported platforms.  The Test-SSHRemoting cmdlet needs to be implemented.

Also if no PowerShell 6.0, SSH, or SSHD is found then an error is thrown asking the user to find and install it.
It would be much better if the needed package was downloaded and installed automatically.  Also it would be nice
if this was turned into a C# module rather than a script module.  

I hope that others will take this at its current state and bring to a 1.0 release level.
'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '6.0'

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Enable-SSHRemoting','Test-SSHRemoting'

}
