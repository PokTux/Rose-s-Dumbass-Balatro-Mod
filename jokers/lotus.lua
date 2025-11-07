SMODS.Joker{ --Lotus
    key = "lotus",
    config = {
        extra = {
            xmult = 1,
            rosemod2_lotuslose = 0,
            rosemod2_lotuswin = 0
        }
    },
    loc_txt = {
        ['name'] = 'Lotus',
        ['text'] = {
            [1] = 'Gains {X:mult,C:white}X0.5{} Mult when a {C:clubs}Club{}',
            [2] = '{C:attention}face {}card is scored',
            [3] = '{C:default}(Currently{} {X:mult,C:white}X#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 7
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
    pools = { ["rosemod2_rosemod2_legendary"] = true, ["rosemod2_rosemod2_frame"] = true },
    soul_pos = {
        x = 6,
        y = 7
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
        
        return {vars = {card.ability.extra.xmult}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if (context.other_card:is_face() and context.other_card:is_suit("Clubs")) then
                card.ability.extra.xmult = (card.ability.extra.xmult) + 0.5
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    if context.end_of_round and context.game_over and context.main_eval  and not context.blueprint then
        G.E_MANAGER:add_event(Event({
        func = function()
            play_sound("rosemod2_lotuslose")
            
            return true
            end,
        }))
    end
if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
    if G.GAME.round_resets.ante == 8 then
        G.E_MANAGER:add_event(Event({
        func = function()
            play_sound("rosemod2_lotuswin")
            
            return true
            end,
        }))
    end
end
end
}