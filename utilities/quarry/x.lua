gear = peripheral.wrap("back")
modem = peripheral.find("modem")
modem.open(1)

while true do
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 1

    if message == "x+" then
        gear.move(8, -2)
    elseif message == "x-" then
        gear.move(64, 2)
    end
end
