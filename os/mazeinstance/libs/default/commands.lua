-- Variable function
local commands = {}

-- Execute Commands
function commands.cmd(command)
    -- Commands
    if command == "help" then
        print("")
        term.setTextColor(colors.yellow)
        print("Command List")
        term.setTextColor(colors.white)
        print("cd - Change path directory")
        print("clear - Clear shell")
        print("desktop - Launch MIDesktop (Only Shell)")
        print("echo - Print text")
        print("help - Help command")
        print("ls - Folder and files lists")
        print("reboot - Restart computer")
    elseif command:sub(1, 3) == "cd " then
        local path = command:sub(4)
        shell.run("cd " .. path)
    elseif command:sub(1, 5) == "clear" then
        term.clear()
        term.setCursorPos(1, 1)
    elseif command:sub(1, 5) == "echo " then
        local path = command:sub(6)
        print(path)
    elseif command:sub(1, 5) == "ls" then
        shell.run("ls")
    elseif command:sub(1, 6) == "reboot" then
        print("Reboot...")
        sleep(1)
        shell.run("reboot")
    else
        term.setTextColor(colors.red)
        print("Command not found (help for command list)")
        term.setTextColor(colors.white)
    end
end

return commands
