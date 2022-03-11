ESX = nil

CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Wait(0)
  end
end)

RegisterNetEvent('esx_clean:use')
AddEventHandler('esx_clean:use', function()
  local playerPed = PlayerPedId()
  local coords = GetEntityCoords(playerPed)
  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
    if not IsPedInAnyVehicle(playerPed) then
      local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
      if DoesEntityExist(vehicle) then
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
        FreezeEntityPosition(playerPed, true)
        Wait(10000)
        SetVehicleDirtLevel(vehicle, 0)
        FreezeEntityPosition(playerPed, false)
        ClearPedTasksImmediately(playerPed)
        ESX.ShowNotification("The car is clean!")
      end
    else
      ESX.ShowNotification("You must be in a car!")
    end
  end
end)
