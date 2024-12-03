gear = peripheral.wrap("back")
modem = peripheral.find("modem")
modem.open(1)

while true do
    local event, side, channel, replyChannel, message, distance
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 1

    if message == "x+" then
        gear.move(8, -2)
        print("3")
    elseif message == "x-" then
        gear.move(64, 2)
        print("2")
    end
    print("1")
end
