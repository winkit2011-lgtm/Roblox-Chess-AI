-- Main.lua
-- Roblox Chess AI System Starter

local System = {}


local ChessAI = require(script.Parent.ChessAI)
local ChessRules = require(script.Parent.ChessRules)
local ChessController = require(script.Parent.ChessController)
local ChessGUI = require(script.Parent.ChessGUI)
local ServerValidator = require(script.Parent.ServerValidator)



function System.Start()

	print("====================")
	print("Chess AI System Start")
	print("====================")


	-- 初始化 GUI

	local GUI =
		ChessGUI.Create()


	print("GUI Loaded")


	-- 默认设置

	ChessController.SetLevel(5)

	ChessController.SetWaitTime(3)


	print("AI Level: 5")

	print("Wait Time: 3 seconds")


	print("Server Validator Ready")

	print("Chess AI Ready")

end



return System
