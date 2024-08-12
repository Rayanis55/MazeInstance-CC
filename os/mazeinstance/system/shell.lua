local command = require("/os/mazeinstance/libs/default/commands")

function launch_terminal()
    -- Start

    shell.run("clear")
    print("MazeInstance Terminal [Dev Version 0.0.1]")
    print("(C) MazeGroup - All rights reserved")
    print()
    while true do
        term.setBackgroundColor(colors.black)
        -- Directory Print

        term.setTextColor(colors.yellow)
        directory = shell.dir()
        write(directory.."> ")
        term.setTextColor(colors.white)
        local user_input = read()

        if user_input == "desktop" then
            shell.run("main.lua")
        else
            command.cmd(user_input)
        end
    end
end

launch_terminal()