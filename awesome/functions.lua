-- Markup functions
function setFg(color, text)
    return '<span color="'..color..'">'..text..'</span>'
end

function setBg(color, text)
    return '<bg color="'..color..'" />'..text
end

-- Battery
function getBatteryInfo(adapter)
    local fInfo = io.open("/proc/acpi/battery/"..adapter.."/info")
    local infoContents = fInfo:read("*all");
    fInfo:close();

    local fState = io.open("/proc/acpi/battery/"..adapter.."/state")
    local stateContents = fState:read("*all");
    fState:close();

    local status, _, battPresent, state, rate, current_cap, full_cap
    status, _, battPresent = string.find(stateContents, "present:%s+(%w+)")
    status, _, state = string.find(stateContents, "charging state:%s+(%w+)")
    status, _, rate = string.find(stateContents, "present rate:%s+(%d+).*")
    status, _, current_cap = string.find(stateContents, "remaining capacity:%s+(%d+).*")
    status, _, full_cap = string.find(infoContents, "last full capacity:%s+(%d+).*")

    local prefix, time

    if battPresent == "no" then
        return "AC: " .. setFg("green", "--")
    else
        if state == "charged" then
            return "AC: " .. setFg("green", "100%")
        elseif state == "charging" then
            prefix = "AC: "
            time = (full_cap-current_cap)/rate
        elseif state == "discharging" then
            prefix = "Batt: "
            time = current_cap/rate
        end
    end

    time_hour = math.floor(time)
    time_minute = math.floor((time-time_hour)*60)

    local percent
    percent = math.floor(current_cap/full_cap*100)

    if percent < 10 then
        percentStr = setFg("red", percent .. "%")
    elseif percent < 50 then
        percentStr = setFg("orange", percent .. "%")
    else
        percentStr = setFg("green", percent .. "%")
    end

    return prefix .. percentStr .. " " .. string.format("(%02d:%02d)", time_hour, time_minute)
end

-- Time
function getTime()
    return os.date("%a %b %d, %H:%M")
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
        


