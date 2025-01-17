-----------------------------------
-- Jeuno Valeriano
-----------------------------------
-- In the case of a conquest tie for first place
-- Valeriano's Troupe will offer their services in Jeuno
-----------------------------------
require('modules/module_utils')

require('scripts/globals/shop')


require('scripts/globals/npc_util')
local customUtil = require('modules/custom/lua/custom_util')
-----------------------------------
local m = Module:new('jeuno_valeriano')

-- Default settings
local settings =
{
    ALWAYS         = false,            -- Spawn regardless of conquest
    ZONE           = 'RuLude_Gardens', -- Set this to any area
    VALERIANO      = { -21.534,  0.002, -55.108, 130 },
    NALTA          = { -23.046,  0.002, -47.096, 130 },
    CHEH_RAIHAH    = { -23.196,  0.002, -52.912, 130 },
    MOKOP_SANKOP   = { -21.713,  0.002, -44.268, 100 },
    DAHJAL         = { -21.956,  0.003, -50.032, 130 },
    NOKKHI_JINJAHL = { -38.638,  0.000, -38.251,  36 },
    OMINOUS_CLOUD  = { -63.109, 12.000, -20.550,   0 },
}

-- Override defaults from settings
if xi.settings and xi.settings.jeuno_valeriano then
    settings.ALWAYS         = xi.settings.jeuno_valeriano.ALWAYS
    settings.ZONE           = xi.settings.jeuno_valeriano.ZONE
    settings.VALERIANO      = xi.settings.jeuno_valeriano.VALERIANO
    settings.NALTA          = xi.settings.jeuno_valeriano.NALTA
    settings.CHEH_RAIHAH    = xi.settings.jeuno_valeriano.CHEH_RAIHAH
    settings.MOKOP_SANKOP   = xi.settings.jeuno_valeriano.MOKOP_SANKOP
    settings.DAHJAL         = xi.settings.jeuno_valeriano.DAHJAL
    settings.NOKKHI_JINJAHL = xi.settings.jeuno_valeriano.NOKKHI_JINJAHL
    settings.OMINOUS_CLOUD  = xi.settings.jeuno_valeriano.OMINOUS_CLOUD
end

local toolList =
{
    { xi.item.UCHITAKE,        xi.item.TOOLBAG_UCHITAKE        },
    { xi.item.TSURARA,         xi.item.TOOLBAG_TSURARA         },
    { xi.item.KAWAHORI_OGI,    xi.item.TOOLBAG_KAWAHORI_OGI    },
    { xi.item.MAKIBISHI,       xi.item.TOOLBAG_MAKIBISHI       },
    { xi.item.HIRAISHIN,       xi.item.TOOLBAG_HIRAISHIN       },
    { xi.item.MIZU_DEPPO,      xi.item.TOOLBAG_MIZU_DEPPO      },

    { xi.item.SHIHEI,          xi.item.TOOLBAG_SHIHEI          },

    { xi.item.JUSATSU,         xi.item.TOOLBAG_JUSATSU         },
    { xi.item.KAGINAWA,        xi.item.TOOLBAG_KAGINAWA        },
    { xi.item.SAIRUI_RAN,      xi.item.TOOLBAG_SAIRUI_RAN      },
    { xi.item.KODOKU,          xi.item.TOOLBAG_KODOKU          },

    { xi.item.SHINOBI_TABI,    xi.item.TOOLBAG_SHINOBI_TABI    },
    { xi.item.SANJAKU_TENUGUI, xi.item.TOOLBAG_SANJAKU_TENUGUI },
}

