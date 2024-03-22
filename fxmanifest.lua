fx_version 'cerulean'
game 'gta5'

author 'Main Body by Randolio Edits by CertifiedStag'
description 'Taco Attack Job'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'bridge/client/**.lua',
    'cl_tacoattack.lua',
}

server_scripts {
    'bridge/server/**.lua',
    'sv_tacoattack.lua',
}

lua54 'yes'