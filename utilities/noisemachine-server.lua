local modem = peripheral.find("modem")
local arg1 = ...
local ch = 100

modem.open(ch)

if arg1 == 1 then
    modem.transmit(ch, 15, "1")
elseif arg1 == 0 then
    modem.transmit(ch, 15, "1")
end