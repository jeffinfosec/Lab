#PowerShell to turn on / off proxy setting in IE (LAN Settings)

Write-Output " ";
Write-Output "PowerShell to turn on / off proxy setting in Internet Explorer (LAN Settings)";
Write-Output " ";

$regKey="HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
$proxyServer = "192.168.1.72"
$proxyServerToDefine = "192.168.1.72:3129"
Write-Host "Retrieve the proxy server ..."
$proxyServer = Get-ItemProperty -path $regKey ProxyServer -ErrorAction SilentlyContinue
Write-Host $proxyServer

if([string]::IsNullOrEmpty($proxyServer))
{
    Write-Host "Proxy is actually disabled"
    Read-Host "Proceed to enable?"
    Set-ItemProperty -path $regKey ProxyEnable -value 1
    Set-ItemProperty -path $regKey ProxyServer -value $proxyServerToDefine
    Write-Host "Proxy is now enabled"
    Write-Host $proxyServerToDefine
}
else
{
    Write-Host "Proxy is actually enabled"
    Read-Host "Proceed to disable?"
    Set-ItemProperty -path $regKey ProxyEnable -value 0
    Remove-ItemProperty -path $regKey -name ProxyServer
    Write-Host "Proxy is now disabled"
    }
    
    
    
    
    Read-Host -Prompt "Press Enter to continue"