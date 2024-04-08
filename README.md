# Taco Attack Job
A standalone Taco Job utilising ox_lib. Locations and ingredients are configurable through config.lua.

# Dependencies
- ox_lib
- qb-menu

# Extras and Info
Add to items.lua:
``` -- Taco Job
    orange 			         = {name = 'orange', 			 	    label = 'Orange', 		        weight = 0, 		type = 'item', 		image = 'orange.png', 	        unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
    apple 			         = {name = 'apple', 			 	    label = 'Apple', 		        weight = 0, 		type = 'item', 		image = 'apple.png', 	        unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	tomato 			         = {name = 'tomato', 			 	    label = 'Tomato', 		        weight = 0, 		type = 'item', 		image = 'tomato.png', 	        unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
    onion 			         = {name = 'onion', 			 	    label = 'Onion', 		        weight = 0, 		type = 'item', 		image = 'onion.png', 	        unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
    garlic 			         = {name = 'garlic', 			 	    label = 'Garlic', 		        weight = 0, 		type = 'item', 		image = 'garlic.png', 	        unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
    carrot 			         = {name = 'carrot', 			 	    label = 'Carrot', 		        weight = 0, 		type = 'item', 		image = 'carrot.png', 	        unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
    capsicum 			     = {name = 'capsicum', 			 	    label = 'Capsicum', 		    weight = 0, 		type = 'item', 		image = 'capsicum.png', 	    unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
    choppedtomato 			 = {name = 'choppedtomato', 			label = 'Chopped Tomato', 		weight = 0, 		type = 'item', 		image = 'choppedtomato.png', 	unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	choppedonion 			 = {name = 'choppedonion', 			 	label = 'Chopped Onion', 		weight = 0, 		type = 'item', 		image = 'choppedonion.png', 	unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	choppedgarlic 			 = {name = 'choppedgarlic', 			label = 'Chopped Garlic', 		weight = 0, 		type = 'item', 		image = 'choppedgarlic.png', 	unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	choppedcarrot 			 = {name = 'choppedcarrot', 			label = 'Chopped Carrot', 		weight = 0, 		type = 'item', 		image = 'choppedcarrot.png', 	unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	choppedcapsicum 	     = {name = 'choppedcapsicum', 			label = 'Chopped Capsicum', 	weight = 0, 		type = 'item', 		image = 'choppedcapsicum.png', 	unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	choppedapple 			 = {name = 'choppedapple', 			 	label = 'Chopped Apple', 		weight = 0, 		type = 'item', 		image = 'choppedapple.png', 	unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	choppedorange 			 = {name = 'choppedorange', 			label = 'Chopped Orange', 		weight = 0, 		type = 'item', 		image = 'choppedorange.png', 	unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	beans 				 	 = {name = 'beans', 			  	  	label = 'Beans', 				weight = 0, 		type = 'item', 		image = 'beans.png', 			unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	wheatflour 				 = {name = 'wheatflour', 			  	label = 'Wheat Flour', 			weight = 0, 		type = 'item', 		image = 'wheatflour.png', 		unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	nachospacket 			 = {name = 'nachospacket', 			  	label = 'Nachos Packet', 		weight = 0, 		type = 'item', 		image = 'nachospacket.png', 	unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	sugarpacket 			 = {name = 'sugarpacket', 			  	label = 'Sugar Packet', 		weight = 0, 		type = 'item', 		image = 'sugarpacket.png', 		unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	veggiesmix 				 = {name = 'veggiesmix', 			  	label = 'Veggies Mix', 			weight = 0, 		type = 'item', 		image = 'veggiesmix.png', 		unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	tacofilling 			 = {name = 'tacofilling', 			  	label = 'Taco Filling', 		weight = 0, 		type = 'item', 		image = 'tacofilling.png', 		unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	tacoshell 				 = {name = 'tacoshell', 			  	label = 'Taco Shell', 			weight = 0, 		type = 'item', 		image = 'tacoshell.png', 		unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	burritofilling 			 = {name = 'burritofilling', 			label = 'Burrito Flling', 		weight = 0, 		type = 'item', 		image = 'burritofilling.png', 	unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	tortilla 				 = {name = 'tortilla', 			  		label = 'Tortilla', 			weight = 0, 		type = 'item', 		image = 'tortilla.png', 		unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	cheesesauce 			 = {name = 'cheesesauce', 			  	label = 'Cheese Sauce', 		weight = 0, 		type = 'item', 		image = 'cheesesauce.png', 		unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	salsa 			 		 = {name = 'salsa', 			  		label = 'Salsa', 				weight = 0, 		type = 'item', 		image = 'salsa.png', 			unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	cheesetaco 				 = {name = 'cheesetaco', 			  	label = 'Cheese Taco', 			weight = 0, 		type = 'item', 		image = 'cheesetaco.png', 		unique = false, 	useable = true, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	nakedtaco 				 = {name = 'nakedtaco', 			  	label = 'Naked Taco', 			weight = 0, 		type = 'item', 		image = 'nakedtaco.png', 		unique = false, 	useable = true, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	grilledtaco 			 = {name = 'grilledtaco', 				label = 'Grilled Taco', 		weight = 0, 		type = 'item', 		image = 'grilledtaco.png', 		unique = false, 	useable = true, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	classicburrito 			 = {name = 'classicburrito', 			label = 'Classic Burrito', 		weight = 0, 		type = 'item', 		image = 'classicburrito.png', 	unique = false, 	useable = true, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	cheesenachos 			 = {name = 'cheesenachos', 			  	label = 'Cheese Nachos', 		weight = 0, 		type = 'item', 		image = 'cheesenachos.png', 	unique = false, 	useable = true, 	shouldClose = false,	   combinable = nil,   description = 'Something to Eat!'},
	applejuice 				 = {name = 'applejuice', 			  	label = 'Apple Juice', 			weight = 0, 		type = 'item', 		image = 'applejuice.png', 		unique = false, 	useable = true, 	shouldClose = false,	   combinable = nil,   description = 'Something to Drink!'},
	orangejuice 			 = {name = 'orangejuice', 			  	label = 'Orange Juice', 		weight = 0, 		type = 'item', 		image = 'orangejuice.png', 		unique = false, 	useable = true, 	shouldClose = false,	   combinable = nil,   description = 'Something to Drink!'},```

If using seperate multijob remove from cl_tacoattack:
```
RegisterNetEvent('stag_tacoattack:ToggleDuty', function()
    TriggerServerEvent('QBCore:ToggleDuty')
end)```
