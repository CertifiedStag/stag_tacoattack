return {
    CookDuration = 10000,
    BlipCoords = vec3(15.36, -1602.15, 29.38),
    HungerFill = { -- How much they fill your hunger
        ['nakedtaco'] = {emote = 'taco', amt = math.random(48, 54)},
        ['cheesetaco'] = {emote = 'taco', amt = math.random(48, 54)},
        ['grilledtaco'] = {emote = 'taco', amt = math.random(48, 54)},
        ['classicburrito'] = {emote = 'taco', amt = math.random(48, 54)},
        ['cheesenachos'] = {emote = 'nachos', amt = math.random(48, 54)},
    },
    ThirstFill = { -- How much they fill your thirst.
        ['orangejuice'] = {emote = 'tadrink', amt = math.random(48, 54)},
        ['applejuice'] = {emote = 'tadrink', amt = math.random(48, 54)},
    },
    Zones = {
        { coords = vec3(15.04, -1600.67, 30.5), radius = 1.0, icon = 'far fa-clipboard', event = 'cs_tacoattack:client:frontTray', label = 'Food Tray', type = 'stash', stashLabel = 'TA_Front_Tray_1', slots = 10, weight = 75000}, 
        { coords = vec3(13.22, -1601.45, 29.38), radius = 0.9, icon = 'fa-solid fa-beer-mug-empty', event = 'cs_tacoattack:client:drinkStation', label = 'Make Drinks', job = 'tacoattack' }, 
        { coords = vec3(12.46, -1597.98, 29.38), radius = 0.9, icon = 'fa-solid fa-burger', event = 'cs_tacoattack:client:makeFood', label = 'Make Food', job = 'tacoattack' }, 
        { coords = vec3(9.97, -1600.93, 29.37), radius = 0.7, icon = 'fa-solid fa-fire-burner', event = 'cs_tacoattack:client:prepStation', label = 'Get Messy', job = 'tacoattack' },
        { coords = vec3(21.99, -1602.69, 29.38), radius = 0.7, icon = 'fa-solid fa-box-open', event = 'cs_tacoattack:client:ingredientStore', label = 'Ingredients', job = 'tacoattack', type = 'shop' },
        { coords = vec3(15.39, -1595.65, 29.28), radius = 2.0, icon = 'far fa-clipboard', event = 'cs_tacoattack:client:passThrough', label = 'Big Tray', job = 'tacoattack', type = 'stash', stashLabel = 'TA_Big_Tray', slots = 20, weight = 150000 },
        { coords = vec3(8.88, -1602.42, 29.37), radius = 1.0, icon = 'far fa-clipboard', event = 'cs_tacoattack:client:frontTray2', label = 'Fridge', type = 'stash', stashLabel = 'TA_Fridge', slots = 10, weight = 75000},
        { coords = vec3(13.92, -1600.66, 29.38), radius = 0.9, icon = 'fa-brands fa-cc-visa', event = 'cs_tacoattack:client:useRegister', label = 'Bill Player', job = 'tacoattack' },
        { coords = vec3(13.92, -1600.66, 29.38), radius = 0.9, icon = 'fas fa-sign-in-alt', event = 'cs_tacoattack:ToggleDuty', label = 'Duty Toggle', job = 'tacoattack' },

    },
    Items = { -- qb-inventory
    label = 'Shop',
        slots = 7,
        items = {
            [1] = { name = 'tacofilling', price = 0, amount = 500, info = {}, type = 'item', slot = 1, },
            [2] = { name = 'salsa', price = 0, amount = 500, info = {}, type = 'item', slot = 2, },
            [3] = { name = 'beans', price = 0, amount = 500, info = {}, type = 'item', slot = 3, },
            [4] = { name = 'burritofilling', price = 0, amount = 500, info = {}, type = 'item', slot = 4, },
            [5] = { name = 'wheatflour', price = 0, amount = 500, info = {}, type = 'item', slot = 5, },
            [6] = { name = 'water_bottle', price = 0, amount = 500, info = {}, type = 'item', slot = 6, },
            [7] = { name = 'sugarpacket', price = 0, amount = 500, info = {}, type = 'item', slot = 7, },
            [8] = { name = 'cheesesauce', price = 0, amount = 500, info = {}, type = 'item', slot = 8, },
            [9] = { name = 'nachopacket', price ='0', amount= 500, info = {}, type = 'item', slot = 9, },
        }
    },
    Emotes = {
        taco = {prop = `prop_taco_01`, bone = 18905, anim = 'mp_player_int_eat_burger', dict = 'mp_player_inteat@burger', coords = vec3(0.130000, 0.050000, 0.020000), rot = vec3(-50.000000, 16.000000, 60.000000)},
        bbqf = {prop = `v_ind_cfknife`, bone = 28422, anim = 'idle_b', dict = 'amb@prop_human_bbq@male@idle_a', coords = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0)},
        nachos = {prop = `prop_food_bs_chips`, bone = 18905, anim = 'mp_player_int_eat_burger_fp', dict = 'mp_player_inteat@burger', coords = vec3(0.090000, -0.060000, 0.050000), rot = vec3(300.000000, 150.000000, 0.000000)},
        tadrink = {prop = `prop_cs_paper_cup`, bone = 28422, anim = 'idle_c', dict = 'amb@world_human_drinking@coffee@male@idle_a', coords = vec3(0.02, 0.0, -0.10), rot = vec3(0.0, 0.0, -0.50)},
        drinks = {prop = `prop_cs_paper_cup`, bone = 28422, anim = 'idle_a', dict = 'amb@prop_human_bbq@male@idle_a', coords = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0)},
    }
}