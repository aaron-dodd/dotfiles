$SunriseTime = (Get-Date).toLocalTime()
$SunsetTime = (Get-Date).toLocalTime()

try {
    $RequestTimeout = 10

    $PublicIP = Invoke-RestMethod -Uri "https://api.ipify.org?format=json" -TimeoutSec $RequestTimeout | Select-Object -ExpandProperty ip
    $Latitude, $Longitude = (Invoke-RestMethod -Uri "https://ipinfo.io/$PublicIP/json" -TimeoutSec $RequestTimeout).loc -split ','
    $Daylight = (Invoke-RestMethod "https://api.sunrise-sunset.org/json?lat=$Latitude&lng=$Longitude" -TimeoutSec $RequestTimeout).results

    $SunriseTime = ($Daylight.Sunrise | Get-Date).ToLocalTime()
    $SunsetTime = ($Daylight.Sunset | Get-Date).ToLocalTime()
} catch {
    # Default to 7am and 7pm.
    $SunriseTime = ((Get-Date).Date.AddHours(7)).toLocalTime()
    $SunsetTime = ((Get-Date).Date.AddHours(19)).toLocalTime()
}

$CurrentLocaltime = (Get-Date).toLocalTime();

if ($CurrentLocaltime -gt $SunriseTime -and $CurrentLocaltime -lt $SunsetTime) {
    "Setting Light Mode for applications and operating system..."
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 1 -Type Dword -Force;
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 1 -Type Dword -Force;
    Start-Process -FilePath "C:\Windows\Resources\Themes\themeC.theme"
    Start-Process -FilePath "C:\Windows\Resources\Themes\themeD.theme"
} else {
    "Setting Dark Mode for applications and operating system..."
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force;
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force;
    Start-Process -FilePath "C:\Windows\Resources\Themes\themeA.theme"
    Start-Process -FilePath "C:\Windows\Resources\Themes\themeB.theme"
}
