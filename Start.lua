-- Start.lua
-- Chess AI System Entry

print("==========")
print("Chess AI Starting...")
print("==========")


local ChessAI = require(script.Parent.ChessAI)
local ChessRules = require(script.Parent.ChessRules)
local ChessController = require(script.Parent.ChessController)
local ChessGUI = require(script.Parent.ChessGUI)
local ServerValidator = require(script.Parent.ServerValidator)


print("ChessAI Loaded")
print("ChessRules Loaded")
print("ChessController Loaded")
print("ChessGUI Loaded")
print("ServerValidator Loaded")


ChessController.SetLevel(5)
ChessController.SetWaitTime(3)


print("Chess AI System Ready")
