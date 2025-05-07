fx_version 'cerulean'
game 'gta5'
author 'pScripts'
description 'Crates [discord.gg/piotreqscripts]'
lua54 'yes'

files {
    'locales/*.json'
}

client_scripts {
    'client/target.lua',
    'client/utils.lua',
    'client/main.lua',
    'bridge/client/*.lua'
}

server_scripts {
    'server/*.lua',
    'bridge/server/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'config.lua'
}

escrow_ignore {
    'config.lua',
    'bridge/client/esx.lua',
    'bridge/client/qb.lua',
    'bridge/server/esx.lua',
    'bridge/server/qb.lua',
    'client/target.lua'
}
dependency '/assetpacks'