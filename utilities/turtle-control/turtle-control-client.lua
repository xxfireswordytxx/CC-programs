local modem = peripheral.find("modem")

while true do
    local event, side, channel, replyChannel, message, distance
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 16

    if message == "f" then
        turtle.forward()
        os.sleep(0.05)
    elseif message == "b" then
        turtle.back()
        os.sleep(0.05)
    elseif message == "l" then
        turtle.turnLeft()
        os.sleep(0.05)
    elseif message == "r" then
        turtle.turnRight()
        os.sleep(0.05)
    end

end