local ammoList =
{
    { xi.item.BEETLE_ARROW,    xi.item.BEETLE_QUIVER         },
    { xi.item.HORN_ARROW,      xi.item.HORN_QUIVER           },
    { xi.item.SCORPION_ARROW,  xi.item.SCORPION_QUIVER       },
    { xi.item.DEMON_ARROW,     xi.item.DEMON_QUIVER          },
    { xi.item.IRON_ARROW,      xi.item.IRON_QUIVER           },
    { xi.item.SILVER_ARROW,    xi.item.SILVER_QUIVER         },
    { xi.item.KABURA_ARROW,    xi.item.KABURA_QUIVER         },
    { xi.item.SLEEP_ARROW,     xi.item.SLEEP_QUIVER          },

    { xi.item.BLIND_BOLT,      xi.item.BLIND_BOLT_QUIVER     },
    { xi.item.ACID_BOLT,       xi.item.ACID_BOLT_QUIVER      },
    { xi.item.HOLY_BOLT,       xi.item.HOLY_BOLT_QUIVER      },
    { xi.item.SLEEP_BOLT,      xi.item.SLEEP_BOLT_QUIVER     },
    { xi.item.VENOM_BOLT,      xi.item.VENOM_BOLT_QUIVER     },
    { xi.item.BLOODY_BOLT,     xi.item.BLOODY_BOLY_QUIVER    },
    { xi.item.MYTHRIL_BOLT,    xi.item.MYTHRIL_BOLT_QUIVER   },
    { xi.item.DARKSTEEL_BOLT,  xi.item.DARKSTEEL_BOLT_QUIVER },

    {  xi.item.BULLET,         xi.item.BULLET_POUCH          },
    {  xi.item.BRONZE_BULLET,  xi.item.BRONZE_BULLET_POUCH   },
    {  xi.item.IRON_BULLET,    xi.item.IRON_BULLET_POUCH     },
    {  xi.item.SILVER_BULLET,  xi.item.SILVER_BULLET_POUCH   },
    {  xi.item.STEEL_BULLET,   xi.item.STEEL_BULLET_POUCH    },
    {  xi.item.SPARTAN_BULLET, xi.item.SPARTAN_BULLET_POUCH  },

    { xi.item.FIRE_CARD,       xi.item.FIRE_CARD_CASE        },
    { xi.item.ICE_CARD,        xi.item.ICE_CARD_CASE         },
    { xi.item.WIND_CARD,       xi.item.WIND_CARD_CASE        },
    { xi.item.EARTH_CARD,      xi.item.EARTH_CARD_CASE       },
    { xi.item.THUNDER_CARD,    xi.item.THUNDER_CARD_CASE     },
    { xi.item.WATER_CARD,      xi.item.WATER_CARD_CASE       },
    { xi.item.LIGHT_CARD,      xi.item.LIGHT_CARD_CASE       },
    { xi.item.DARK_CARD,       xi.item.DARK_CARD_CASE        },
}

local valerianoShop = function(player, npc)
    local stock =
    {
        xi.item.GINGER_COOKIE,                  10,
        xi.item.FLUTE,                          43,
        xi.item.PICCOLO,                       990,
        xi.item.SCROLL_OF_SCOPS_OPERETTA,      585,
        xi.item.SCROLL_OF_PUPPETS_OPERETTA,  16920,
        xi.item.SCROLL_OF_FOWL_AUBADE,        2916,
        xi.item.SCROLL_OF_ADVANCING_MARCH,    2059,
        xi.item.SCROLL_OF_GODDESS_HYMNUS,    90000,
    }

    xi.shop.general(player, stock, xi.quest.fame_area.JEUNO)
end

