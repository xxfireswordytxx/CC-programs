modem = peripheral.find("modem")
modem.open(3)

while true do
    repeat
        vent, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 3
    if message == "y-" then
        redstone.setOutput("back", true)
        os.sleep(300)
        redstone.setOutput("back", false)
    end
end
