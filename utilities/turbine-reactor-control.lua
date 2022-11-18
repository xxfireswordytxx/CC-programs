local turbine = peripheral.wrap("left")
local reactor = peripheral.wrap("right")
local mon = peripheral.wrap("top")

tenergy = turbine.getEnergyStored()
tenergym = turbine.getEnergyCapacity()
tenergyp = tenergy / tenergym * 100
tenergypflo = math.floor(tenergyp * 100) / 100

rftemp = reactor.getFuelTemperature()
rftempflo = math.floor(rftemp * 100) / 100
rctemp = reactor.getCasingTemperature()
rctempflo = math.floor(rctemp * 100) / 100

turotspe = turbine.getRotorSpeed()

