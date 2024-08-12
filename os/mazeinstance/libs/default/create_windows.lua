
local CreateWindows = {}

-- CreateWindows function
function CreateWindows.new(title)
    local window = {
        title = title,
        elements = {}
    }

    -- Set Defaults Colors
    function window:setDefaultsColors(textColor, backgroundColor)
        table.insert(self.elements, {
            type = "setDefaultsColors",

            defaultTextColor = textColor,
            setDefaultTextColor = term.setTextColor(textColor),

            defaultBackgroundColor = backgroundColor,
            setDefaultBackground = term.setBackgroundColor(backgroundColor)
        })
    end

    -- Add Text Function
    function window:addText(text, x, y, color, backgroundColor)
        table.insert(self.elements, {
            type = "text", 
            text = text, 
            x = x, 
            y = y,
            color = color,
            backgroundColor = backgroundColor,
        })
    end

    -- Add Button Function
    function window:addButton(text, x, y, width, height, callback, color, backgroundColor)
        table.insert(self.elements, {
            type = "button", 
            text = text, 
            x = x, 
            y = y, 
            width = width, 
            height = height,
            callback = callback,
            color = color,
            backgroundColor = backgroundColor,
        })
    end

    -- Draw window function
    function window:draw()
        term.clear()
        term.setCursorPos(1, 1)
        print(self.title)
        for _, element in ipairs(self.elements) do
            if element.type == "setDefaultsColors" then
                defaultBG = element.defaultBackgroundColor
                defaultTextColor = element.defaultTextColor

            elseif element.type == "text" then
                term.setCursorPos(element.x, element.y)
                print(element.text)

                -- Set Colors

                if element.color then
                    term.setTextColor(element.color)
                else
                    term.setBackgroundColor(defaultTextColor)
                end

                if element.backgroundColor then
                    term.setBackgroundColor(element.backgroundColor)
                else
                    term.setBackgroundColor(defaultBG)
                end

                -- Reset Defaults Colors

                term.setTextColor(defaultTextColor)
                term.setBackgroundColor(defaultBG)

            elseif element.type == "button" then
                -- Set Colors

                if element.color then
                    term.setTextColor(element.color)
                else
                    term.setBackgroundColor(defaultTextColor)
                end

                if element.backgroundColor then
                    term.setBackgroundColor(element.backgroundColor)
                else
                    term.setBackgroundColor(defaultBG)
                end

                -- Draw button

                for dy = 0, element.height - 2 do
                    term.setCursorPos(element.x, element.y + dy)
                    term.write(string.rep(" ", element.width))
                end
                term.setCursorPos(element.x + 1, element.y + 1)
                term.write(element.text)

                -- Reset Defaults Colors

                term.setTextColor(defaultTextColor)
                term.setBackgroundColor(defaultBG)
            end
        end
    end

    -- Clickable button
    function window:handleClick(x, y)
        for _, element in ipairs(self.elements) do
            if element.type == "button" then
                local btnX1, btnY1 = element.x, element.y
                local btnX2, btnY2 = element.x + element.width - 1, element.y + element.height - 0               if x >= btnX1 and x <= btnX2 and y >= btnY1 and y <= btnY2 then
                    if element.callback then
                        element.callback()
                    end
                end
            end
        end
    end

    return window
end

return CreateWindows
