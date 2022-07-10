function RepFnc:StringifyIdentity(state_id)
    return ("reputation_%s"):format(state_id)
end

function RepFnc:AssureReputationsFromxPlayer(identityIndex)
    local exists = true
    
    Server.UsersReputations[identityIndex] = json.decode(GetResourceKvpString(identityIndex)) or {}

    for k,v in pairs(Server.Reputations) do
        if not Server.UsersReputations[identityIndex][k] then
            exists = false
            Server.UsersReputations[identityIndex][k] = 0
        end
    end

    if not exists then
        SetResourceKvp(identityIndex, json.encode(Server.UsersReputations[identityIndex]))
    end
end

function RepFnc:AddReputation(playerId,reputation,amount)
    if not playerId then 
        return
    end

    local identityIndex = self:StringifyIdentity(exports.ooc_core:getPlayerFromId(playerId).state_id)

    self:AssureReputationsFromxPlayer(identityIndex)

    if Server.UsersReputations[identityIndex][reputation] then
        if Server.UsersReputations[identityIndex][reputation] + 0.0 ~= Server.Reputations[reputation].maximum + 0.0 then

            if Server.UsersReputations[identityIndex][reputation] + amount > Server.Reputations[reputation].maximum then
                Server.UsersReputations[identityIndex][reputation] = Server.Reputations[reputation].maximum + 0.0
                TriggerClientEvent('plouffe_lib:notify', playerId, { type = 'success', text = "Votre réputation avec "..Server.Reputations[reputation].label.." est maximal", length = 3000})
            else
                Server.UsersReputations[identityIndex][reputation] = Server.UsersReputations[identityIndex][reputation] + amount
                TriggerClientEvent('plouffe_lib:notify', playerId, { type = 'success', text = 'Vous avez gagner '..tostring(amount).." points de réputation avec "..Server.Reputations[reputation].label, length = 5000})
            end

            SetResourceKvp(identityIndex, json.encode(Server.UsersReputations[identityIndex]))
        end
    end
end

function RepFnc:RemoveReputation(playerId,reputation,amount)
    if not playerId then 
        return
    end

    local identityIndex = self:StringifyIdentity(exports.ooc_core:getPlayerFromId(playerId).state_id)
    self:AssureReputationsFromxPlayer(identityIndex)

    if Server.UsersReputations[identityIndex][reputation] then
        if Server.UsersReputations[identityIndex][reputation] + 0.0 ~= Server.Reputations[reputation].minimum + 0.0 then

            if Server.UsersReputations[identityIndex][reputation] - amount < Server.Reputations[reputation].minimum then
                Server.UsersReputations[identityIndex][reputation] = Server.Reputations[reputation].minimum + 0.0
                TriggerClientEvent('plouffe_lib:notify', playerId, { type = 'error', text = "Votre réputation avec "..Server.Reputations[reputation].label.." est minimal", length = 3000})
            else
                Server.UsersReputations[identityIndex][reputation] = Server.UsersReputations[identityIndex][reputation] - amount
                TriggerClientEvent('plouffe_lib:notify', playerId, { type = 'error', text = 'Vous avez perdu '..tostring(amount).." points de réputation avec "..Server.Reputations[reputation].label, length = 5000})
            end

            SetResourceKvp(identityIndex, json.encode(Server.UsersReputations[identityIndex]))
        end
    end
end

function RepFnc:GetReputation(playerId,reputation)
    if not playerId then 
        return
    end
    
    local identityIndex = self:StringifyIdentity(exports.ooc_core:getPlayerFromId(playerId).state_id)

    self:AssureReputationsFromxPlayer(identityIndex)
    
    local currentReputation = Server.UsersReputations[identityIndex][reputation]
    local data = {
        current = currentReputation, 
        label = Server.Reputations[reputation].label, 
        name = Server.Reputations[reputation].name,
        maximum = Server.Reputations[reputation].maximum
    }

    for k,v in pairs(Server.Reputations[reputation].levels) do
        if currentReputation >= 0.0 then
            if currentReputation >= v.minimum and currentReputation <= v.maximum then
                data.reputationLabel = v.label
                data.rankMaximum = v.maximum
                data.rankMinimum = v.minimum
                break
            end
        else
            if currentReputation <= v.minimum and currentReputation >= v.maximum then
                data.reputationLabel = v.label
                data.rankMaximum = v.maximum
                data.rankMinimum = v.minimum
                break
            end
        end
    end

    if Server.UsersReputations[identityIndex][reputation] then
        return data
    end

    return {}
end

exports("AddReputation", function(playerId,reputation,amount)
    RepFnc:AddReputation(playerId,reputation,amount)
end)

exports("RemoveReputation", function(playerId,reputation,amount)
    RepFnc:RemoveReputation(playerId,reputation,amount)
end)

exports("GetReputation", function(playerId,reputation)
    return RepFnc:GetReputation(playerId,reputation)
end)