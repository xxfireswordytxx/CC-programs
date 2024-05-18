local speaker = peripheral.find("speaker")
local modem = peripheral.find("modem")
local ch = 100
modem.open(ch)


while true do
    local event, side, channel, replyChannel, message, distance
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until  channel == ch
    if message == 1 then 
        repeat 
            speaker.playSound("entity.creeper.primed")
            os.sleep(math.random(1, 10))
            print("success")
        until message == 0
    end
    print("fail")
end
    
