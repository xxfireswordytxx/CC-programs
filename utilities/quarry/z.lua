gear = peripheral.wrap("back")
modem = peripheral.find("modem")
modem.open(2)

while true do
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 2

    if message == "z+" then 
        gear.move(8, 2)
    elseif message == "z-" then
        gear.move(128, -2)
    end
end
