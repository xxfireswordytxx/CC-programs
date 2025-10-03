--define local vars
local me = peripheral.find("meBridge")

--define global vars for config
item = "ae2:fluix_crystal"
amount = 128
side = "right"

function fluix() 
    me.exportItem({name="ae2:charged_certus_quartz_crystal", count=32}, side)
    me.exportItem({name="ae2:fluix_dust", count=32}, side)
end

function certus()
    me.exportItem({name="ae2:charged_certus_quartz_crystal", count=16}, side)
    me.exportItem({name="ae2:certus_quartz_dust", count=16}, side)
end

function chargedcertus()
    me.exportItem({name="ae2:certus_quartz_crystal", count=64}, side)
end

--set loop
while true do 
    i = me.getItem({name = item})
    if item.count <= a then
        for _, math.ceil(amount/64) do
            fluix()
        end
        for _, math.ceil(amount/64) do
            os.sleep(10)
            me.importItem({name = item, count=64}, side)
        end
    end  
end