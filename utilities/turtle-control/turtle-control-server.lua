local modem = peripheral.find("modem")

args = {...}
while true do 

    function tcom(s, d)
        if redstone.getInput(s) == true then
            modem.transmit(16, 1, d)
            os.sleep(0.1)
        end
    end
    tcom("top", "f")
    tcom("bottom", "b")
    tcom("left", "l")
    tcom("right", "r")
end