local bundleTrade = function(player, npc, trade, tblNPC)
    local itemsNeeded = 0
    local itemsGiven  = {}

    for i = 0, 8, 1 do
        local itemId = trade:getItemId(i)
        if itemId > 0 and itemId ~= tblNPC.tradeItem then
            local validSlot = false
            for k, v in pairs(tblNPC.tradeList) do
                if v[1] == itemId then
                    local itemQty = trade:getSlotQty(i)
                    if itemQty % 99 ~= 0 then
                        customUtil.dialogTable(player, tblNPC.message.COUNT, tblNPC.name)
                        return
                    end

                    local stacks = itemQty / 99
                    itemsNeeded = itemsNeeded + stacks
                    itemsGiven[#itemsGiven + 1] = { v[2], stacks }
                    validSlot = true
                    break
                end
            end

            if not validSlot then
                customUtil.dialogTable(player, tblNPC.message.WRONG, tblNPC.name)
                return
            end
        end
    end

    -- check for correct number of tradeItems
    if itemsNeeded == 0 or trade:getItemQty(tblNPC.tradeItem) ~= itemsNeeded then
        customUtil.dialogTable(player, tblNPC.message.COUNT, tblNPC.name)
        return
    end

    if npcUtil.giveItem(player, itemsGiven, { fromTrade = true }) then
        customUtil.dialogTable(player, tblNPC.message.SUCCESS, tblNPC.name)
        player:tradeComplete()
    end
end

local basicDialog = function(player, npc, tblNPC)
    npc:lookAt(player:getPos())
    npc:timer(2000, function(npcArg)
        npcArg:setRotation(tblNPC.pos[4])
    end)

    if tblNPC.dialog then
        customUtil.dialogTable(player, tblNPC.dialog, tblNPC.name)
    end
end

local troupe =
{
    VALERIANO =
    {
        name = 'Valeriano',
        pos = settings.VALERIANO,
        look = '0x01000D0100100820193018401950006000700000',
        animation = 0,
        animationSub = 1,
        dialog =
        {
            'Halfling philosophers and heroine beauties, welcome to the ' ..
            'Troupe Valeriano show! And how gorgeous and green this fair town is!'
        },

        onTrigger = function(player, npc, tblNPC)
            basicDialog(player, npc, tblNPC)
            valerianoShop(player)
        end,
    },

    NALTA =
    {
        name = 'Nalta',
        pos = settings.NALTA,
        look = '0x0000CD0000000000000000000000000000000000',
        animation = 0,
        animationSub = 3,
        dialog =
        {
            'I believe...it is the blood of knights...' ..
            'running in Elvaan veins...that gives them victory...'
        },
    },

    CHEH_RAIHAH =
    {
        name = 'Cheh Raihah',
        pos = settings.CHEH_RAIHAH,
        look = '0x0000DC0000000000000000000000000000000000',
        animation = 0,
        animationSub = 3,
        dialog =
        {
            'Want to see my new knife trrrick? But keep your distance, ' ..
            'if you value your ears and moustaches as they arrre!'
        },
    },

    MOKOP_SANKOP =
    {
        name = 'Mokop-Sankop',
        pos = settings.MOKOP_SANKOP,
        look = '0x0000470300000000000000000000000000000000',
        animation = 0,
        animationSub = 1,
        dialog =
        {
            'I\'m not too fond of the folksy-wolksy in these parts. All the important' ..
            ' with their noses in the air and their tails a-waving, but cheap as can be.' ..
            ' You folk from other countries need to get cracking!'
        },
    },

    DAHJAL =
    {
        name = 'Dahjal',
        pos = settings.DAHJAL,
        look = '0x0000D80000000000000000000000000000000000',
        animation = 0,
        animationSub = 3,
        dialog =
        {
            '......'
        },
    },

    NOKKHI_JINJAHL =
    {
        name         = 'Nokkhi Jinjahl',
        pos          = settings.NOKKHI_JINJAHL,
        look         = '0x0100000700100020003000400050006000700000',
        animation    = 47,
        animationSub = 0,
        tradeItem    = xi.item.CARNATION,
        tradeList    = ammoList,
        onTrade      = bundleTrade,

        dialog =
        {
            'People call me \'Nokky the Tree-shaker\'! While the other guys ' ..
            'are doing their thing, I work on the sidelines as a quiver-maker.',
            ' Basically, I can make it easier for you to lug around those bundles ' ..
            'of ninety-nine arrows or bolts or whatever.',
            'I\'ve been doing this for a while now, so I\'ve learned to bundle all ' ..
            'sorts of stuff...',
            'This ain\'t no charity, though. I\'m not really interested in gil, but...',
            ' Let\'s see here... Flowers...? Yeah, you can bring me a carnation for ',
            ' every ninety-nine arrows, bolts, or whatever you want organized ' ..
            'and we got a deal.',
            'I can make a quiver or pouch for up to seven sets of the same kind ' ..
            'of ammunition.',
            'So you could bring me, say, one hundred ninety-eight ' ..
            'silver arrows and two of those carnations for example.',
            ' I like to do things real efficient-like, you see, so make sure they\'re ' ..
            'in multiplies of ninety-nine.',
        },

        message =
        {
            COUNT =
            {
                'What kind of smart-alecky baloney is this!? I told you ' ..
                'to bring me the same kinda ammunition in complete sets. ',
                ' And don\'t forget the flowers, neither.',
            },
            WRONG =
            {
                'I\'m real sorry, but there\'s nothing I can do with those.',
            },

            SUCCESS =
            {
                'And here you go! Come back soon, and bring your friends!',
            },
        },
    },

    OMINOUS_CLOUD =
    {
        name         = 'Ominous Cloud',
        pos          = settings.OMINOUS_CLOUD,
        look         = '0x0000920000000000000000000000000000000000',
        animation    = 0,
        animationSub = 2,
        tradeItem    = xi.item.WIJNRUIT,
        tradeList    = toolList,
        onTrade      = bundleTrade,

        dialog =
        {
            '...',
            '...Outta my face.',
            'I told you to scram! Or would you like a piece of me, huh?',
            ' If I didn\'t have to waste time bundlin\' together ninja tools ' ..
            'for adventurers like you,',
            ' I\'d fill your ugly mug with bloody bolts faster than you could ' ..
            'say Galkan sausage.',
            'Eh? You\'re here to get your ninja tools bundled?',
            ' Curse Altana! And people ask me why I hate this stinkin\' job!',
            'Well, don\'t just stand there like an idiot! I can\'t do any ' ..
            'bundlin\' until you fork over a set of 99 tools and a wijnruit!',
            ' And I ain\'t doin\' more than seven sets at one time, so ' ..
            'don\'t even try it!',
        },

        message =
        {
            COUNT =
            {
                'Well, don\'t just stand there like an idiot! I can\'t do any ' ..
                'bundlin\' until you fork over a set of 99 tools and a wijnruit!',
                ' And I ain\'t doin\' more than seven sets at one time, so ' ..
                'don\'t even try it!'
            },

            WRONG =
            {
               'What the hell is this junk!? Why don\'t you try bringin\' what ' ..
               'I asked for before I shove one of my sandals up your...nose!',
            },

            SUCCESS =
            {
                'Here, take \'em and scram.',
                ' And don\'t say I ain\'t never did nothin\' for you!',
            },
        }
    },
}

local insertNPC = function(zone, v)
    local tblNPC = v
    local tbl = {
        objtype   = xi.objType.NPC,
        name      = v.name,
        look      = v.look,
        x         = v.pos[1],
        y         = v.pos[2],
        z         = v.pos[3],
        rotation  = v.pos[4],
        widescan  = 0,
        onTrigger = function(player, npc)
            basicDialog(player, npc, tblNPC)
        end,
    }

    if v.onTrigger then
        tbl.onTrigger = function(player, npc)
            v.onTrigger(player, npc, tblNPC)
        end
    end

    if v.onTrade then
        tbl.onTrade = function(player, npc, trade)
            v.onTrade(player, npc, trade, tblNPC)
        end
    end

    local npc = zone:insertDynamicEntity(tbl)

    npc:setAnimation(v.animation)
    npc:setAnimationSub(v.animationSub)

    return npc
end

local spawnTroupe = function(zone)
    for k, v in pairs(troupe) do
        -- If entity already exists, just make it visible
        if v.npc then
            v.npc:setStatus(xi.status.NORMAL)
        else
            troupe[k].npc = insertNPC(zone, v)
        end
    end
end

local despawnTroupe = function(zone)
    for _, v in pairs(troupe) do
        if v.npc then
            v.npc:setStatus(xi.status.INVISIBLE)
        end
    end
end

local checkConquest = function(zone)
    local rank =
    {
        GetNationRank(xi.nation.SANDORIA),
        GetNationRank(xi.nation.BASTOK),
        GetNationRank(xi.nation.WINDURST),
    }

    local first = 0

    for i = 1, #rank do
        if rank[i] == 1 then
            first = first + 1
        end
    end

    if first > 1 then
        print('Conquest tied, Valeriano\'s Troupe is spawning in Jeuno.')
        spawnTroupe(zone)
    else
        print('Conquest not tied, Valeriano\'s Troupe is despawned from Jeuno.')
        despawnTroupe(zone)
    end
end

m:addOverride(string.format('xi.zones.%s.Zone.onInitialize', settings.ZONE), function(zone)
    super(zone)

    if settings.ALWAYS then
        spawnTroupe(zone)
    else
        checkConquest(zone)
    end
end)

m:addOverride(string.format('xi.zones.%s.Zone.onConquestUpdate', settings.ZONE), function(zone, updateType)
    super(zone, updateType)

    -- Conquest end
    if updateType == 1 then
        checkConquest(zone)
    end
end)

return m
