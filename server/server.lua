local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    if Config.Active then
        local player = source
        local name, setKickReason, deferrals = name, setKickReason, deferrals;
        local UserIP -- Returns IP
        local identifiers = GetPlayerIdentifiers(player)
        deferrals.defer()
        Wait(0)
        deferrals.update(string.format(Lang:t("error.checking"), name))
        for _, v in pairs(identifiers) do
            if string.find(v, "ip") then
                UserIP = v:sub(4)
                break
            end
        end
        Wait(0)
        if not UserIP then
            deferrals.done(Lang:t("error.ip"))
        else
            PerformHttpRequest("http://ip-api.com/json/" .. UserIP .."?fields=16386", function(statusCode, response, headers)
                if tonumber(statusCode) == 200 then
                    local data = json.decode(response)
                    if data["countryCode"] == Config.CountryName then
                        deferrals.update(Lang:t("info.attempt"))
                        Wait(5000)
                        deferrals.update(Lang:t("error.failed"))
                    else
                        deferrals.done()
                    end
                else
                    deferrals.done(Lang:t("error.status"))
                end
            end)
        end
    end
end)