<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
#!/bin/sh
 
<#if deployed.container.envVars??>
<#assign envVars=deployed.container.envVars />
<#list envVars?keys as envVar>
${envVar}="${envVars[envVar]}"
export ${envVar}
</#list>
</#if>
 
CONTROLM="${deployed.container.ctmagpath}/ctm"
export CONTROLM
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CONTROLM/exe"
export LD_LIBRARY_PATH
$CONTROLM/exe/ctmpwd -ACTION UPDATE -USER '${deployed.ctm_login}' -PASSWORD '${deployed.ctm_password}' -OLD_PASSWORD '${previousDeployed.ctm_password}'

