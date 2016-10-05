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
 
<#if deployed.ctm_HOLD??>
set OPTION=%OPTION% -hold y
</#if>
<#if deployed.ctm_Force??>
set OPTION=%OPTION% -force y
</#if>
<#if deployed.ctm_WaitODAT??>
set OPTION=%OPTION%  -odate_option run_date
</#if>
 
ctmorder -TABLE "${deployed.ctm_table}" -NAME "${deployed.ctm_job}"  -ODATE "${deployed.ctm_ODAT}" %OPTION%
 
set COMMAND_EXIT_CODE=%ERRORLEVEL%
 
endlocal
exit %COMMAND_EXIT_CODE%

