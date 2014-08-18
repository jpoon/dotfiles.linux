-- Markup functions
function setFg(color, text)
    return '<span color="'..color..'">'..text..'</span>'
end

function setBg(color, text)
    return '<bg color="'..color..'" />'..text
end

function getBatteryInfo()
    fh = assert(io.popen("acpi", "r"))
    local acpi = fh:read("*l")
    fh:close()

    local state, percentStr, time
    _, _, state, percentStr, time = string.find(acpi, "(%w+), (%w+)%%, ([0-9:]+)")
    print(state)
    print(percent)
    print(time)

    local prefix
    if state == "Charged" then
        return "AC: " .. setFg("green", "100%")
    elseif state == "Charging" then
        prefix = "AC: "
    elseif state == "Discharging" then
        prefix = "Batt: "
    end

    local percent = tonumber(percentStr)
    if percent < 10 then
        percentFormatted = setFg("red", percent .. "%")
    elseif percent < 50 then
        percentFormatted = setFg("orange", percent .. "%")
    else
        percentFormatted = setFg("green", percent .. "%")
    end

    return prefix .. percentFormatted .. " " .. time
end 

-- Music
function volume(mode)
    cardId = 0
    channel = "Master"

    if mode == "mute" then
        awful.util.spawn("amixer sset " .. channel .. " toggle")
    elseif mode == "down" then
        awful.util.spawn("amixer -q -c " .. cardId .. " sset " .. channel .. " 5%-")
    elseif mode == "up" then
        awful.util.spawn("amixer -q -c " .. cardId .. " sset " .. channel .. " 5%+") 
    end
end
 
function audio(op)
    if op == "play" then
        awful.util.spawn("mocp --toggle-pause")
    elseif op == "stop" then
        awful.util.spawn("mocp --stop")
    elseif op == "next" then
        awful.util.spawn("mocp --next")
    elseif op == "prev" then
        awful.util.spawn("mocp --previous")
    end
end
        
