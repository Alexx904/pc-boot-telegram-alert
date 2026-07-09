# pc-boot-telegram-alert

A lightweight PowerShell script that sends you a **Telegram notification every time your PC starts up**. Useful for keeping track of when a machine (e.g. a home server, a remote PC, or a family computer) has been powered on.

---

## 🇬🇧 English

### What it does

`pc-boot-telegram-alert.ps1` runs at Windows startup and sends a message to a Telegram chat via a Telegram Bot, containing:

- The computer name (`$env:COMPUTERNAME`)
- The exact date and time of boot

Example message:

> 🖥️ The PC *DESKTOP-ABC123* turned on at 09/07/2026 08:15:32

If sending the message fails (e.g. no internet connection), the error is logged to a file instead of failing silently:

```
%USERPROFILE%\error.log
```

### Requirements

- Windows with PowerShell (built-in on Windows 10/11)
- A Telegram bot token (create one via [@BotFather](https://t.me/BotFather))
- Your Telegram chat ID (you can get it via [@userinfobot](https://t.me/userinfobot) or by calling the bot's `getUpdates` API)
- Internet access at boot time

### Setup

1. **Clone or download** this repository:
   ```powershell
   git clone https://github.com/Alexx904/pc-boot-telegram-alert.git
   ```

2. **Open `pc-boot-telegram-alert.ps1`** and replace the placeholders with your own values:
   ```powershell
   $botToken = "bot_token_here"
   $chatId   = "chat_id_here"
   ```

3. **Test it manually** first to make sure it works:
   ```powershell
   powershell -ExecutionPolicy Bypass -File "C:\path\to\pc-boot-telegram-alert.ps1"
   ```
   You should receive a message in your Telegram chat.

4. **Run it automatically at startup.** Two common options:

   **Option A – Task Scheduler (recommended)**
   1. Open **Task Scheduler** → *Create Task...*
   2. **General** tab: give it a name (e.g. `PC Boot Telegram Alert`), select *Run whether user is logged on or not*.
   3. **Triggers** tab: New trigger → *At startup*.
   4. **Actions** tab: New action → Program/script: `powershell.exe`, Arguments:
      ```
      -ExecutionPolicy Bypass -WindowStyle Hidden -File "C:\path\to\pc-boot-telegram-alert.ps1"
      ```
   5. Save (you may need to enter your Windows credentials).

   **Option B – Startup folder shortcut**
   1. Create a shortcut to `powershell.exe` with the same arguments as above.
   2. Place the shortcut in:
      ```
      shell:startup
      ```
      (paste this into the Windows Run dialog to open the folder)

### Notes

- The script uses `Invoke-RestMethod` to call the Telegram Bot API (`sendMessage`) with `parse_mode = Markdown`.
- Keep your bot token private — anyone with it can send messages through your bot.
- The request has a 15-second timeout to avoid hanging at boot if there's no connectivity.

### License

MIT License

---

## 🇮🇹 Italiano

### Cosa fa

`pc-boot-telegram-alert.ps1` viene eseguito all'avvio di Windows e invia un messaggio a una chat Telegram tramite un Bot Telegram, contenente:

- Il nome del computer (`$env:COMPUTERNAME`)
- La data e l'ora esatte dell'avvio

Esempio di messaggio:

> 🖥️ The PC *DESKTOP-ABC123* turned on at 09/07/2026 08:15:32

Se l'invio del messaggio fallisce (ad esempio per mancanza di connessione internet), l'errore viene registrato in un file invece di fallire silenziosamente:

```
%USERPROFILE%\error.log
```

### Requisiti

- Windows con PowerShell (già incluso in Windows 10/11)
- Un token di un bot Telegram (creabile tramite [@BotFather](https://t.me/BotFather))
- Il tuo chat ID Telegram (ottenibile tramite [@userinfobot](https://t.me/userinfobot) o chiamando l'API `getUpdates` del bot)
- Connessione a internet al momento dell'avvio

### Configurazione

1. **Clona o scarica** questo repository:
   ```powershell
   git clone https://github.com/Alexx904/pc-boot-telegram-alert.git
   ```

2. **Apri `pc-boot-telegram-alert.ps1`** e sostituisci i placeholder con i tuoi valori:
   ```powershell
   $botToken = "bot_token_here"
   $chatId   = "chat_id_here"
   ```

3. **Testalo manualmente** per verificare che funzioni:
   ```powershell
   powershell -ExecutionPolicy Bypass -File "C:\percorso\pc-boot-telegram-alert.ps1"
   ```
   Dovresti ricevere un messaggio nella tua chat Telegram.

4. **Impostalo per l'esecuzione automatica all'avvio.** Due opzioni comuni:

   **Opzione A – Utilità di pianificazione (consigliata)**
   1. Apri **Utilità di pianificazione** → *Crea attività...*
   2. Scheda **Generale**: assegna un nome (es. `PC Boot Telegram Alert`), seleziona *Esegui indipendentemente dal fatto che l'utente abbia eseguito l'accesso*.
   3. Scheda **Trigger**: Nuovo → *All'avvio del sistema*.
   4. Scheda **Azioni**: Nuova azione → Programma/script: `powershell.exe`, Argomenti:
      ```
      -ExecutionPolicy Bypass -WindowStyle Hidden -File "C:\percorso\pc-boot-telegram-alert.ps1"
      ```
   5. Salva (potrebbe essere richiesto di inserire le credenziali Windows).

   **Opzione B – Collegamento nella cartella Esecuzione automatica**
   1. Crea un collegamento a `powershell.exe` con gli stessi argomenti indicati sopra.
   2. Inserisci il collegamento in:
      ```
      shell:startup
      ```
      (incolla questo percorso nella finestra "Esegui" di Windows per aprire la cartella)

### Note

- Lo script utilizza `Invoke-RestMethod` per chiamare l'API del Bot Telegram (`sendMessage`) con `parse_mode = Markdown`.
- Mantieni privato il token del bot: chiunque lo possieda può inviare messaggi tramite il tuo bot.
- La richiesta ha un timeout di 15 secondi per evitare blocchi all'avvio in caso di mancanza di connettività.

### Licenza

MIT License
