local tacoZones = {}
local Config = lib.require('config')
local ox_inv = GetResourceState('ox_inventory') == 'started'
local emoteProp

local ta_blip = AddBlipForCoord(Config.BlipCoords)
SetBlipSprite(ta_blip, 79)
SetBlipDisplay(ta_blip, 4)
SetBlipScale(ta_blip, 0.5)
SetBlipAsShortRange(ta_blip, true)
SetBlipColour(ta_blip, 69)
BeginTextCommandSetBlipName('STRING')
AddTextComponentSubstringPlayerName('Taco Attack')
EndTextCommandSetBlipName(ta_blip)

local function toggleEmotes(bool, emote)
    if bool then
        local doEmote = Config.Emotes[emote]
        lib.requestAnimDict(doEmote.dict, 2000)
        lib.requestModel(doEmote.prop, 2000)
        if doEmote.prop then
            emoteProp = CreateObject(doEmote.prop, 0.0, 0.0, 0.0, true, true, false)
            AttachEntityToEntity(emoteProp, cache.ped, GetPedBoneIndex(cache.ped, doEmote.bone), doEmote.coords.x, doEmote.coords.y, doEmote.coords.z, doEmote.rot.x, doEmote.rot.y, doEmote.rot.z, true, true, false, true, 1, true)
        end
        TaskPlayAnim(cache.ped, doEmote.dict, doEmote.anim, 8.0, 8.0, -1, 49, 0, 0, 0, 0)
        SetModelAsNoLongerNeeded(doEmote.prop)
    else
        ClearPedTasks(cache.ped)
        if emoteProp and DoesEntityExist(emoteProp) then 
            DetachEntity(emoteProp, true, false) 
            DeleteEntity(emoteProp)
            emoteProp = nil
        end
    end
end

function createJobZones()
    for k, v in pairs(Config.Zones) do
        exports['qb-target']:AddCircleZone('tacoAttackZone'..k, v.coords, v.radius,{ 
            name= 'tacoAttackZone'..k, 
            debugPoly = false, 
            useZ=true, 
        }, {
            options = {
                { event = v.event, icon = v.icon, label = v.label, job = v.job, },
            },
            distance = 1.5
        })
        tacoZones[#tacoZones+1] = 'taxoAttackZone'..k
    end
end

function removeJobZones()
    for i = 1, #tacoZones do
        exports['qb-target']:RemoveZone(tacoZones[i])
    end
    table.wipe(tacoZones)
end
    
AddEventHandler('cs_tacoattack:client:frontTray', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'TA_Front_Tray_1'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'TA_Front_Tray_1')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'TA_Front_Tray_1', {
            maxweight = 75000,
            slots = 10,
        })
    end
end)

AddEventHandler('cs_tacoattack:client:frontTray2', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'TA_Fridge'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'TA_Fridge')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'TA_Fridge', {
            maxweight = 750000,
            slots = 20,
        })
    end
end)

AddEventHandler('cs_tacoattack:client:passThrough', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'TA_Big_Tray'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'TA_Big_Tray')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'TA_Big_Tray', {
            maxweight = 150000,
            slots = 10,
        })
    end
end)

AddEventHandler('cs_tacoattack:client:ingredientStore', function()
    if ox_inv then
        exports.ox_inventory:openInventory('shop', { id = 1, type = 'Ingredients - TacoAttack'})
    else
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'tacoattack', Config.Items)
    end
end)

