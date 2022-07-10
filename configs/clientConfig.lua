Rep = {}
RepFnc = {} 
TriggerServerEvent("plouffe_reputations:sendConfig")

RegisterNetEvent("plouffe_reputations:getConfig",function(list)
	if list == nil then
		CreateThread(function()
			while true do
				Wait(0)
				Rep = nil
				RepFnc = nil
				ESX = nil
			end
		end)
	else
		Rep = list
		RepFnc:Start()
	end
end)