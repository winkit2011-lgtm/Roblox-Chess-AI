-- Start.lua
print("Chess AI System Starting...")


local Main = loadstring(game:HttpGet(
"https://raw.githubusercontent.com/winkit2011-lgtm/Roblox-Chess-AI/main/Main.lua"
))()


print("Main Loaded")


if Main.Start then
	Main.Start()
	print("Chess AI Started")
else
	print("Main Start function not found")
end
