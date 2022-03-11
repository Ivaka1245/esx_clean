ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('clean', function(source)
  local src = source
  local xPlayer  = ESX.GetPlayerFromId(src)
  xPlayer.removeInventoryItem('clean', 1)
  TriggerClientEvent('esx_clean:use', src)
end)