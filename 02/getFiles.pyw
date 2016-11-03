import os

f = open("README", "w")
for file in os.listdir("."):
    if(file.endswith(".hdl")):
        f.write(file+"\n")
