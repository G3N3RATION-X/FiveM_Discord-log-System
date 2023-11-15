Config = {}

function SendWebHook(whLink, title, color, message)
    local embedMsg = {}
    timestamp = os.date("%X")
    embedMsg = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] =  ""..message.."",
            ["footer"] ={
                ["text"] = timestamp.." (Server Zeit).",
            },
        }
    }
    PerformHttpRequest(whLink,
    function(err, text, headers)end, 'POST', json.encode({username = Config.whName, avatar_url= Config.whLogo ,embeds = embedMsg}), { ['Content-Type']= 'application/json' })
end


AddEventHandler('z64_logs:sendWebhook', function(whData)
    if whData.link == nil then
        whLink = Config.whlink
    else
        whLink = whData.link
    end
    title = whData.title
    color = whData.color
    message = whData.message
    SendWebHook(whLink, title, color, message)
end)

Citizen.CreateThread(function()
    if Config.loginLog then
        if Config.loginLogLink == '' then
            print('^7[^1INFO^7]: Bitte Webhook eintragen')
        else
        AddEventHandler('playerJoining', function()
            local id = source
            local ids = GetPlayerIdentifier(id, steam)
            local plyName = GetPlayerName(id)
            local whData = {
                link = Config.loginLogLink,
                title = plyName.." hat den Server betreten",
                color = 655104,
                message = 
                '**[Spieler]: **'..plyName..'\n'..
                '**[Kennung]: **'..ids..'\n'..
                '**[Zugewiesene ID]: **'..id..'\n'
            }
            TriggerEvent('z64_logs:sendWebhook', whData)
        end)

        AddEventHandler('playerDropped', function(reason)
            local id = source
            local ids = GetPlayerIdentifier(id, steam)
            local plyName = GetPlayerName(id)
            local reason = reason
            local whData = {
                link = Config.loginLogLink,
                title = plyName.." hat den Server verlassen",
                color = 16711689,
                message = 
                '**[Spieler]: **'..plyName..'\n'..
                '**[Kennung]: **'..ids..'\n'..
                '**[Grund]: **'..reason..'\n'
            }
            TriggerEvent('z64_logs:sendWebhook', whData)
        end)
        end
    end
end)

AddEventHandler('onResourceStart', function(resource)
    resName = GetCurrentResourceName()
    if resource == resName then
        if Config.whlink == '' then
            print('^7[^1INFO^7]: Keine Hauptwebhook hinterlegt!')
        else 
            print('^7[^2INFO^7]: '..resName..' Erfolgreich Initialisiert')
            local whData = {
                link = Config.whlink,
                title = "Script Start...",
                color = 4521728,
                message = 
                '**'..resName..'** Wurde erfolgreich Gestartet'
            }
            TriggerEvent('z64_logs:sendWebhook', whData)
        end
    end
end)
aConfig = {}

function SendWebHook(whLink, title, color, message)
    local embedMsg = {}
    timestamp = os.date("%X")
    embedMsg = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] =  ""..message.."",
            ["footer"] ={
                ["text"] = timestamp.." (Server Zeit).",
            },
        }
    }
    PerformHttpRequest(whLink,
    function(err, text, headers)end, 'POST', json.encode({username = Config.whName, avatar_url= Config.whLogo ,embeds = embedMsg}), { ['Content-Type']= 'application/json' })
end


AddEventHandler('z64_logs:sendWebhook', function(whData)
    if whData.link == nil then
        whLink = Config.whlink
    else
        whLink = whData.link
    end
    title = whData.title
    color = whData.color
    message = whData.message
    SendWebHook(whLink, title, color, message)
end)

Citizen.CreateThread(function()
    if Config.loginLog then
        if Config.loginLogLink == '' then
            print('^7[^1INFO^7]: Bitte Webhook eintragen')
        else
        AddEventHandler('playerJoining', function()
            local id = source
            local ids = GetPlayerIdentifier(id, steam)
            local plyName = GetPlayerName(id)
            local whData = {
                link = Config.loginLogLink,
                title = plyName.." hat den Server betreten",
                color = 655104,
                message = 
                '**[Spieler]: **'..plyName..'\n'..
                '**[Kennung]: **'..ids..'\n'..
                '**[Zugewiesene ID]: **'..id..'\n'
            }
            TriggerEvent('z64_logs:sendWebhook', whData)
        end)

        AddEventHandler('playerDropped', function(reason)
            local id = source
            local ids = GetPlayerIdentifier(id, steam)
            local plyName = GetPlayerName(id)
            local reason = reason
            local whData = {
                link = Config.loginLogLink,
                title = plyName.." hat den Server verlassen",
                color = 16711689,
                message = 
                '**[Spieler]: **'..plyName..'\n'..
                '**[Kennung]: **'..ids..'\n'..
                '**[Grund]: **'..reason..'\n'
            }
            TriggerEvent('z64_logs:sendWebhook', whData)
        end)
        end
    end
end)

AddEventHandler('onResourceStart', function(resource)
    resName = GetCurrentResourceName()
    if resource == resName then
        if Config.whlink == '' then
            print('^7[^1INFO^7]: Keine Hauptwebhook hinterlegt!')
        else 
            print('^7[^2INFO^7]: '..resName..' Erfolgreich Initialisiert')
            local whData = {
                link = Config.whlink,
                title = "Script Start...",
                color = 4521728,
                message = 
                '**'..resName..'** Wurde erfolgreich Gestartet'
            }
            TriggerEvent('z64_logs:sendWebhook', whData)
        end
    end
end)
