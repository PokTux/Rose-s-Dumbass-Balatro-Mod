SMODS.Joker{ --The Joker is You!
    key = "thejokerisyou",
    config = {
        extra = {
            cards = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Joker is You!',
        ['text'] = {
            [1] = 'After {C:attention}9{} cards have been scored',
            [2] = 'sell this Joker to create an',
            [3] = '{C:uncommon}Uncommon Tag{}',
            [4] = '{C:inactive}(Currently {}{C:attention}#1#{}{C:inactive}/9){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_jokers"] = true, ["rosemod2_rosemod2_toby"] = true },
    soul_pos = {
        x = 0,
        y = 4
    },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_TAGS["tag_uncommon"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"tag_uncommon\" isn't a valid Tag key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.cards}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            card.ability.extra.cards = (card.ability.extra.cards) + 1
        end
        if context.selling_self  and not context.blueprint then
            if (card.ability.extra.cards or 0) >= 9 then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            local tag = Tag("tag_uncommon")
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
                        message = "I came as fast as I could!"
                    }
                end
            end
        end
}