SMODS.Joker{ --Aksis
    key = "aksis",
    config = {
        extra = {
            CONSUME = 0,
            enhancedcardsinhand = 0
        }
    },
    loc_txt = {
        ['name'] = 'Aksis',
        ['text'] = {
            [1] = '{C:red,s:1.5}~consume~{}',
            [2] = 'When a consumable is used',
            [3] = 'gain {C:attention}1{} stack of {C:red}SIVA{}',
            [4] = '{C:inactive}(Currently:{} {C:attention}#1#{} {C:inactive}stacks){}',
            [5] = '{C:white}.{}',
            [6] = '{C:red,s:1.5}~enhance~{}',
            [7] = 'When a hand is played apply',
            [8] = 'a random {C:attention}Enhancement {}to all',
            [9] = 'scored cards and consume',
            [10] = '{C:attention}1{} stack of {C:red}SIVA{}',
            [11] = '{C:white}.{}',
            [12] = '{C:red,s:1.5}~replicate~{}',
            [13] = 'Retrigger scored {C:attention}Enhanced{}',
            [14] = 'cards {C:attention}1{} additional time per',
            [15] = '{C:attention}Enhanced {}card held in hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosemod2_rosemod2_legendary"] = true, ["rosemod2_raidboss"] = true },
    soul_pos = {
        x = 9,
        y = 8
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.CONSUME}}
    end,

    
    calculate = function(self, card, context)
        if context.using_consumeable  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.CONSUME = (card.ability.extra.CONSUME) + 1
                    return true
                    end
                }
            end
            if context.repetition and context.cardarea == G.play  then
                if (function()
                    local enhancements = SMODS.get_enhancements(context.other_card)
                    for k, v in pairs(enhancements) do
                        if v then
                            return true
                            end
                        end
                        return false
                        end)() then
                            return {
                            repetitions = (function() local count = 0; for _, card in ipairs(G.hand and G.hand.cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)(),
                                message = localize('k_again_ex')
                            }
                        end
                    end
                    if context.individual and context.cardarea == G.play  then
                        if (card.ability.extra.CONSUME or 0) >= 1 then
                            local enhancement_pool = {}
                            for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                                if enhancement.key ~= 'm_stone' then
                                    enhancement_pool[#enhancement_pool + 1] = enhancement
                                end
                            end
                            local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                            context.other_card:set_ability(random_enhancement)
                            return {
                                message = "Card Modified!"
                                }
                            end
                        end
                        if context.after and context.cardarea == G.jokers  and not context.blueprint then
                            if (card.ability.extra.CONSUME or 0) >= 1 then
                                return {
                                    func = function()
                                        card.ability.extra.CONSUME = math.max(0, (card.ability.extra.CONSUME) - 1)
                                        return true
                                        end
                                    }
                                end
                            end
                        end
}