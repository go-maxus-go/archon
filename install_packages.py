import os

packages = []
commands = []

file = open("packages.txt", "r")
data = file.read()
file.close()

lines = data.splitlines()
for line in lines:
    line = line.split("#")[0]
    line = line.strip()
    if line == "":
        continue

    if line[0] == "$":
        line = line[1:].strip()
        commands.append(line)
    else:
        packages.append(line)

packages = " ".join(packages)
os.system("sudo pacman --noconfirm -S {0}".format(packages))

for command in commands:
    os.system(command)
