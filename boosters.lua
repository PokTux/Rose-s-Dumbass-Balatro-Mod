SMODS.Booster {
    key = 'dumbass_pack',
    loc_txt = {
        name = "Dumbass Pack",
        text = {
            [1] = 'Choose {C:attention}1{} of {C:attention}2{} of Rose\'s Dumbass Joker Cards.',
            [2] = '{C:white}.{}',
            [3] = '{C:inactive}Art by Kierkat10 as {}',
            [4] = '{C:inactive}part of JokerForge placeholders{}'
        },
        group_name = "rosemod2_boosters"
    },
    config = { extra = 2, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    group_key = "rosemod2_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "rosemod2_rosemod2_jokers",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "rosemod2_dumbass_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'dumberass_pack',
    loc_txt = {
        name = "Dumberass Pack",
        text = {
            [1] = 'Choose {C:attention}1{} of {C:attention}4{} of Rose\'s Dumbass Joker Cards.',
            [2] = '{C:white}.{}',
            [3] = '{C:inactive}Art by Kierkat10 as {}',
            [4] = '{C:inactive}part of JokerForge placeholders{}'
        },
        group_name = "rosemod2_boosters"
    },
    config = { extra = 4, choose = 1 },
    cost = 6,
    weight = 0.75,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    group_key = "rosemod2_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "rosemod2_rosemod2_jokers",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "rosemod2_dumberass_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'dumbestass_pack',
    loc_txt = {
        name = "Dumbestass Pack",
        text = {
            [1] = 'Choose {C:attention}2{} of {C:attention}6{} of Rose\'s Dumbass Joker Cards.',
            [2] = '{C:white}.{}',
            [3] = '{C:inactive}Art by Kierkat10 as {}',
            [4] = '{C:inactive}part of JokerForge placeholders{}'
        },
        group_name = "rosemod2_boosters"
    },
    config = { extra = 6, choose = 2 },
    cost = 9,
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    group_key = "rosemod2_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "rosemod2_rosemod2_jokers",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "rosemod2_dumbestass_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'annoying_pack',
    loc_txt = {
        name = "Annoying Pack",
        text = {
            [1] = 'Choose {C:attention}1 {}of {C:attention}2{} Jokers that',
            [2] = 'reference media related to',
            [3] = 'an {C:attention}Certain Vexing Canine{}',
            [4] = '{C:white}.{}',
            [5] = '{C:inactive}Art by Kierkat10 as {}',
            [6] = '{C:inactive}part of JokerForge placeholders{}'
        },
        group_name = "rosemod2_boosters"
    },
    config = { extra = 2, choose = 1 },
    weight = 0.75,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    group_key = "rosemod2_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "rosemod2_rosemod2_toby",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "rosemod2_annoying_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'shipyard_pack',
    loc_txt = {
        name = "Shipyard Pack",
        text = {
            [1] = 'Chose {C:attention}1{} of {C:attention}2{} {C:enhanced}Joker Launched Fighters{}'
        },
        group_name = "rosemod2_boosters"
    },
    config = { extra = 2, choose = 1 },
    cost = 2,
    weight = 0.65,
    atlas = "CustomBoosters",
    pos = { x = 4, y = 0 },
    group_key = "rosemod2_boosters",
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "joker_launched_fighter",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "rosemod2_shipyard_pack"
        }
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}
