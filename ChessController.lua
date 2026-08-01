-- ChessController.lua
-- Controls automatic chess playing

local ChessController = {}

local ChessAI = require(script.Parent.ChessAI)
local ChessRules = require(script.Parent.ChessRules)


ChessController.Enabled = false

ChessController.AILevel = 5
ChessController.WaitTime = 3


-- 当前棋盘
ChessController.Board = nil


-- 当前玩家颜色
ChessController.Color = "White"



function ChessController.SetBoard(board)

	ChessController.Board = board

end



function ChessController.SetLevel(level)

	ChessController.AILevel = math.clamp(level,1,8)

end



function ChessController.SetWaitTime(time)

	ChessController.WaitTime = math.max(time,0)

end



function ChessController.Start()

	ChessController.Enabled = true

	print("Auto Chess Enabled")

end



function ChessController.Stop()

	ChessController.Enabled = false

	print("Auto Chess Disabled")

end



-- 等待然后下棋

function ChessController.PlayTurn()


	if not ChessController.Enabled then
		return
	end


	if not ChessController.Board then
		warn("No chess board")
		return
	end



	task.wait(ChessController.WaitTime)



	local move =
		ChessAI.GetBestMove(
			ChessController.Board,
			ChessController.AILevel
		)



	if move then

		print(
			"AI Move:",
			move.from[1],
			move.from[2],
			"to",
			move.to[1],
			move.to[2]
		)


		-- 这里连接你的棋子移动系统
		-- 例如：
		-- ChessBoard.MovePiece(move)

	else

		print("No available move")

	end


end



return ChessController