RegisterNetEvent('cs_tacoattack:client:Eat', function(itemName, itemSlot, emote)
    if GetInvokingResource() then return end
    toggleEmotes(true, emote)
    if lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        label = 'Munching..',
        useWhileDead = true,
        canCancel = true,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        handleStatus('hunger', itemName)
        lib.callback.await('cs_tacoattack:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('cs_tacoattack:client:Drink', function(itemName, itemSlot, emote)
    if GetInvokingResource() then return end
    toggleEmotes(true, emote)
    if lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        label = 'Drinking..',
        useWhileDead = true,
        canCancel = true,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        handleStatus('thirst', itemName)
        lib.callback.await('cs_tacoattack:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('cs_tacoattack:client:makeFood', function()
    if GetInvokingResource() then return end
    toggleEmotes(true, 'bbqf')
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making food..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = true, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        TriggerEvent('cs_tacoattack:client:makeFood')
    end
end)

RegisterNetEvent('cs_tacoattack:client:prepStation', function()
    if GetInvokingResource() then return end
    toggleEmotes(true, 'bbqf')
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Combining Ingredients..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = true, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        TriggerEvent('cs_tacoattack:client:prepStation')
    end
end)

RegisterNetEvent('cs_tacoattack:client:makeDrink', function()
    if GetInvokingResource() then return end
    toggleEmotes(true, 'drinks')
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making Drinks..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = true, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        TriggerEvent('cs_tacoattack:client:drinkStation')
    end
end)

AddEventHandler('cs_tacoattack:client:makeFood', function()
    local tacoAttack = 'ta_info'
    local taMenu = {
        id = tacoAttack,
        title = 'Prep Station',
        options = {
            {
                title = 'Naked Taco',
                description = 'Requires: 1x Shell | 1x Beans | 1x Taco Filling | 1x Cheese Sauce',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('cs_tacoattack:server:handleFood', false, 'nakedtaco')
                end,
            },
            {
                title = 'Cheese Taco',
                description = 'Requires: 1x Taco Shell | 1x Taco Filling | 1x Cheese Sauce | 1x Veggie Mix',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('randol_burgershot:server:handleFood', false, 'cheesetaco')
                end,
            },
            {
                title = 'Grilled Taco',
                description = 'Requires: 1x Taco Shell | 1x Taco Filling',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('cs_tacoattack:server:handleFood', false, 'grilledtaco')
                end,
            },
            {
                title = 'Classic Burrito',
                description = 'Requires: 1x Tortilla | 1x Burrito Filling | 1x Beans | 1x Veggie Mix',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('cs_tacoattack:server:handleFood', false, 'classicburrito')
                end,
            },
            {
                title = 'Cheese Nachos',
                description = 'Requires: 1x Nacho Packet | 1x Cheese Sauce | 1x Salsa',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('cs_tacoattack:server:handleFood', false, 'cheesenachos')
                end,
            },
        }
    }
    lib.registerContext(taMenu)
    lib.showContext(tacoAttack)
end)

AddEventHandler('cs_tacoattack:client:drinkStation', function()
    local tacoAttack = 'ta_info'
    local taMenu = {
        id = tacoAttack,
        title = 'Drink Station',
        options = {
            {
                title = 'Orange Juice',
                description = 'Requires: 1x Chopped Orange | 1x Water Bottle | 1x Sugar Packet',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('cs_tacoattack:server:handleFood', false, 'orangejuice')
                end,
            },
            {
                title = 'Apple Juice',
                description = 'Requires: 1x Chopped Apples | 1x Water Bottle | 1x Sugar Packet',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('cs_tacoattack:server:handleFood', false, 'applejuice')
                end,
            },
        }
    }
    lib.registerContext(taMenu)
    lib.showContext(tacoAttack)
end)

AddEventHandler('cs_tacoattack:client:prepStation', function()
    local tacoAttack = 'ta_info'
    local taMenu = {
        id = tacoAttack,
        title = 'Flour Station',
        options = {
            {
                title = 'Shell',
                description = 'Requires: 1x Wheat Flour | 1x Water Bottle',
                icon = 'fa-solid fa-fire-burner',
                onSelect = function()
                    lib.callback.await('cs_tacoattack:server:handleFood', false, 'tacoshell')
                end,
            },
          {
                title = 'Tortilla',
                description = 'Requires: 1x Wheat Flour | 1x Water Bottle',
                icon = 'fa-solid fa-fire-burner',
                onSelect = function()
                    lib.callback.await('cs_tacoattack:server:handleFood', false, 'tortilla')
                end,
            },
            {
                title = 'Veggie Mix',
                description = 'Requires: 1x Tomato | 1x Onion | 1x Garlic | 1x Carrot | 1x Capsicum',
                icon = 'fa-solid fa-fire-burner',
                onSelect = function()
                    lib.callback.await('cs_tacoattack:server:handleFood', false, 'veggiesmix')
                end,
            },
        }
    }
    lib.registerContext(taMenu)
    lib.showContext(tacoAttack)
end)

AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        removeJobZones()
    end 
end)

RegisterNetEvent("cs_tacoattack:client:useRegister", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Cash Register",
		submitText = "Charge",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", 
                type = "text", 
                isRequired = true
            },
            {
                text = "   Bill Price (£)",
                name = "billprice", 
                type = "number",
                isRequired = false
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("cs_tacoattack:server:billPlayer", bill.citizenid, bill.billprice)
    end
end)