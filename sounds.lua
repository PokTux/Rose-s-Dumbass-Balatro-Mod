function jokerExists(abilityname)
    local _check = false
    if G.jokers and G.jokers.cards then
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.name == abilityname then _check = true end
        end
    end
    return _check
end
--function from yahimod, otherwise the game crashes if yahimod isnt installed--

SMODS.Sound{
    key="toolong",
    path="toolong.ogg",
    pitch=0.7,
    volume=0.6,
}

SMODS.Sound{
    key="tensionhorn",
    path="tensionhorn.ogg",
    pitch=0.7,
    volume=0.6,
}

SMODS.Sound{
    key="stalk",
    path="stalk.ogg",
    pitch=0.7,
    volume=0.6,
}

SMODS.Sound{
    key="jevil",
    path="jevil.ogg",
    pitch=0.7,
    volume=0.5,
}

SMODS.Sound{
    key="crash",
    path="crash.ogg",
    pitch=0.7,
    volume=0.7,
}

SMODS.Sound{
    key="valk",
    path="valk.ogg",
    pitch=0.7,
    volume=0.5,
}

SMODS.Sound{
    key="eat",
    path="eat.ogg",
    pitch=0.7,
    volume=0.5,
}

SMODS.Sound{
    key="scare",
    path="scare.ogg",
    pitch=0.7,
    volume=2.5,
}

SMODS.Sound{
    key="carpet",
    path="carpet.ogg",
    pitch=0.7,
    volume=0.6,
}

SMODS.Sound{
    key="lotuswin",
    path="lotuswin.ogg",
    pitch=0.7,
    volume=0.5,
}

SMODS.Sound{
    key="lotuslose",
    path="lotuslose.ogg",
    pitch=0.7,
    volume=0.5,
}

SMODS.Sound{
    key="firehole",
    path="firehole.ogg",
    pitch=0.7,
    volume=0.6,
}

--Susie Joker Music--

SMODS.Sound({
    key = "music_buster", 
    path = "music_buster.ogg",
    pitch = 1,
    volume = 0.6,
    select_music_track = function()
        if jokerExists("j_rosemod2_susie") and string.len(G.GAME.blind.name) > 0 then
		    return 90 end
	end,
})

SMODS.Sound({
    key = "music_busterboss", 
    path = "music_busterboss.ogg",
    pitch = 1,
    volume = 0.6,
    select_music_track = function()
        if jokerExists("j_rosemod2_susie") and G.GAME.blind and G.GAME.blind:get_type() == 'Boss' then
		    return 91 end
	end,
})

SMODS.Sound({
    key = "music_busterwater", 
    path = "music_busterwater.ogg",
    pitch = 1,
    volume = 0.6,
    select_music_track = function()
        if jokerExists("j_rosemod2_susie") and G.GAME.blind and G.GAME.blind:get_type() == 'Boss' and G.GAME.round_resets.ante == 8 then
		    return 92 end
	end,
})

--Tenna Joker Music--

SMODS.Sound({
    key = "music_tenna", 
    path = "music_tenna.ogg",
    pitch = 1,
    volume = 0.6,
    select_music_track = function()
        if jokerExists("j_rosemod2_anttenna") and string.len(G.GAME.blind.name) > 0 then
		    return 80 end
	end,
})

SMODS.Sound({
    key = "music_tennaboss", 
    path = "music_tennaboss.ogg",
    pitch = 1,
    volume = 0.6,
    select_music_track = function()
        if jokerExists("j_rosemod2_anttenna") and G.GAME.blind and G.GAME.blind:get_type() == 'Boss' then
		    return 81 end
	end,
})