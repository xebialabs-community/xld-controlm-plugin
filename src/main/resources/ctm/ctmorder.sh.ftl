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
 
<#if deployed.ctm_HOLD??>
OPTION="$OPTION -hold y"
</#if>
<#if deployed.ctm_Force??>
OPTION="$OPTION -force y"
</#if>
<#if deployed.ctm_WaitODAT??>
OPTION="$OPTION -odate_option run_date "
</#if>
 
CONTROLM="${deployed.container.ctmagpath}/ctm"
export CONTROLM
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CONTROLM/exe"
export LD_LIBRARY_PATH
 
$CONTROLM/exe/ctmorder -TABLE '${deployed.ctm_table}' -NAME '${deployed.ctm_job}'  -ODATE '${deployed.ctm_ODAT}' $OPTION
 
COMMAND_EXIT_CODE=$?
 
exit $COMMAND_EXIT_CODE

