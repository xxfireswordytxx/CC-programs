--loop---------------------------------------------
while true do
--local variables----------------------------------
local reactor = peripheral.wrap("back")
local mon = peripheral.wrap("top")
local speaker = peripheral.wrap("bottom")
local percent = "%"
local degrees = "C"
local power = rednet.receive("")
--reactor-variables--------------------------------
isactive = reactor.getActive()
lever = redstone.getInput("left")
fuel = reactor.getFuelAmount()
energy = reactor.getEnergyStored()
waste = reactor.getWasteAmount()
fueltemp = reactor.getFuelTemperature()
casetemp = reactor.getCasingTemperature()
rodinsertion = reactor.getControlRodLevel(1)
--refresh-time------------------------------------- 
    os.sleep(0.20)
--local-info---------------------------------------    
    mon.clear()
    mon.setCursorPos(1,2)
    mon.write("Fuel-Temp")
    mon.setCursorPos(11,2)
    mon.write(fueltemp..degrees)
    mon.setCursorPos(1,3)
    mon.write("Case-Temp")
    mon.setCursorPos(11,3)
    mon.write(casetemp..degrees)
    mon.setCursorPos(1,4)
    mon.write("Energy") 
    mon.setCursorPos(11,4)
    mon.write(energy)
    mon.setCursorPos(1,5)   
    mon.write("Waste")
    mon.setCursorPos(11,5)
    mon.write(waste)
    mon.setCursorPos(1,6)
    mon.write("Rod-insertion")
    mon.setCursorPos(18,6)
    mon.write(rodinsertion..percent)
--local-active-info--------------------------------
    if isactive == true then 
        mon.setCursorPos(1,1)
        mon.write("Reactor")
        mon.setCursorPos(9,1)
        mon.write("Active")
    else 
        mon.setCursorPos(1,1)
        mon.write("Reactor")
        mon.setCursorPos(9,1)
        mon.write("Inactive")
    end
--reactor-emergency-shutoff------------------------
    if lever == false then
        reactor.setActive(false)
    else
        reactor.setActive(true)
    end
--reactor-power-error alarm
    if 
--reactor-waste-alarm------------------------------
    if waste > 1000 then 
     speaker.playNote("bell",1000,13)
     os.sleep(0.2)
     speaker.playNote("bell",1000,10)
     os.speed(0.2)
     speaker.playNote("bell",1000,10)
     os.sleep(0.2)
     speaker.playNote("bell",1000,13)
    end
--reactor-fuel-alarm-------------------------------
    if fuel < 20 then
     speaker.playNote("bell",1000,13)
     os.sleep(0.2)
     speaker.playNote("bell",1000,10)
    end
--reactor-shutoff----------------------------------    
    if energy >= 8000000 then
     reactor.setAllControlRodLevels(100)
    elseif energy >= 7500000 then
     reactor.setAllControlRodLevels(90)
    elseif energy >= 7000000 then
     reactor.setAllControlRodLevels(80)
    elseif energy >= 6500000 then
     reactor.setAllControlRodLevels(70)
    elseif energy >= 6000000 then
     reactor.setAllControlRodLevels(60)
    elseif energy >=5500000 then 
     reactor.setAllControlRodLevels(50)
    elseif energy >= 5000000 then
     reactor.setAllControlRodLevels(40)
    elseif energy >= 4500000 then
     reactor.setAllControlRodLevels(30)
    elseif energy >= 4000000 then
     reactor.setAllControlRodLevels(20)
    elseif energy >= 3500000 then 
     reactor.setAllcontrolRodLevels(10)
    elseif energy >= 3000000 then
    reactor.setAllControlRodLevels(0)                      
end
end
---------------------------------------------------
