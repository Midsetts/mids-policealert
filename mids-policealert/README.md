<p align="center"><img src="https://i.imgur.com/Ome5KDF.png"/><br>

# Notes
I am merely updating this script as it is frequently used and liked by many. I will not be providing support for this; however, I will maintain pull requests that are made.

# Dependencies
- QBCore
- OxMySQL

# Installation
1. Download the most recent release.
2. Place the script in your [qb] folder.

## Production
Change `Config.Debug` to false.

## Development
Change `Config.Debug` to true.

Change `Config.DebugChance` to true.

## Optional
Open mdt/sv_mdt.lua and locate RegisterServerEvent("mdt:newCall"), replace with:  
```
RegisterServerEvent("mdt:newCall")
AddEventHandler("mdt:newCall", function(details, caller, coords, sendNotification)
  call_index = call_index + 1
  local xPlayers = QBCore.Functions.GetPlayers()
  for i= 1, #xPlayers do
  	local source = xPlayers[i]
  	local xPlayer = QBCore.Functions.GetPlayer(source)
  	if xPlayer.PlayerData.job.name == 'police' then
      if sendNotification ~= false then
        TriggerClientEvent("InteractSound_CL:PlayOnOne", source, 'demo', 1.0)
        TriggerClientEvent("mythic_notify:client:SendAlert", source, {type="inform", text="You have received a new call.", 5000, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' }})
      end

  		TriggerClientEvent("mdt:newCall", source, details, caller, coords, call_index)
  	end
  end
end)
```  

# Custom alerts 
For example, if we were to edit one of the jewelry heist scripts, you can replace the default method for alerting the police with the following:
```
local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '10000', infoM = 'fa-info-circle', info = 'Vangelico Jewelry Store'}

local dispatchData = {dispatchData = data, caller = 'Alarm', coords = vector3(-633.9, -241.7, 38.1)}

TriggerEvent('wf-alerts:svNotify', dispatchData)
```
You can define infoM2 and info2 for an additional line of text. If you are triggering the event from a client make sure you use TriggerServerEvent.


# Credits
- Jager_bom for esx_outlawalert  
- Stroudy for [WF_Alerts]([https://link](https://forum.cfx.re/t/dev-release-standalone-wf-alerts/1029331))
- distritic for [Hypaste RP's MDT](https://forum.cfx.re/t/esx-hypaste-rps-mobile-data-terminal-reports-warrants-calls-searches-more/1701472/1)