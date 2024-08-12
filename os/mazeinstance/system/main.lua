-- Require

local command = require("/os/mazeinstance/libs/default/commands")
local createWindows = require("/os/mazeinstance/libs/default/create_windows")

-- Variables

local textColor = colors.white
local backgroundColor = colors.blue

-- Function

local function onButtonClick()
    command.cmd("reboot")
end

local main = createWindows.new("Desktop")
main:setDefaultsColors(textColor, backgroundColor)
main:addText("Hello", 5, 5, colors.red)
main:addButton("Reboot", 4, 7, 6, 1, onButtonClick, colors.black, colors.white)

-- Fonction principale pour gérer l'interface graphique
local function runInterface()
    term.clear()
    term.setCursorPos(1, 1)
    
    while true do
        main:draw()
        
        local event, button ,x, y = os.pullEvent()

        if event == "mouse_click" then
            main:handleClick(x, y)
        end
    end
end

-- Draw window
runInterface()