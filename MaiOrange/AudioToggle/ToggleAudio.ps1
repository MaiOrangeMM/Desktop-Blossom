try {
    Import-Module AudioDeviceCmdlets -ErrorAction Stop

    $device1 = "{0.0.0.00000000}.{8b312d21-8ec0-42fc-ac15-a1fe7f8bcc3c}"  # Headphones
    $device2 = "{0.0.0.00000000}.{f89069c2-13f5-4c7d-8a35-fc8b85cc5621}"  # SONOS

    $statusFile = "$PSScriptRoot\\CurrentAudio.txt"

    $current = Get-AudioDevice -Playback

    if ($current.ID -eq $device1) {
        Set-AudioDevice -ID $device2
        "SONOS" | Set-Content $statusFile
    } else {
        Set-AudioDevice -ID $device1
        "Headphones" | Set-Content $statusFile
    }
} catch {
    "Fehler" | Set-Content $statusFile
}
