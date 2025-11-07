SMODS.Joker{ --Oryx
    key = "oryx",
    config = {
        extra = {
            set_probability = 0,
            repetitions = 1,
            odds = 2,
            numerator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Oryx',
        ['text'] = {
            [1] = '{C:green}#1#{} in {C:green}#2#{} chance to {C:dark_edition}Take{}',
            [2] = 'scored cards',
            [3] = '{C:white}.{}',
            [4] = 'Retrigger scored {C:dark_edition}Taken {}cards',
            [5] = '{C:white}.{}',
            [6] = '{C:dark_edition}Taken {}cards will not {C:red}destroy {}',
            [7] = 'Jokers when discarded',
            [8] = '{C:white}.{}',
            [9] = 'Bosses that debuff {C:spades}Dark {}suits',
            [10] = 'are disabled'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        x = 0,
        y = 9
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
        
        local info_queue_0 = G.P_CENTERS["m_rosemod2_taken"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_rosemod2_taken\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_rosemod2_oryx') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.fix_probability  then
            local numerator, denominator = context.numerator, context.denominator
            if context.identifier == "m_rosemod2_taken" then
                numerator = card.ability.extra.set_probability
            end
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
        if context.repetition and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_rosemod2_taken"] == true then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_94aad5e3', 1, card.ability.extra.odds, 'j_rosemod2_oryx', false) then
                    context.other_card:set_ability(G.P_CENTERS.m_rosemod2_taken)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Taken!", colour = G.C.BLUE})
                end
            end
        end
        if context.setting_blind  and not context.blueprint then
            if (G.GAME.blind.config.blind.key == "bl_goad" or G.GAME.blind.config.blind.key == "bl_club") then
                return {
                    func = function()
                        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.blind:disable()
                                play_sound('timpani')
                                return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "The Darkness is a gift! Let my will set you free!", colour = G.C.GREEN})
                            end
                            return true
                            end
                        }
                    end
                end
            end
}