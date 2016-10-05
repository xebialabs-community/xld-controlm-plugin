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
 
set PATH=%PATH%;${deployed.container.ctm_empath}\bin
 
emdef deftable -u "${deployed.container.ctm_emlogin}" -p "${deployed.container.ctm_empwd}" -s "${deployed.container.ctm_emgui}" -src "${deployed.file}" /a /o /t
 
<#if deployed.upload>
for /f "delims=" %%i in ('cli -U "${deployed.container.ctm_emlogin}" -P "${deployed.container.ctm_empwd}" -H "${deployed.container.ctm_emgui}" -TABLE_UPLOAD "${deployed.ctmsrv}" "${deployed.ctm_XML_table}"') do set output=%%i
</#if>

ECHO %output%
SET EXPECTED=Request was accomplished...
 
IF "%output%"=="%EXPECTED%" (
                SET COMMAND_EXIT_CODE=0
) ELSE (
                SET COMMAND_EXIT_CODE=1
)
 
REM set COMMAND_EXIT_CODE=%ERRORLEVEL%
 
endlocal
exit %COMMAND_EXIT_CODE% 

