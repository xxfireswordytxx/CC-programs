local method = peripheral.getMethods("back")

local file = fs.open("out.txt, "w")
file.write(method)
file.close()
