-- ChessAI.lua
-- Roblox Chess AI Module
-- Minimax + Alpha Beta

local ChessAI = {}

local Values = {
	P = 100,
	N = 320,
	B = 330,
	R = 500,
	Q = 900,
	K = 20000
}


local function Evaluate(board)

	local score = 0

	for x = 1,8 do
		for y = 1,8 do

			local piece = board[x][y]

			if piece then

				local value = Values[piece.Type] or 0

				if piece.Color == "White" then
					score += value
				else
					score -= value
				end

			end
		end
	end

	return score
end



local function CloneBoard(board)

	local new = {}

	for x = 1,8 do

		new[x] = {}

		for y = 1,8 do
			new[x][y] = board[x][y]
		end

	end

	return new
end



local function GetMoves(board,color)

	local moves = {}

	-- 下一步会连接 ChessRules.lua
	-- 这里暂时返回空列表

	return moves

end



local function MakeMove(board,move)

	local copy = CloneBoard(board)

	copy[move.to[1]][move.to[2]]
	=
	copy[move.from[1]][move.from[2]]

	copy[move.from[1]][move.from[2]]
	=nil


	return copy
end




local function Minimax(board,depth,alpha,beta,maximizing)


	if depth == 0 then
		return Evaluate(board),nil
	end


	local color

	if maximizing then
		color="White"
	else
		color="Black"
	end


	local moves = GetMoves(board,color)


	local bestMove=nil



	if maximizing then

		local best=-math.huge


		for _,move in pairs(moves) do


			local newBoard =
				MakeMove(board,move)


			local score =
				Minimax(
					newBoard,
					depth-1,
					alpha,
					beta,
					false
				)


			if score > best then

				best = score
				bestMove = move

			end


			alpha =
				math.max(alpha,score)


			if beta <= alpha then
				break
			end

		end


		return best,bestMove


	else


		local best=math.huge


		for _,move in pairs(moves) do


			local newBoard =
				MakeMove(board,move)


			local score =
				Minimax(
					newBoard,
					depth-1,
					alpha,
					beta,
					true
				)


			if score < best then

				best = score
				bestMove = move

			end


			beta =
				math.min(beta,score)


			if beta <= alpha then
				break
			end

		end


		return best,bestMove

	end

end





function ChessAI.GetBestMove(board,level)

	local depth =
		math.clamp(level,1,8)


	local _,move =
		Minimax(
			board,
			depth,
			-math.huge,
			math.huge,
			true
		)


	return move

end



return ChessAI
