local S = fs.open("SRSPortconf.txt", "r")
local SF = S.readLine()
S.close()

local C = fs.open("SRCPortconf.txt", "r")
local CF = C.readLine()
C.close()

-- wrap modem to use
local modem = peripheral.find("modem") or error("No modem attached", 0)

-- open variable file to read current log file number
local f = fs.open("var.txt", "r")
local contents = f.readLine()
f.close()
p = tonumber(contents)

local c = 0

modem.open(tonumber(CF))

while true do
    p = p + 1

    local event, side, channel, replyChannel, message, distance
    repeat
      event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == tonumber(SF)
    
    print(tostring(message))

    local RCNI = message

    local RCNIF = fs.open("RCNI.txt", "w")
    RCNIF.write(RCNI)
    RCNIF.close()

    
    local modem = peripheral.find("modem") or error("No modem attached", 0)

    modem.transmit(tonumber(CF), tonumber(SF), "1")

    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == tonumber(SF)

    local file = fs.open(tostring(p)..".txt", "w")
    file.write(tostring(message))
    file.close()

    local f = fs.open("var.txt", "w")
    f.write(tonumber(p))
    f.close()

    local sm = fs.open(tostring(p)..".txt", "r")
    local smc = sm.readAll()
    sm.close()

    local RCNI2 = fs.open("RCNI.txt", "r")
    local RCNIF2 = RCNI2.readLine()
    RCNI2.close()



    modem.transmit(tonumber(RCNIF2), tonumber(CF), tostring(smc))

    p = tonumber(contents) + 1

end
