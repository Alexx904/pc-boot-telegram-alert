# =========================================================
# pc-boot-telegram-alert
# =========================================================

$botToken = "bot_token_here" 
$chatId   = "chat_id_here"    

$pcName = $env:COMPUTERNAME
$datetime = Get-Date -Format "dd/MM/yyyy HH:mm:ss"

$message = "🖥️ The PC *$pcName* turned on at $datetime"

$uri = "https://api.telegram.org/bot$botToken/sendMessage"

$body = @{
    chat_id    = $chatId
    text       = $message
    parse_mode = "Markdown"
}

try {
    Invoke-RestMethod -Uri $uri -Method Post -Body $body -TimeoutSec 15 | Out-Null
} catch {
    $logPath = "$env:USERPROFILE\error.log"
    "$(Get-Date) - Error sending notification: $($_.Exception.Message)" | Out-File -Append -FilePath $logPath
}