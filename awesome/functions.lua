local function setFg(color, text)
    return '<span color="'..color..'">'..text..'</span>'
end

local function setBg(color, text)
    return '<bg color="'..color..'" />'..text
end

local function isEmpty(s)
    return s == nil or s == ''
end

function getBatteryInfo()
    fh = assert(io.popen("acpi", "r"))
    local acpi = fh:read("*l")
    fh:close()

    if isEmpty(acpi) then
        return "AC"
    end

    local state, percentStr, time
    _, _, state = string.find(acpi, "(%w+),")
    _, _, percentStr = string.find(acpi, "([0-9]+)%%")
    _, _, time = string.find(acpi, "([0-9:]+) [a-zA-Z ]+$")

    print(acpi)
    print(state)
    print(percentStr)
    print(time)

    local prefix
    if state == "Unknown" then
        return "Unknown"
    elseif state == "Full" then
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
        
