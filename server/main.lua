RegisterNetEvent("plouffe_reputations:sendConfig",function()
    local playerId = source
    local registred, key = Auth:Register(playerId)

    if registred then
        local cbArray = Rep
        cbArray.Utils.MyAuthKey = key
        TriggerClientEvent("plouffe_reputations:getConfig", playerId, cbArray)
    else
        TriggerClientEvent("plouffe_reputations:getConfig", playerId, nil)
    end
end)

Callback:RegisterServerCallback("plouffe_reputations:getReputations", function(playerId,cb,reputation,authkey)
    if Auth:Validate(playerId,authkey) then
        if Auth:Events(playerId,"plouffe_reputations:getReputations") then
            cb(RepFnc:GetReputation(playerId,reputation))
        end
    end
end)