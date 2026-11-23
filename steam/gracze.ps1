$ErrorActionPreference = "Stop"

$konfiguracja = Get-Content -LiteralPath "./steam/gra.json" -Raw
$gra = $konfiguracja | ConvertFrom-Json

$url = "https://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?appid=$($gra.appid)"

$response = Invoke-RestMethod -Uri $url -UseBasicParsing -TimeoutSec 20

Write-Host "Gra: $($gra.nazwa)"
Write-Host "Liczba graczy online: $($response.response.player_count)"
