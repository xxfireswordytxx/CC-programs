-- wrap modem to use
local modem = peripheral.find("modem") or error("No modem attached", 0)

-- open variable file to read current log file number
local f = fs.open("var.txt", "r")
local contents = f.readLine()
f.close()
p = tonumber(contents)

local c = 0

modem.open(15)

while true do
    p = p + 1

    local event, side, channel, replyChannel, message, distance
    repeat
      event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 15
    
    print(tostring(message))

    local RCNI = message

    local RCNIF = fs.open("RCNI.txt", "w")
    RCNIF.write(RCNI)
    RCNIF.close()

    
    local modem = peripheral.find("modem") or error("No modem attached", 0)

    modem.transmit(43, 15, "1")

    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 15

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



    modem.transmit(tonumber(RCNIF2), 15, tostring(smc))

    p = tonumber(contents) + 1

end