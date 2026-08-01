-- ServerValidator.lua
-- Chess Server Move Validation

local ServerValidator = {}


ServerValidator.Board = nil



function ServerValidator.SetBoard(board)

	ServerValidator.Board = board

end



-- 检查坐标是否有效

local function ValidPosition(pos)

	return
		pos
		and pos[1]>=1
		and pos[1]<=8
		and pos[2]>=1
		and pos[2]<=8

end




function ServerValidator.CheckMove(move)


	if not ServerValidator.Board then

		return false,"No board"

	end



	if not ValidPosition(move.from)
	or not ValidPosition(move.to) then

		return false,"Invalid position"

	end



	local piece =
		ServerValidator.Board
		[move.from[1]]
		[move.from[2]]



	if not piece then

		return false,"No piece"

	end



	-- 检查目标位置

	local target =
		ServerValidator.Board
		[move.to[1]]
		[move.to[2]]



	if target
	and target.Color == piece.Color then

		return false,"Cannot capture own piece"

	end



	-- 基础通过

	return true,"Move accepted"


end




function ServerValidator.ApplyMove(move)


	local piece =
		ServerValidator.Board
		[move.from[1]]
		[move.from[2]]



	ServerValidator.Board
	[move.to[1]]
	[move.to[2]]
	=
	piece



	ServerValidator.Board
	[move.from[1]]
	[move.from[2]]
	=
	nil


end



return ServerValidator
