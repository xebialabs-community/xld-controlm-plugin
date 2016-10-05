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
 
 
${deployed.container.ctm_empath}/bin/deftable -u '${deployed.container.ctm_emlogin}' -p '${deployed.container.ctm_empwd}' -s '${deployed.container.ctm_emgui}' -src '${deployed.file}' -out /tmp/toto.log /a /o /t /v
 
<#if deployed.upload>
                ${deployed.container.ctm_empath}/bin/em cli -U '${deployed.container.ctm_emlogin}' -P '${deployed.container.ctm_empwd}' -H '${deployed.container.ctm_emgui}' -TABLE_UPLOAD '${deployed.ctmsrv}' '${deployed.ctm_XML_table}'
</#if>
 
COMMAND_EXIT_CODE=$?
 
exit $COMMAND_EXIT_CODE
 

