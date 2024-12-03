local modem = peripheral.find("modem")
if not modem then error("Modem not found") end

modem.open(4)
modem.open(5)
modem.open(6)

local x = 0
local z = 0

-- Read saved values
local xfile = fs.open("x", "r")
if xfile then
    x = tonumber(xfile.readLine()) or 0
    xfile.close()
end

local zfile = fs.open("z", "r")
if zfile then
    z = tonumber(zfile.readLine()) or 0
    zfile.close()
end

while true do
    repeat
        if x > 0 then
            modem.transmit(1, 4, "x+")
        end
        x = x + 1
        modem.transmit(3, 6, "y-")
        sleep(360)
    until x == 8

    -- Save `x`
    local xfile = fs.open("x", "w")
    xfile.write(x)
    xfile.close()

    modem.transmit(2, 5, "z+")
    z = z + 1

    -- Save `z`
    local zfile = fs.open("z", "w")
    zfile.write(z)
    zfile.close()

    x = 0
    modem.transmit(1, 4, "x-")
    if z == 16 then
        modem.transmit(1, 4, "x-")
        modem.transmit(2, 5, "z-")
        os.exit()
    end
end
