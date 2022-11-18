while true do 


--local variables 
local turbine = peripheral.wrap("left")
local reactor = peripheral.wrap("right")
local mon = peripheral.wrap("top")

--other variables 
coilengaged = turbine.getInductorEngaged()
turbineactive = turbine.getActive()
reactoractive = reactor.getActive()
 
energy = turbine.getEnergyStored()
energym = turbine.getEnergyCapacity()
energyp = tenergy / tenergym * 100
energypflo = math.floor(tenergyp * 100) / 100

rftemp = reactor.getFuelTemperature()
rftempflo = math.floor(rftemp * 100) / 100
rctemp = reactor.getCasingTemperature()
rctempflo = math.floor(rctemp * 100) / 100

turotspe = turbine.getRotorSpeed()
turotspeflo = math.floor(turotspe * 100) / 100
 
--refresh time 
  os.sleep(0.2)
  
--monitor output
  mon.clear()
  mon.setCursorPos(1,2)
  mon.write("r temp")
  mon.setCursorPos(11,2)
  mon.write(rftempflo)
 
  mon.setCursorPos(1,3)
  mon.write("rc temp")
  mon.setCursorPos(11,3)
  mon.write(rctempflo)
 
  mon.setCursorPos(1,4)
  mon.write("") 
  mon.setCursorPos(11,4)
  mon.write()
 
  mon.setCursorPos(1,5)   
  mon.write("")
  mon.setCursorPos(11,5)
  mon.write()
 
  mon.setCursorPos(1,6)
  mon.write("")
  mon.setCursorPos(11,6)
  mon.write()
 
 if coilengaged == true then
  mon.setCursorPos(11,9)
  mon.blit("Turbine Coil Engaged","dddddddddddd","ffffffffffff")
 else 
  mon.setCursorPos(11,9)
  mon.blit("Turbine Coil Disengaged","ddddddddddddddd","fffffffffffffff")
 end
 
 if reactoractive == true then
  mon.setCursorPos(1,1)
  mon.blit("Reactor Active","eeeeeeeeeeeeee","ffffffffffffff")
 else
  mon.setCursorPos(1,1)
  mon.blit("Reactor Inactive","eeeeeeeeeeeeeeee","ffffffffffffffff")
 end
 
 if turbineactive == true then 
  mon.setCursorPos(11,7)
  mon.blit("Turbine Active","eeeeeeeeeeeeee","ffffffffffffff")
 end
  mon.setCursorPos(11,7)
  mon.blit("Turbine Inactive","eeeeeeeeeeeeeeee","ffffffffffffffff")
 end
  
  

  
  
  
  
  





