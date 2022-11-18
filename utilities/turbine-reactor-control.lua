while true do 


--local variables 
local turbine = peripheral.wrap("left")
local reactor = peripheral.wrap("right")
local mon = peripheral.wrap("top")

--other variables 
tenergy = turbine.getEnergyStored()
tenergym = turbine.getEnergyCapacity()
tenergyp = tenergy / tenergym * 100
tenergypflo = math.floor(tenergyp * 100) / 100

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
  
  
  
  
  
  





