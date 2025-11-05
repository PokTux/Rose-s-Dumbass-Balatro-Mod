SMODS.Joker{ --Clown Masked Culprits
    key = "clownmaskedculprits",
    config = {
        extra = {
            coupon = 0
        }
    },
    loc_txt = {
        ['name'] = 'Clown Masked Culprits',
        ['text'] = {
            [1] = 'Create a {C:attention}Coupon Tag{} if scored hand',
            [2] = 'contains a {C:attention}Four of a Kind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_TAGS["tag_coupon"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"tag_coupon\" isn't a valid Tag key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if next(context.poker_hands["Four of a Kind"]) then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            local tag = Tag("tag_coupon")
                            if tag.name == "Orbital Tag" then
                                local _poker_hands = {}
                                for k, v in pairs(G.GAME.hands) do
                                    if v.visible then
                                        _poker_hands[#_poker_hands + 1] = k
                                    end
                                end
                                tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                            end
                            tag:set_ability()
                            add_tag(tag)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                            end
                        }))
                        return true
                        end,
                        message = "Created Tag!"
                    }
                end
            end
        end
}