local Callback = exports.plouffe_lib:Get("Callback")

function RepFnc:Start()

end

function RepFnc:ShowReputation(reputation)
    local data = Callback:Sync("plouffe_reputations:getReputations", reputation, Rep.Utils.MyAuthKey)
    local current = math.floor(data.current)
    local percent = ""

    if current < 0.0 then
        current = tostring(current - data.rankMaximum)
        data.rankMaximum = data.rankMaximum - data.rankMinimum - 1
        percent = current:sub(0,current:len() - 2)..tostring(" / "..data.rankMaximum)
    else
        percent = current..tostring(" / "..data.rankMaximum)
    end

    percent = percent:gsub("-","")

    local data = {
        {
            id = 1,
            header = data.label,
            txt = "Informations sur votre réputation avec "..data.label,
            params = {
                event = "",
                args = {
                    fnc = ""
                }
            }
        },
        {
            id = 2,
            header = data.reputationLabel,
            txt = "Votre relation avec "..data.label,
            params = {
                event = "",
                args = {
                    fnc = ""
                }
            }
        },
        {
            id = 3,
            header = percent,
            txt = "Votre progression avant le prochain rang",
            params = {
                event = "",
                args = {
                    fnc = ""
                }
            }
        }
    }

    exports.ooc_menu:Open(data)
end

exports("ShowReputation", function(reputation)
    RepFnc:ShowReputation(reputation)
end)