local modem = peripheral.find("modem") or error("No modem attached", 0)
local args = {...}
local RCNI = 0
local c = 15
local rc = 43
local v = tonumber(args [1])
local ACK = tonumber(message)
local m = string

modem.open(43)
 
if v == 1 then
    print("Repeat RCNI: "..tostring(RCNI))
    print("port 43 Open: "..tostring(modem.isOpen(43)))
    print("port 15 Open: "..tostring(modem.isOpen(15)))
end

term.write("RCNI: ")
RCNI = read()

modem.transmit(15, 43, tostring(RCNI))

local event, side, channel, replyChannel, message, distance
repeat
  event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
until channel == 43

if v == 1 then
    print("Connection status: "..message)
end

if message == "1" then
    term.write("message: ")
    m = read()
end

modem.transmit(15, 43, m)



