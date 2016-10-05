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
 
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${deployed.container.ctm_empath}/lib"
export LD_LIBRARY_PATH
 
${deployed.container.ctm_empath}/bin/em cli -U '${deployed.container.ctm_emlogin}' -P '${deployed.container.ctm_empwd}' -H '${deployed.container.ctm_emgui' -TABLE_DELETE '${deployed.ctmsrv}' '${deployed.ctm_XML_table}' Delete
 
COMMAND_EXIT_CODE=$?
 
exit $COMMAND_EXIT_CODE

