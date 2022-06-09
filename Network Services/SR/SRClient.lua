local S = fs.open("SRSPortconf.txt", "r")
local SF = S.readLine()
S.close()

local C = fs.open("SRCPortconf.txt", "r")
local CF = C.readLine()
C.close()

local modem = peripheral.find("modem") or error("No modem attached", 0)
local args = {...}
local RCNI = 0
local v = tonumber(args [1])
local ACK = tonumber(message)
local m = string



modem.open(tonumber(SF))
 
if v == 1 then
    print("Repeat RCNI: "..tostring(RCNI))
    print("port 43 Open: "..tostring(modem.isOpen(tonumber(CF))))
    print("port 15 Open: "..tostring(modem.isOpen(tonumber(SF))))
end

term.write("RCNI: ")
RCNI = read()

modem.transmit(tonumber(SF), tonumber(CF), tostring(RCNI))

local event, side, channel, replyChannel, message, distance
repeat
  event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
until channel == tonumber(CF)

if v == 1 then
    print("Connection status: "..message)
end

if message == "1" then
    term.write("message: ")
    m = read()
end

modem.transmit(15, 43, m)



