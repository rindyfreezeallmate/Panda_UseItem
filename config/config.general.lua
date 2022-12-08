Config = {}

local percent = 1                           -- If ur status has 1m (1,000,000) val, pls set 1 * 10000 = 1 percent in health bar

-- PANDA MAKE IT RIGHT --

Config.ItemUsability = {                    -- Manage ur Item's
    ["bread"] = {                           -- Item Name @ Database
        inzone = false,                     -- !!! NOT FINISH !!! pls stay tune
        trigger = 'esx_status:add',         -- TriggerEvent (Client Side)
        statadd = 'hunger',                 -- Hunger | Thirst | Custom ur status
        secondstat = false,                 -- true = use secondfunc | false = disable secondfunc
        secondfunc = {
            trigger1 = 'esx_status:remove', -- TriggerEvent (Client Side)
            statadd1 = 'stress',            -- Hunger | Thirst | Custom ur status
            val1 = 50 * percent,            -- Status Valable
        },
        progbar = "Porpy_progressbar:progress", -- Progressbar Function (mythic_progbar or etc. w/ TriggerEvent(Client Side))
        text = nil,                         -- text on progressbar | if nil = disable (base on progressbar script)
        prop = 'prop_cs_burger_01',         -- prop on hand
        delay = 5,                          -- progressbar timer's
        val = 10 * percent,                 -- Status Valable
        forzenfreezer = true,               -- freeze ped if use item
        adict = 'mp_player_inteat@burger',  -- Animation's Dictionary
        anim1 = 'mp_player_inteat@burger',  -- Animate's
        anim2 = 'mp_player_int_eat_burger', -- Animate's
    },
    ["water"] = {
        inzone = false,
        trigger = 'esx_status:add',
        statadd = 'thirst',
        secondstat = false,
        secondfunc = {
            trigger1 = 'esx_status:remove',
            statadd1 = 'stress',
            val1 = 50 * percent,
        },
        progbar = "Porpy_progressbar:progress",
        text = nil,
        prop = 'prop_cs_burger_01',
        delay = 5,
        val = 10 * percent,
        forzenfreezer = true,
        adict = 'mp_player_intdrink',
        anim1 = 'mp_player_intdrink',
        anim2 = 'intro_bottle',
    },
}
