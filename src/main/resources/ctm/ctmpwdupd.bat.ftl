<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
@echo off
setlocal
 
<#if deployed.container.envVars??>
<#assign envVars=deployed.container.envVars />
<#list envVars?keys as envVar>
set ${envVar}=${envVars[envVar]}
</#list>
</#if>
 
set PATH=%PATH%;${deployed.container.ctmagpath}\bin
 
ctmpwd -ACTION UPDATE -USER "${deployed.ctm_login}" -PASSWORD "${deployed.ctm_password}" -OLD_PASSWORD "${previousDeployed.ctm_password}"

