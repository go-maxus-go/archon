import os

packages = []

file = open("packages.txt", "r")
data = file.read()
file.close()

lines = data.splitlines()
for line in lines:
    line = line.split("#")[0]
    line = line.strip()
    if line != "":
        packages.append(line)

packages = " ".join(packages)
os.system("sudo pacman --noconfirm -S {0}".format(packages))
