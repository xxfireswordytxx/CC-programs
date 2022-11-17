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
    mon.write(fueltemp)
    mon.setCursorPos(1,3)
    mon.write("Case-Temp")
    mon.setCursorPos(11,3)
    mon.write(casetemp)
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

    if energypercent >= 80 then
        reactor.setAllControlRodLevels(100)
       elseif energypercent >= 75 then
        reactor.setAllControlRodLevels(90)
       elseif energypercent >= 70 then
        reactor.setAllControlRodLevels(80)
       elseif energypercent >= 65 then
        reactor.setAllControlRodLevels(70)
       elseif energypercent >= 60 then
        reactor.setAllControlRodLevels(60)
       elseif energypercent >=55 then 
        reactor.setAllControlRodLevels(50)
       elseif energypercent >= 50 then
        reactor.setAllControlRodLevels(40)
       elseif energypercent >= 45 then
        reactor.setAllControlRodLevels(30)
       elseif energypercent >= 40 then
        reactor.setAllControlRodLevels(20)
       elseif energypercent >= 35 then 
        reactor.setAllcontrolRodLevels(10)
       elseif energypercent >= 30 then
       reactor.setAllControlRodLevels(0)   
    end
end 