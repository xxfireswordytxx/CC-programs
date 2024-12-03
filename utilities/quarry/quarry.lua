modem = peripheral.find("modem")

modem.open(4)
modem.open(5)
modem.open(6)

x = 0
z = 0


while true do

    local xfile = fs.open("z", "wr")
    local x = xfile.readLine()
    xfile.write(z)
    xfile.close()

    local zfile = fs.open("z", "wr")
    local z = zfile.readLine()
    zfile.write(z)
    zfile.close()


    repeat until x = 8
        modem.transmit(1, 4, "x+")
        x = x + 1
        modem.transmit(3, 6, "y-")
        xfile.write(x)
        xfile.close()
        os.sleep(360)
    end
    modem.transmit(2, 5, "z+")
    z = z + 1
    zfile.write(z)
    zfile.close()
    x = 0
    modem.transmit(1, 4, "x-")
    if z == 16 then 
        modem.transmit(1, 4 "x-")
        modem.transmit(2, 5 "z-")
        break
    end

end
