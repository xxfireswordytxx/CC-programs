while true do 


--local variables 
local turbine = peripheral.wrap("left")
local reactor = peripheral.wrap("right")
local mon = peripheral.wrap("top")

--other variables 
coilengaged = turbine.getInductorEngaged()
turbineactive = turbine.getActive()
reactoractive = reactor.getActive()

energyp = turbine.getEnergyStored() / turbine.getEnergyCapacity() * 100
energypflo = math.floor(tenergyp * 1) / 1

rftempflo = math.floor(reactor.getFuelTemperature() * 100) / 100
rctempflo = math.floor(reactor.getCasingTemperature() * 100) / 100
turotspeflo = math.floor(turbine.getRotorSpeed() * 100) / 100

rcoolantp = reactor.getCoolantAmount() / reactor.getCoolantAmountMax()
rcoolantflo = math.floor(rcoolantp * 1) / 1

rwaste = math.floor(reactor.getWasteAmount() * 100) / 100

ctrlrodp = reactor.getControlRodLevel(1)
--refresh time 
  os.sleep(0.2)
  
--monitor output
  mon.clear()
  mon.setCursorPos(1,2)
  mon.write("Fuel Temp")
  mon.setCursorPos(13,2)
  mon.write(rftempflo)
 
  mon.setCursorPos(1,3)
  mon.write("Casing Temp")
  mon.setCursorPos(13,3)
  mon.write(rctempflo)
 
  mon.setCursorPos(1,4)
  mon.write("Coolant") 
  mon.setCursorPos(13,4)
  mon.write(rcoolantflo.."%")
 
  mon.setCursorPos(1,5)   
  mon.write("Waste")
  mon.setCursorPos(13,5)
  mon.write(rwaste.."mb")
 
  mon.setCursorPos(1,6)
  mon.write("Control Rods")
  mon.setCursorPos(13,6)
  mon.write(ctrlrodp.."%")
 
 if coilengaged == true then
  mon.setCursorPos(11,9)
  mon.blit("Turbine Coil Engaged","dddddddddddddddddddd","ffffffffffffffffffff")
 else 
  mon.setCursorPos(11,9)
  mon.blit("Turbine Coil Disengaged","eeeeeeeeeeeeeeeeeeeeeee","fffffffffffffffffffffff")
 end
 
 if reactoractive == true then
  mon.setCursorPos(1,1)
  mon.blit("Reactor Active","eeeeeeeeeeeeee","ffffffffffffff")
 else
  mon.setCursorPos(1,1)
  mon.blit("Reactor Inactive","eeeeeeeeeeeeeeee","ffffffffffffffff")
 end
 
 if turbineactive == true then 
  mon.setCursorPos(16,7)
  mon.blit("Turbine Active","eeeeeeeeeeeeee","ffffffffffffff")
 end
  mon.setCursorPos(11,7)
  mon.blit("Turbine Inactive","eeeeeeeeeeeeeeee","ffffffffffffffff")




  i = 0
for i = 0,12 do
    mon.setCursorPos(15, i + 1)
    mon.write("|")
end












end
  
  
  
  





