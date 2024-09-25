--[[
TEXTCOLOR_BLACK = 0,
    TEXTCOLOR_BLUE = 5,
    TEXTCOLOR_GREEN = 18,
    TEXTCOLOR_LIGHTGREEN = 66,
    TEXTCOLOR_DARKBROWN = 78,
    TEXTCOLOR_LIGHTBLUE = 215,
    TEXTCOLOR_MAYABLUE = 95,
    TEXTCOLOR_DARKRED = 108,
    TEXTCOLOR_DARKPURPLE = 112,
    TEXTCOLOR_BROWN = 120,
    TEXTCOLOR_GREY = 129,
    TEXTCOLOR_TEAL = 143,
    TEXTCOLOR_DARKPINK = 152,
    TEXTCOLOR_PURPLE = 154,
    TEXTCOLOR_DARKORANGE = 156,
    TEXTCOLOR_RED = 180,
    TEXTCOLOR_PINK = 190,
    TEXTCOLOR_ORANGE = 192,
    TEXTCOLOR_DARKYELLOW = 205,
    TEXTCOLOR_YELLOW = 210,
    TEXTCOLOR_WHITE = 215,
    TEXTCOLOR_NONE = 255,
]]
local effects = {
    {position = Position(1000, 1000, 7), text = 'WELCOME!', effect = CONST_ME_GROUNDSHAKER, textcolor = TEXTCOLOR_YELLOW},
    {position = Position(996, 993, 7), text = '50', textcolor = TEXTCOLOR_LIGHTGREEN},
    {position = Position(997, 993, 7), text = '50', textcolor = TEXTCOLOR_LIGHTGREEN},
    {position = Position(998, 993, 7), text = 'INFINITE', textcolor = TEXTCOLOR_LIGHTGREEN},
    {position = Position(999, 993, 7), text = 'INFINITE', textcolor = TEXTCOLOR_LIGHTGREEN},
    {position = Position(1000, 993, 7), text = 'INFINITE', textcolor = TEXTCOLOR_LIGHTGREEN},
    {position = Position(999, 994, 7), text = '100cc', textcolor = TEXTCOLOR_LIGHTGREEN},
    {position = Position(1000, 994, 7), text = '100cc', textcolor = TEXTCOLOR_LIGHTGREEN},
    {position = Position(996, 994, 7), text = '1.5K', textcolor = TEXTCOLOR_LIGHTGREEN},
    {position = Position(997, 994, 7), text = '1.5K', textcolor = TEXTCOLOR_LIGHTGREEN},
    {position = Position(998, 994, 7), text = '150gp', textcolor = TEXTCOLOR_LIGHTGREEN},
    {position = Position(995, 1003, 7), text = 'EXP', effect = CONST_ME_TUTORIALARROW, textcolor = 215},
    {position = Position(1004, 995, 7), text = 'BOSS ROOM', textcolor = 215},
    {position = Position(996, 1003, 7), text = 'TRAIN', textcolor = TEXTCOLOR_TEAL},
    {position = Position(997, 1003, 7), text = 'QUESTS', textcolor = TEXTCOLOR_TEAL},

        {position = Position(995, 999, 7), text = 'CLICK ME', effect = CONST_ME_TUTORIALARROW, textcolor = 215},
}

function onThink(creature, interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
               Game.sendAnimatedText(settings.text, settings.position, settings.textcolor)
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
             if settings.effect2 then
                settings.position:sendMagicEffect(settings.effect2)
            end
        end
    end
   return true
end