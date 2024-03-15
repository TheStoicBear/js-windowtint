RegisterNetEvent('tintmeter:useItem', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local vehicle, vehicleCoords = lib.getClosestVehicle(playerCoords, 2.0, false)
    
    if vehicle then
        ExecuteCommand("me Attaching tint meter to the window")
        RequestAnimDict('weapons@first_person@aim_rng@generic@projectile@sticky_bomb@')
        while not HasAnimDictLoaded('weapons@first_person@aim_rng@generic@projectile@sticky_bomb@') do
            Citizen.Wait(100)
        end
        
        if lib.progressBar({
            duration = 2000,
            label = 'Attaching tint meter to the window',
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
            },
            anim = {
                dict = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@',
                clip = 'plant_vertical' 
            },
        }) then
            Citizen.Wait(2000)
            ExecuteCommand("do Device measuring window transparency")
            
            if lib.progressBar({
                duration = 10000,
                label = 'Measuring window transparency',
                useWhileDead = false,
                canCancel = true,
            }) then
                local tintLevel = GetVehicleWindowTint(vehicle)
                if tintLevel == -1 then
                    ExecuteCommand('do This vehicle has basic window tint')
                elseif tintLevel == 0 then
                    ExecuteCommand('do This vehicle has no window tint')
                elseif tintLevel == 1 then
                    ExecuteCommand('do This vehicle has window tint: Pure Black')
                elseif tintLevel == 2 then
                    ExecuteCommand('do This vehicle has window tint: Dark Smoke')
                elseif tintLevel == 3 then
                    ExecuteCommand('do This vehicle has window tint: Light Smoke')
                elseif tintLevel == 4 then
                    ExecuteCommand('do This vehicle has basic window tint')
                elseif tintLevel == 5 then
                    ExecuteCommand('do This vehicle has window tint: Limo')
                elseif tintLevel == 6 then
                    ExecuteCommand('do This vehicle has window tint: Green')
                end
            end
        end
    else 
        lib.notify({
            title = 'Tintmeter',
            description = 'You are far from the vehicle',
            type = 'error'
        })
    end
end)
