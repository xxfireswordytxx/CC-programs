local method = peripheral.getMethods("back")

local tablestring = textutils.serialise(method)

local file = fs.open("out.txt", "w")
file.write(tablestring)
file.close()

