while true do 


  --local variables 
local turbine = peripheral.wrap("left")
local reactor = peripheral.wrap("right")
local mon = peripheral.wrap("top")

--refresh time 
  os.sleep(0.2)
  

--reactor fuel temp variable 
rftempflo = math.floor(reactor.getFuelTemperature() * 100) / 100
rctempflo = math.floor(reactor.getCasingTemperature() * 100) / 100
--turbine rotor speed variable 
turotspeflo = math.floor(turbine.getRotorSpeed() * 100) / 100
--reactor coolant percentage variable 
rcoolantp = reactor.getCoolantAmount() / reactor.getCoolantAmountMax()
rcoolantflo = math.floor(rcoolantp * 1) / 1
--reactor waste amount variable 
rwaste = math.floor(reactor.getWasteAmount() * 100) / 100
--control rod position variable 
ctrlrodp = reactor.getControlRodLevel(1)
--fuel reactivity variable
fuelreact = math.floor(reactor.getFuelReactivity() * 100) / 100


--display reactor fuel temp
  mon.clear()
  mon.setCursorPos(1,2)
  mon.write("Fuel Temp")
  mon.setCursorPos(13,2)
  mon.write(rftempflo)

--display reactor casing temp 
  mon.setCursorPos(1,3)
  mon.write("Casing Temp")
  mon.setCursorPos(13,3)
  mon.write(rctempflo)

--display Coolant percentage 
  mon.setCursorPos(1,4)
  mon.write("Coolant") 
  mon.setCursorPos(13,4)
  mon.write(rcoolantflo.."%")

--display waste amount 
  mon.setCursorPos(1,5)   
  mon.write("Waste")
  mon.setCursorPos(13,5)
  mon.write(rwaste.."mb")

--display control rod insertion
  mon.setCursorPos(1,6)
  mon.write("Control Rods")
  mon.setCursorPos(13,6)
  mon.write(ctrlrodp.."%")

--display fuel reactivity
mon.setCursorPos(1,7)
mon.write("Reactivity")
mon.setCursorPos(13,7)
mon.write(fuelreact)

--display if the reactor is active or not
 if reactoractive == true then
  mon.setCursorPos(1,1)
  mon.blit("Reactor Active","eeeeeeeeeeeeee","ffffffffffffff")
 else
  mon.setCursorPos(1,1)
  mon.blit("Reactor Inactive","eeeeeeeeeeeeeeee","ffffffffffffffff")
end


--coil active variable 
coilengaged = turbine.getInductorEngaged()
--turbine active variable 
turbineactive = turbine.getActive()
reactoractive = reactor.getActive()
--turbine energy percentage variable 
energyp = turbine.getEnergyStored() / turbine.getEnergyCapacity() * 100
energypflo = math.floor(tenergyp * 1) / 1

--display if the turbine is active or not
 if turbineactive == true then 
  mon.setCursorPos(16,7)
  mon.blit("Turbine Active","eeeeeeeeeeeeee","ffffffffffffff")
 end
  mon.setCursorPos(11,7)
  mon.blit("Turbine Inactive","eeeeeeeeeeeeeeee","ffffffffffffffff")
end

--display if the inductor coil is engaged or not
 if coilengaged == true then
  mon.setCursorPos(11,9)
  mon.blit("Turbine Coil Engaged","dddddddddddddddddddd","ffffffffffffffffffff")
 else 
  mon.setCursorPos(11,9)
  mon.blit("Turbine Coil Disengaged","eeeeeeeeeeeeeeeeeeeeeee","fffffffffffffffffffffff")
end

--create a divider in the center of a 2x4 monitor setup
i = 0 
  for i = 0,12 do
    mon.setCursorPos(25,i+1)
    mon.write("|")
  end 
end
  
  
  
  





