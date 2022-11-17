while true do 

--get methods
local reactor = peripheral.wrap("back")
local mon = peripheral.wrap("top")

--variables
fueltemp = reactor.getFuelTemperature()
casetemp = reactor.getCasingTemperature()

fuel = reactor.getFuelAmount()
maxfuel = reactor.getFuelAmountMax()
fuelpercent = fuel / maxfuel * 100

energy = reactor.getEnergyStored()
maxenergy = reactor.getEnergyCapacity()
energypercent = energy / maxenergy * 100

rodinsertion = reactor.getControlRodLevel(1)
waste = reactor.getWasteAmount()

isactive = reactor.getActive()

--refresh time 
    os.sleep(0.20)

--mon output
    mon.clear()
    mon.setCursorPos(1,2)
    mon.write("Fuel-Temp")
    mon.setCursorPos(11,2)
    mon.write(fueltemp.."C")
    mon.setCursorPos(1,3)
    mon.write("Case-Temp")
    mon.setCursorPos(11,3)
    mon.write(casetemp.."C")
    mon.setCursorPos(1,4)
    mon.write("Energy") 
    mon.setCursorPos(11,4)
    mon.write(energypercent.."%")
    mon.setCursorPos(1,5)   
    mon.write("Waste")
    mon.setCursorPos(11,5)
    mon.write(waste)
    mon.setCursorPos(1,6)
    mon.write("Rod-insertion")
    mon.setCursorPos(18,6)
    mon.write(rodinsertion.."%")    

    if isactive == true then 
        mon.setCursorPos(1,1)
        mon.blit("Reactor","ddddddd","fffffff")
        mon.setCursorPos(9,1)
        mon.blit("Active","dddddd","ffffff")
    else 
        mon.setCursorPos(1,1)
        mon.blit("Reactor","eeeeeee","fffffff")
        mon.setCursorPos(9,1)
        mon.blit("Inactive","eeeeeeee","ffffffff")
    end

end 