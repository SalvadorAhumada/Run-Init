# Presses "down" key every 10 seconds
Write-Host "I'm pressing the down key every 10 seconds!"
Write-Host "Press Ctrl+C to exit"

$i = 0

$delay = 10000

while($i -eq 0) {
    $myshell = New-Object -com "Wscript.Shell"
    $myshell.sendkeys("{Down}")
    Start-Sleep -m $delay
}