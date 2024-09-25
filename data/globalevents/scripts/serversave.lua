local shutdown = false
local clean = false
local closeServer = false
local minutes = 5 -- Min 1 minute
local notify = true

local function ServerSave()
    if shutdown then
        Game.setGameState(GAME_STATE_SHUTDOWN)
    else
    if clean then
        cleanMap()
    end
    if closeServer then
        Game.setGameState(GAME_STATE_CLOSED)
    end
    end
end