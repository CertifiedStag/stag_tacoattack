local Config = lib.require('config')
local TacoattackFood = {
    ['nakedtaco'] = {
        event = 'stag_tacoattack:client:makeFood',
        remove = { {ing = 'tacoshell', amount = 1}, {ing = 'beans', amount = 1}, {ing = 'cheesesauce', amount = 1}, {ing = 'tacofilling', amount = 1}, }
    },
    ['cheesetaco'] = {
        event = 'stag_tacoattack:client:makeFood',
        remove = { {ing = 'tacoshell', amount = 1}, {ing = 'tacofilling', amount = 1}, {ing = 'cheesesauce', amount = 1}, {ing = 'veggiesmix', amount = 1}, }
    },
    ['grilledtaco'] = {
        event = 'stag_tacoattack:client:makeFood',
        remove = { {ing = 'tacoshell', amount = 1}, {ing = 'tacofilling', amount = 1}, }
    },
    ['classicburrito'] = {
        event = 'stag_tacoattack:client:makeFood',
        remove = { {ing = 'tortilla', amount = 1}, {ing = 'beans', amount = 1}, {ing = 'burritofilling', amount = 1}, {ing = 'veggiesmix', amount = 1}, }
    },
    ['cheesenachos'] = {
        event = 'stag_tacoattack:client:makeFood',
        remove = { {ing = 'nachospacket', amount = 1}, {ing = 'cheesesauce', amount = 1}, {ing = 'salsa', amount = 1}, }
    },
    ['tacoshell'] = {
        event = 'stag_tacoattack:client:prepStation',
        remove = { {ing = 'wheatflour', amount = 1}, {ing = 'water_bottle', amount = 1}, }
    },
      ['tortilla'] = {
        event = 'stag_tacoattack:client:prepStation',
        remove = { {ing = 'wheatflour', amount = 1}, {ing = 'water_bottle', amount = 1}, }
    },
    ['veggiesmix'] = {
        event = 'stag_tacoattack:client:prepStation',
        remove = { {ing = 'onion', amount = 1}, {ing = 'garlic', amount = 1}, {ing = 'tomato', amount = 1}, {ing = 'capsicum', amount = 1}, {ing = 'carrot', amount = 1},}
    },
    ['orangejuice'] = {
        event = 'stag_tacoattack:client:makeDrink',
        remove = { {ing = 'choppedorange', amount = 1},{ing = 'water_bottle', amount = 1}, {ing = 'sugarpacket', amount = 1}, }
    },
    ['applejuice'] = {
          event = 'stag_tacoattack:client:makeDrink',
          remove = { {ing = 'choppedapple', amount = 1},{ing = 'water_bottle', amount = 1}, {ing = 'sugarpacket', amount = 1}, }
      },
}

lib.callback.register('stag_tacoattack:server:handleFood', function(source, itemName)
    local src = source
    local Player = GetPlayer(src)

    local food = TacoattackFood[itemName]
    if not food or not isTacoAttack(Player) then return end

    local canMake = true
    for _, ingredient in pairs(food.remove) do
        if not itemCount(Player, ingredient.ing, ingredient.amount) then
            canMake = false
            break
        end
    end

    if not canMake then
        return DoNotification(src, 'You don\'t have all the required ingredients.', 'error')
    end

    for _, ingredient in pairs(food.remove) do
        RemoveItem(Player, ingredient.ing, ingredient.amount)
    end
    TriggerClientEvent(food.event, src)
    SetTimeout(Config.CookDuration, function() AddItem(Player, itemName, 1) end)
end)

lib.callback.register('stag_tacoattack:server:removeConsumable', function(source, item, slot)
    local src = source
    local Player = GetPlayer(src)
    RemoveItemFromSlot(Player, item, 1, slot)
end)

RegisterNetEvent("stag_tacoattack:server:billPlayer", function(playerId, amount)
    local src = source
    local Player = GetPlayer(src)
    local biller = Player
    local billed = GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'tacoattack' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                billed.Functions.RemoveMoney('bank', amount)
                DoNotification(src, 'You charged a customer.', 'success')
                DoNotification(billed.PlayerData.source, 'You have been charged £'..amount..' for your order at Taco Shop.')
                exports['qb-management']:AddMoney('tacoattack', value)
                else
                    DoNotification(src, 'Must be a valid amount above 0.', 'error')
                end
            else
                DoNotification(src, 'You cannot bill yourself.', 'error')
            end
        else
            DoNotification(src, 'Player not online', 'error')
        end
    end
end)